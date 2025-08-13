package com.makani.utilities.mock;

import com.makani.utilities.interfaceadapters.AESGCMEncryptionService;

import java.io.IOException;
import java.net.URISyntaxException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import static java.nio.charset.StandardCharsets.UTF_8;

public class MockDataEncryptor {

    // Pattern to capture one full INSERT statement for each table
    private static final Pattern EMPLOYEE_INSERT_PATTERN = Pattern.compile(
            "INSERT INTO employee\\s*\\([^)]*\\)\\s*VALUES\\s*(.+?);",
            Pattern.DOTALL | Pattern.CASE_INSENSITIVE
    );

    private static final Pattern COLLABORATOR_INSERT_PATTERN = Pattern.compile(
            "INSERT INTO collaborator\\s*\\([^)]*\\)\\s*VALUES\\s*(.+?);",
            Pattern.DOTALL | Pattern.CASE_INSENSITIVE
    );

    private static final Pattern ADULT_STUDENT_INSERT_PATTERN = Pattern.compile(
            "INSERT INTO adult_student\\s*\\([^)]*\\)\\s*VALUES\\s*(.+?);",
            Pattern.DOTALL | Pattern.CASE_INSENSITIVE
    );

    private static final Pattern MINOR_STUDENT_INSERT_PATTERN = Pattern.compile(
            "INSERT INTO minor_student\\s*\\([^)]*\\)\\s*VALUES\\s*(.+?);",
            Pattern.DOTALL | Pattern.CASE_INSENSITIVE
    );

    private static final Pattern TUTOR_INSERT_PATTERN = Pattern.compile(
            "INSERT INTO tutor\\s*\\([^)]*\\)\\s*VALUES\\s*(.+?);",
            Pattern.DOTALL | Pattern.CASE_INSENSITIVE
    );

    // New pattern for internal_auth
    private static final Pattern INTERNAL_AUTH_INSERT_PATTERN = Pattern.compile(
            "INSERT INTO internal_auth\\s*\\([^)]*\\)\\s*VALUES\\s*(.+?);",
            Pattern.DOTALL | Pattern.CASE_INSENSITIVE
    );

    private static final int EMPLOYEE_ENTITY = 1;
    private static final int COLLABORATOR_ENTITY = 2;
    private static final int ADULT_STUDENT_ENTITY = 3;
    private static final int MINOR_STUDENT_ENTITY = 4;
    private static final int TUTOR_ENTITY = 5;
    private static final int INTERNAL_AUTH_ENTITY = 6; // New constant

    private final AESGCMEncryptionService encryptionService;
    private final HashingService hashingService;

    // Use a counter for person_pii_id. For real scenarios, ensure this is unique across runs/instances.
    private long piiIdCounter = 100000;

    public MockDataEncryptor(AESGCMEncryptionService encryptionService) {
        this.encryptionService = encryptionService;
        try {
            this.hashingService = new HashingService();
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException("Failed to initialize HashingService", e);
        }
    }

    /**
     * Processes SQL INSERT statements for a given entity type, encrypting sensitive fields
     * and generating PII inserts where applicable.
     *
     * @param content       The full SQL script content.
     * @param entityType    The integer representing the entity type (EMPLOYEE_ENTITY, etc.).
     * @param insertPattern The regex pattern for the specific entity's INSERT statement.
     * @return The modified SQL content with encrypted values and PII inserts.
     */
    public String processEntity(String content, int entityType, Pattern insertPattern) {
        Matcher insertMatcher = insertPattern.matcher(content);
        StringBuffer outputBuffer = new StringBuffer();

        while (insertMatcher.find()) {
            String fullInsertStatement = insertMatcher.group(0);
            String valuesBlock = insertMatcher.group(1);
            List<String> generatedSqlBlocks = new ArrayList<>();

            List<String> tuples = splitTuples(valuesBlock);

            for (String originalTuple : tuples) {
                String inner = originalTuple.substring(1, originalTuple.length() - 1).trim();
                List<String> fields = splitSqlTuple(inner);

                List<String> currentBlock = new ArrayList<>();

                // 1. Add original non-encrypted values as a comment BEFORE any insert statements for this row
                currentBlock.add("-- Original (non-encrypted) data for " + getEntityName(entityType) + ":");
                currentBlock.add("-- " + fullInsertStatement.replace(valuesBlock, originalTuple) + "\n");


                String mainEntityInsertStatement = "";

                if (entityType == INTERNAL_AUTH_ENTITY) {
                    // InternalAuth does NOT link to person_pii
                    mainEntityInsertStatement = generateInternalAuthInsert(fields);
                } else {
                    // All other entities link to person_pii, so generate PII insert first
                    long currentPiiId = piiIdCounter++;
                    String piiInsertStatement = getPersonPiiInsertStatement(fields, currentPiiId);
                    currentBlock.add(piiInsertStatement);

                    mainEntityInsertStatement = generateLinkedEntityInsert(entityType, fields, currentPiiId);
                }
                currentBlock.add(mainEntityInsertStatement);

                generatedSqlBlocks.add(String.join("\n", currentBlock));
            }

            insertMatcher.appendReplacement(
                    outputBuffer,
                    Matcher.quoteReplacement(String.join("\n\n", generatedSqlBlocks))
            );
        }

        insertMatcher.appendTail(outputBuffer);

        return outputBuffer.toString();
    }

    /**
     * Helper to get the entity name for comments.
     */
    private String getEntityName(int entityType) {
        return switch (entityType) {
            case EMPLOYEE_ENTITY -> "employee";
            case COLLABORATOR_ENTITY -> "collaborator";
            case ADULT_STUDENT_ENTITY -> "adult_student";
            case MINOR_STUDENT_ENTITY -> "minor_student";
            case TUTOR_ENTITY -> "tutor";
            case INTERNAL_AUTH_ENTITY -> "internal_auth"; // New case
            default -> "unknown_entity";
        };
    }

    /**
     * Generates the INSERT statement for the person_pii table.
     * This method assumes fields are passed in the order from the original mock data:
     * id (original entity's ID, not used for person_pii_id), first_name, last_name, email, phone, address, zip_code.
     *
     * @param fields The raw fields from the original entity tuple.
     * @param piiId  The generated person_pii_id for this record.
     * @return The INSERT statement for person_pii.
     */
    private String getPersonPiiInsertStatement(List<String> fields, long piiId) {
        // Fields from original mock data row (based on common mock data structure):
        // [0] original_entity_id, [1]firstName, [2]lastName, [3]email, [4]phone, [5]address, [6]zipCode, ...
        String firstName = trimQuotes(fields.get(1));
        String lastName = trimQuotes(fields.get(2));
        String email = trimQuotes(fields.get(3));
        String phone = trimQuotes(fields.get(4));
        String address = trimQuotes(fields.get(5));
        String zipCode = trimQuotes(fields.get(6));

        String encryptedFirstName = encrypt(firstName);
        String encryptedLastName = encrypt(lastName);
        String encryptedEmail = encrypt(email);
        String encryptedPhoneNumber = encrypt(phone);
        String encryptedAddress = encrypt(address);
        String encryptedZipCode = encrypt(zipCode);

        String emailHash = hashingService.hash(email);
        String phoneNumberHash = hashingService.hash(phone);

        return String.format(
                "INSERT INTO person_pii (person_pii_id, encrypted_first_name, encrypted_last_name, encrypted_phone_number, encrypted_email, encrypted_address, encrypted_zip_code, phone_number_hash, email_hash) VALUES (%d, '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s');",
                piiId,
                encryptedFirstName,
                encryptedLastName,
                encryptedPhoneNumber,
                encryptedEmail,
                encryptedAddress,
                encryptedZipCode,
                phoneNumberHash,
                emailHash
        );
    }

    /**
     * Generates the full INSERT statement for entities that link to person_pii (Employee, Collaborator, AdultStudent, MinorStudent, Tutor).
     * This method assumes fields are passed in the order defined in the original mock data inserts.
     *
     * @param entityType The type of entity.
     * @param fields     The raw fields from the original entity tuple.
     * @param piiId      The person_pii_id to link to.
     * @return The formatted full INSERT statement for the main entity table.
     */
    private String generateLinkedEntityInsert(int entityType, List<String> fields, long piiId) {
        String id = fields.get(0).trim(); // Entity's own ID
        String createdAt = getCurrentTimestampForSQL(); // Use current timestamp for created_at

        String valuesTuple = "";
        String columns = "";

        switch (entityType) {
            case EMPLOYEE_ENTITY:
                // Original Employee fields indices (from provided example's previous iteration):
                // [0]id, [1]firstName, [2]lastName, [3]email, [4]phone, [5]address, [6]zipCode, [7]employeeType, [8]internalAuthId, [9]birthdate
                // DDL Employee columns: employee_id, employee_type, birthdate, internal_auth_id, person_pii_id, created_at
                String employeeType = trimQuotes(fields.get(7));
                String internalAuthId = fields.get(8).trim();
                String employeeBirthdate = trimQuotes(fields.get(9));

                columns = "employee_id, employee_type, birthdate, internal_auth_id, person_pii_id, created_at";
                valuesTuple = String.format(
                        "(%s, '%s', '%s', %s, %d, '%s')",
                        id,
                        employeeType,
                        employeeBirthdate,
                        internalAuthId,
                        piiId,
                        createdAt
                );
                break;

            case COLLABORATOR_ENTITY:
                // Original Collaborator fields indices:
                // [0]id, [1]firstName, [2]lastName, [3]email, [4]phone, [5]address, [6]zipCode, [7]internalAuthId, [8]skills, [9]profilePicture, [10]birthdate
                // DDL Collaborator columns: collaborator_id, internal_auth_id, encrypted_profile_picture, skills, birthdate, person_pii_id, created_at
                String authIdCollab = fields.get(7).trim();
                String skills = trimQuotes(fields.get(8)); // Skills are NOT encrypted per DDL
                String profilePictureCollab = fields.get(9).trim(); // Can be 'NULL' or actual value
                String collaboratorBirthdate = trimQuotes(fields.get(10));

                columns = "collaborator_id, internal_auth_id, encrypted_profile_picture, skills, birthdate, person_pii_id, created_at";
                valuesTuple = String.format(
                        "(%s, %s, %s, '%s', '%s', %d, '%s')",
                        id,
                        authIdCollab,
                        encryptNullable(profilePictureCollab), // encrypted_profile_picture
                        skills, // skills (VARCHAR(100) NOT NULL, not encrypted)
                        collaboratorBirthdate,
                        piiId,
                        createdAt
                );
                break;

            case ADULT_STUDENT_ENTITY:
                // Original Adult Student fields indices:
                // [0]id, [1]firstName, [2]lastName, [3]email, [4]phone, [5]address, [6]zipCode, [7]customerAuthId, [8]profilePicture, [9]birthdate
                // DDL Adult Student columns: adult_student_id, customer_auth_id, birthdate, encrypted_profile_picture, person_pii_id, created_at
                String customerAuthAdult = fields.get(7).trim();
                String profilePictureAdult = fields.get(8).trim(); // Can be 'NULL' or actual value
                String adultBirthdate = trimQuotes(fields.get(9));

                columns = "adult_student_id, customer_auth_id, birthdate, encrypted_profile_picture, person_pii_id, created_at";
                valuesTuple = String.format(
                        "(%s, %s, '%s', %s, %d, '%s')",
                        id,
                        customerAuthAdult,
                        adultBirthdate,
                        encryptNullable(profilePictureAdult), // encrypted_profile_picture
                        piiId,
                        createdAt
                );
                break;

            case MINOR_STUDENT_ENTITY:
                // Original Minor Student fields indices (based on common mock data structure with ID, PII fields, then entity specific fields):
                // [0]id, [1]firstName, [2]lastName, [3]email, [4]phone, [5]address, [6]zipCode, [7]birthdate, [8]profilePicture, [9]customerAuthId, [10]tutorId
                // DDL Minor Student columns: minor_student_id, birthdate, encrypted_profile_picture, customer_auth_id, tutor_id, person_pii_id, created_at
                String minorBirthdate = trimQuotes(fields.get(7));
                String profilePictureMinor = fields.get(8).trim();
                String customerAuthMinor = fields.get(9).trim();
                String tutorIdMinor = fields.get(10).trim();

                columns = "minor_student_id, birthdate, encrypted_profile_picture, customer_auth_id, tutor_id, person_pii_id, created_at";
                valuesTuple = String.format(
                        "(%s, '%s', %s, %s, %s, %d, '%s')",
                        id,
                        minorBirthdate,
                        encryptNullable(profilePictureMinor), // encrypted_profile_picture
                        customerAuthMinor,
                        tutorIdMinor,
                        piiId,
                        createdAt
                );
                break;

            case TUTOR_ENTITY:
                // Original Tutor fields indices (based on the original structure from your last request, now includes birthdate):
                // [0]id, [1]firstName, [2]lastName, [3]email, [4]phone, [5]customerAuthId, [6]birthdate (ASSUMED INDEX)
                // DDL Tutor columns: tutor_id, birthdate, customer_auth_id, person_pii_id, created_at
                String tutorId = fields.get(0).trim();
                String customerAuthId = fields.get(5).trim();
                String tutorBirthdate = trimQuotes(fields.get(6)); // Assuming birthdate is at index 6

                columns = "tutor_id, birthdate, customer_auth_id, person_pii_id, created_at";
                valuesTuple = String.format(
                        "(%s, '%s', %s, %d, '%s')",
                        tutorId,
                        tutorBirthdate,
                        customerAuthId,
                        piiId,
                        createdAt
                );
                break;

            default:
                throw new IllegalArgumentException("Unsupported entity for PII linkage: " + entityType);
        }

        return String.format("INSERT INTO %s (%s) VALUES %s;", getEntityName(entityType), columns, valuesTuple);
    }

    /**
     * Generates the full INSERT statement for the internal_auth table.
     *
     * @param fields The raw fields from the original entity tuple: username, password, role.
     * @return The formatted full INSERT statement for the internal_auth table.
     */
    private String generateInternalAuthInsert(List<String> fields) {
        // Original internal_auth fields assumed from mock data input:
        // [0]username, [1]password, [2]role
        // DDL: internal_auth_id (AUTO_INCREMENT), encrypted_username, encrypted_password, encrypted_role

        String username = trimQuotes(fields.get(0));
        String password = trimQuotes(fields.get(1));
        String role = trimQuotes(fields.get(2));

        String encryptedUsername = encrypt(username);
        // WARNING: For production systems, passwords should generally be hashed (one-way), NOT reversibly encrypted.
        String encryptedPassword = encrypt(password);
        String encryptedRole = encrypt(role);

        String columns = "encrypted_username, encrypted_password, encrypted_role";
        String valuesTuple = String.format(
                "('%s', '%s', '%s')",
                encryptedUsername,
                encryptedPassword,
                encryptedRole
        );
        return String.format("INSERT INTO internal_auth (%s) VALUES %s;", columns, valuesTuple);
    }


    /**
     * Helper to get current timestamp in 'YYYY-MM-DD HH:MM:SS' format for SQL.
     */
    private String getCurrentTimestampForSQL() {
        return LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
    }

    /**
     * Helper to encrypt a string. Returns "NULL" if input is "NULL" (case-insensitive) or null.
     * Otherwise, returns the encrypted string wrapped in single quotes for SQL.
     */
    private String encryptNullable(String value) {
        if (value == null || value.trim().equalsIgnoreCase("NULL")) {
            return "NULL"; // Return unquoted NULL literal for SQL
        }
        return "'" + encrypt(value) + "'"; // Encrypt and wrap in quotes
    }

    /**
     * Helper to encrypt a string. Assumes value is not NULL.
     */
    private String encrypt(String value) {
        byte[] encryptedBytes = encryptionService.encrypt(value.getBytes(UTF_8));
        return bytesToHex(encryptedBytes);
    }

    /**
     * Splits the entire VALUES block of an INSERT statement into individual tuple strings.
     * Handles nested parentheses and quoted strings correctly.
     */
    public static List<String> splitTuples(String valuesBlock) {
        List<String> tuples = new ArrayList<>();
        int depth = 0;
        boolean inQuotes = false;
        StringBuilder current = new StringBuilder();

        for (int i = 0; i < valuesBlock.length(); i++) {
            char c = valuesBlock.charAt(i);

            if (c == '\'') {
                // Handle escaped quotes ('') inside a quoted string
                if (inQuotes && i + 1 < valuesBlock.length() && valuesBlock.charAt(i + 1) == '\'') {
                    current.append("''");
                    i++; // skip next quote as it's part of the escape
                    continue;
                }
                inQuotes = !inQuotes; // Toggle quote state
                current.append(c); // Append the quote itself
            } else if (!inQuotes) {
                if (c == '(') {
                    depth++;
                    current.append(c);
                } else if (c == ')') {
                    depth--;
                    current.append(c);
                    if (depth == 0) { // End of a top-level tuple
                        tuples.add(current.toString().trim());
                        current.setLength(0); // Reset for next tuple
                        // Skip possible comma and following whitespace after a tuple
                        while (i + 1 < valuesBlock.length() && (valuesBlock.charAt(i + 1) == ',' || Character.isWhitespace(valuesBlock.charAt(i + 1)))) {
                            i++;
                        }
                    }
                } else {
                    current.append(c);
                }
            } else {
                // Inside quotes, just append the character
                current.append(c);
            }
        }
        return tuples;
    }

    public void encryptFile(Path inputFilePath, Path outputFilePath) throws IOException {
        String content = Files.readString(inputFilePath, UTF_8);

        // Process each entity type
        content = processEntity(content, EMPLOYEE_ENTITY, EMPLOYEE_INSERT_PATTERN);
        content = processEntity(content, COLLABORATOR_ENTITY, COLLABORATOR_INSERT_PATTERN);
        content = processEntity(content, ADULT_STUDENT_ENTITY, ADULT_STUDENT_INSERT_PATTERN);
        content = processEntity(content, MINOR_STUDENT_ENTITY, MINOR_STUDENT_INSERT_PATTERN);
        content = processEntity(content, TUTOR_ENTITY, TUTOR_INSERT_PATTERN);
        content = processEntity(content, INTERNAL_AUTH_ENTITY, INTERNAL_AUTH_INSERT_PATTERN); // NEW: Process internal_auth

        Files.write(outputFilePath, content.getBytes(StandardCharsets.UTF_8));
    }

    /**
     * Splits a single SQL tuple string (e.g., "(1, 'value', NULL)") into a list of individual field strings.
     * Handles commas outside of quotes and escaped quotes.
     */
    private static List<String> splitSqlTuple(String tuple) {
        List<String> result = new ArrayList<>();
        boolean inQuotes = false;
        StringBuilder sb = new StringBuilder();

        for (int i = 0; i < tuple.length(); i++) {
            char c = tuple.charAt(i);

            if (c == '\'') {
                // Check for escaped quotes: ''
                if (inQuotes && i + 1 < tuple.length() && tuple.charAt(i + 1) == '\'') {
                    sb.append("''"); // Append the escaped quote
                    i++; // skip next quote
                } else {
                    inQuotes = !inQuotes;  // Toggle quote state
                    sb.append(c); // Append the quote itself
                }
            } else if (c == ',' && !inQuotes) {
                result.add(sb.toString().trim());
                sb.setLength(0);
            } else {
                sb.append(c);
            }
        }
        // Add the last token
        result.add(sb.toString().trim());

        return result;
    }

    /**
     * Removes leading/trailing single quotes from a string, and unescapes double single quotes (e.g., 'O''Connell' -> O'Connell).
     */
    private static String trimQuotes(String input) {
        input = input.trim();
        if (input.startsWith("'") && input.endsWith("'")) {
            return input.substring(1, input.length() - 1).replace("''", "'"); // Handle '' for '
        }
        return input;
    }

    /**
     * Converts a byte array to a hexadecimal string.
     */
    private String bytesToHex(byte[] bytes) {
        StringBuilder sb = new StringBuilder();
        for (byte b : bytes) {
            sb.append(String.format("%02x", b));
        }
        return sb.toString();
    }

    /**
     * Helper class for hashing strings using SHA-256.
     */
    private static class HashingService {
        private final MessageDigest digest;

        public HashingService() throws NoSuchAlgorithmException {
            this.digest = MessageDigest.getInstance("SHA-256");
        }

        public String hash(String value) {
            byte[] hashBytes = digest.digest(value.getBytes(UTF_8));
            return bytesToHex(hashBytes);
        }

        /**
         * Hashes a string. If the input is "NULL" (case-insensitive) or null, returns "NULL" (unquoted) for SQL.
         * Otherwise, returns the hashed string wrapped in single quotes for SQL.
         */
        public String hashNullable(String value) {
            if (value == null || value.trim().equalsIgnoreCase("NULL")) {
                return "NULL"; // Return unquoted NULL literal for SQL
            }
            return "'" + hash(value) + "'"; // Hash and wrap in quotes
        }

        private String bytesToHex(byte[] bytes) {
            StringBuilder sb = new StringBuilder();
            for (byte b : bytes) {
                sb.append(String.format("%02x", b));
            }
            return sb.toString();
        }


    }


    // Main for testing
    public static void main(String[] args) throws IOException, URISyntaxException {
        // IMPORTANT: In a real application, the encryption key should NEVER be hardcoded
        // and should be loaded securely from environment variables, a secret manager, etc.
        AESGCMEncryptionService encryptionService = new AESGCMEncryptionService("zZhnG8Pe0W9bOHWNDrqTNHC0sDIdVHEsCW/jJWPt1cI=");
        MockDataEncryptor encryptor = new MockDataEncryptor(encryptionService);

        // Define input and output file paths
        // Assuming 01-mock-data.sql is in src/main/resources
        Path inputFile = Paths.get("utilities/src/test/resources/01-mock-data.sql");
        Path outputFile = Paths.get("mock-data-encrypted.sql");

        if (!Files.exists(inputFile)) {
            System.err.println("Error: Input file not found at " + inputFile.toAbsolutePath());
            System.err.println("Please ensure '01-mock-data.sql' is in 'src/main/resources' or adjust the path.");
            return;
        }

        encryptor.encryptFile(inputFile, outputFile);

        System.out.println("Mock data encryption complete. Encrypted data written to: " + outputFile.toAbsolutePath());

    }
}