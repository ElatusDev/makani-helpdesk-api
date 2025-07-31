package com.makani.utilities.mock;

import com.makani.utilities.interfaceadapters.AESGCMEncryptionService;

import java.io.IOException;
import java.net.URISyntaxException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import static java.nio.charset.StandardCharsets.UTF_8;

public class MockDataEncryptor {

    // Pattern to capture one full INSERT statement for employee table
    private static final Pattern EMPLOYEE_INSERT_PATTERN = Pattern.compile(
            "INSERT INTO employee\\s*\\([^)]*\\)\\s*VALUES\\s*(.+?);",
            Pattern.DOTALL | Pattern.CASE_INSENSITIVE
    );

    // Pattern to capture one full INSERT statement for employee table
    private static final Pattern COLLABORATOR_INSERT_PATTERN = Pattern.compile(
            "INSERT INTO collaborator\\s*\\([^)]*\\)\\s*VALUES\\s*(.+?);",
            Pattern.DOTALL | Pattern.CASE_INSENSITIVE
    );

    // Pattern to capture one full INSERT statement for employee table
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

    // Pattern to extract individual tuples within the VALUES block
    private static final Pattern TUPLE_PATTERN = Pattern.compile("\\(([^()]*?(?:\\([^()]*\\)[^()]*)*?)\\)(?=,|\\s*;)", Pattern.DOTALL);


    private static final int EMPLOYEE = 1;
    private static final int COLLABORATOR = 2;
    private static final int ADULT_STUDENT = 3;
    private static final int MINOR_STUDENT = 4;
    private static final int TUTOR = 5;

    private final AESGCMEncryptionService encryptionService;

    public MockDataEncryptor(AESGCMEncryptionService encryptionService) {
        this.encryptionService = encryptionService;
    }

    public String processEntity(String content, int entity, Pattern insertPattern) {
        Matcher insertMatcher = insertPattern.matcher(content);
        StringBuffer outputBuffer = new StringBuffer();

        while (insertMatcher.find()) {
            String valuesBlock = insertMatcher.group(1);
            List<String> encryptedRows = new ArrayList<>();
            List<String> tuples = splitTuples(valuesBlock);

            for (String tuple : tuples) {
                String inner = tuple.substring(1, tuple.length() - 1).trim();
                String[] fields = splitSqlTuple(inner).toArray(new String[0]);
                String row = switch (entity) {
                    case EMPLOYEE -> getEmployeeEncryptedRow(fields, tuple);
                    case COLLABORATOR -> getCollaboratorEncryptedRow(fields, tuple);
                    case ADULT_STUDENT -> getAdultStudentEncryptedRow(fields, tuple);
                    case MINOR_STUDENT -> getMinorStudentEncryptedRow(fields, tuple);
                    case TUTOR -> getTutorEncryptedRow(fields, tuple);
                    default -> throw new IllegalArgumentException("Unsupported entity: " + entity);
                };

                encryptedRows.add(row);
            }

            // Proper replacement
            insertMatcher.appendReplacement(
                    outputBuffer,
                    Matcher.quoteReplacement(reconstructInsert(entity, encryptedRows))
            );
        }

        // ✅ This appends the rest of the file that wasn't matched
        insertMatcher.appendTail(outputBuffer);

        return outputBuffer.toString();
    }

    private String reconstructInsert(int entity, List<String> encryptedRows) {
        return switch (entity) {
            case EMPLOYEE ->
                    "INSERT INTO employee (employee_id, first_name, last_name, email, phone, address, zip_code, employee_type, internal_auth_id, birthdate) VALUES\n"
                            + String.join(",\n", encryptedRows) + ";";
            case COLLABORATOR ->
                    "INSERT INTO collaborator (collaborator_id, first_name, last_name, email, phone, address, zip_code, internal_auth_id, skills, profile_picture, birthdate) VALUES\n"
                            + String.join(",\n", encryptedRows) + ";";
            case ADULT_STUDENT ->
                    "INSERT INTO adult_student (adult_student_id, first_name, last_name, email, phone, address, zip_code, customer_auth_id, profile_picture, birthdate) VALUES\n"
                            + String.join(",\n", encryptedRows) + ";";
            case MINOR_STUDENT ->
                    "INSERT INTO minor_student (minor_student_id, first_name, last_name, email, phone, address, zip_code, customer_auth_id, tutor_id, profile_picture, birthdate) VALUES\n"
                            + String.join(",\n", encryptedRows) + ";";
            case TUTOR ->
                    "INSERT INTO tutor (first_name, last_name, email, phone, customer_auth_id) VALUES\n"
                            + String.join(",\n", encryptedRows) + ";";
            default -> "";
        };
    }

    private String getEmployeeEncryptedRow(String[] fields, String tuple) {
        if (fields.length != 10) {
            throw new IllegalArgumentException("Expected 10 fields per row but got: " + fields.length + " → " + tuple);
        }

        // Extract fields by index
        String id = fields[0].trim();
        String firstName = trimQuotes(fields[1]);
        String lastName = trimQuotes(fields[2]);
        String email = trimQuotes(fields[3]);
        String phone = trimQuotes(fields[4]);
        String address = trimQuotes(fields[5]);
        String zipCode = trimQuotes(fields[6]);
        String employeeType = trimQuotes(fields[7]);
        String internalAuthId = fields[8].trim();
        String birthdate = trimQuotes(fields[9]);

        return  String.format(
                "(%s, '%s', '%s', '%s', '%s', '%s', '%s', '%s', %s, '%s')",
                id,
                encrypt(firstName),
                encrypt(lastName),
                encrypt(email),
                encrypt(phone),
                encrypt(address),
                encrypt(zipCode),
                employeeType,
                internalAuthId,
                birthdate
        );
    }

    private String getAdultStudentEncryptedRow(String[] fields, String tuple) {
        if (fields.length != 10) {
            throw new IllegalArgumentException("Expected 9 fields per row but got: " + fields.length + " → " + tuple);
        }

        // Extract fields by index
        String id = fields[0].trim();
        String firstName = trimQuotes(fields[1]);
        String lastName = trimQuotes(fields[2]);
        String email = trimQuotes(fields[3]);
        String phone = trimQuotes(fields[4]);
        String address = trimQuotes(fields[5]);
        String zipCode = trimQuotes(fields[6]);
        String customerAuth = fields[7].trim();
        String profilePicture = fields[8].trim();
        String birthdate = trimQuotes(fields[9]);
        return  String.format(
                "(%s, '%s', '%s', '%s', '%s', '%s', '%s', %s, '%s', '%s')",
                id,
                encrypt(firstName),
                encrypt(lastName),
                encrypt(email),
                encrypt(phone),
                encrypt(address),
                encrypt(zipCode),
                customerAuth,
                encrypt(profilePicture),
                birthdate
        );
    }

    public String getCollaboratorEncryptedRow(String[] fields, String tuple) {
        if (fields.length != 11) {
            throw new IllegalArgumentException("Expected 11 fields per row but got: " + fields.length + " → " + tuple);
        }

        String id = fields[0].trim();
        String firstName = trimQuotes(fields[1]);
        String lastName = trimQuotes(fields[2]);
        String email = trimQuotes(fields[3]);
        String phone = trimQuotes(fields[4]);
        String address = trimQuotes(fields[5]);
        String zipCode = trimQuotes(fields[6]);
        String authId = fields[7].trim();
        String skills = trimQuotes(fields[8]);
        String profilePicture = fields[9].trim(); // could be NULL
        String birthdate = trimQuotes(fields[10]);

        return String.format("(%s, '%s', '%s', '%s', '%s', '%s', '%s', %s, '%s', '%s', '%s')",
                id,
                encrypt(firstName),
                encrypt(lastName),
                encrypt(email),
                encrypt(phone),
                encrypt(address),
                encrypt(zipCode),
                authId,
                encrypt(skills),
                encrypt(profilePicture),
                birthdate);
    }

    private String getMinorStudentEncryptedRow(String[] fields, String tuple) {
        if (fields.length != 11) {
            throw new IllegalArgumentException("Expected 11 fields per row but got: " + fields.length + " → " + tuple);
        }
        String id = fields[0].trim();
        String firstName = trimQuotes(fields[1]);
        String lastName = trimQuotes(fields[2]);
        String email = trimQuotes(fields[3]);
        String phone = trimQuotes(fields[4]);
        String address = trimQuotes(fields[5]);
        String zipCode = trimQuotes(fields[6]);
        String customerAuth = fields[7].trim();
        String tutorId = fields[8].trim();
        String profilePicture = fields[9].trim();
        String birthdate = trimQuotes(fields[10]);

        return String.format(
                "(%s, '%s', '%s', '%s', '%s', '%s', '%s', %s, %s, '%s', '%s')",
                id,
                encrypt(firstName),
                encrypt(lastName),
                encrypt(email),
                encrypt(phone),
                encrypt(address),
                encrypt(zipCode),
                customerAuth,
                tutorId,
                encrypt(profilePicture),
                birthdate
        );
    }

    private String getTutorEncryptedRow(String[] fields, String tuple) {
        if (fields.length != 6) {
            throw new IllegalArgumentException("Expected 6 fields per row but got: " + fields.length + " → " + tuple);
        }
        String id = fields[0].trim();
        String firstName = trimQuotes(fields[1]);
        String lastName = trimQuotes(fields[2]);
        String email = trimQuotes(fields[3]);
        String phone = trimQuotes(fields[4]);
        String customerAuth = fields[5].trim();

        return String.format(
                "(%s, '%s', '%s', '%s', '%s', %s)",
                id,
                encrypt(firstName),
                encrypt(lastName),
                encrypt(email),
                encrypt(phone),
                customerAuth
        );
    }

    public void encryptFile(Path inputFilePath, Path outputFilePath) throws IOException {
        String content = Files.readString(inputFilePath, UTF_8);

        content = processEntity(content, EMPLOYEE, EMPLOYEE_INSERT_PATTERN);
        content = processEntity(content, COLLABORATOR, COLLABORATOR_INSERT_PATTERN);
        content = processEntity(content, ADULT_STUDENT, ADULT_STUDENT_INSERT_PATTERN);
        content = processEntity(content, MINOR_STUDENT, MINOR_STUDENT_INSERT_PATTERN);
        content = processEntity(content, TUTOR, TUTOR_INSERT_PATTERN);

        Files.write(outputFilePath, content.getBytes(StandardCharsets.UTF_8));
    }

    public static List<String> splitTuples(String valuesBlock) {
        List<String> tuples = new ArrayList<>();
        int depth = 0;
        boolean inQuotes = false;
        StringBuilder current = new StringBuilder();

        for (int i = 0; i < valuesBlock.length(); i++) {
            char c = valuesBlock.charAt(i);

            if (c == '\'') {
                // Handle escaped quotes ('')
                if (inQuotes && i + 1 < valuesBlock.length() && valuesBlock.charAt(i + 1) == '\'') {
                    current.append("''");
                    i++; // skip next quote
                    continue;
                }
                inQuotes = !inQuotes;
                current.append(c);
            } else if (!inQuotes) {
                if (c == '(') {
                    depth++;
                    current.append(c);
                } else if (c == ')') {
                    depth--;
                    current.append(c);
                    if (depth == 0) {
                        // End of a tuple
                        tuples.add(current.toString().trim());
                        current.setLength(0);
                        // Skip possible comma and spaces after tuple
                        while (i + 1 < valuesBlock.length() && (valuesBlock.charAt(i + 1) == ',' || Character.isWhitespace(valuesBlock.charAt(i + 1)))) {
                            i++;
                        }
                    }
                } else {
                    current.append(c);
                }
            } else {
                // Inside quotes, just append
                current.append(c);
            }
        }

        return tuples;
    }

    private String encrypt(String value) {
        byte[] encryptedBytes = encryptionService.encrypt(value.getBytes(UTF_8));
        return bytesToHex(encryptedBytes);
    }

    private static List<String> splitSqlTuple(String tuple) {
        List<String> result = new ArrayList<>();
        boolean inQuotes = false;
        StringBuilder sb = new StringBuilder();

        for (int i = 0; i < tuple.length(); i++) {
            char c = tuple.charAt(i);

            if (c == '\'') {
                // Check for escaped quotes: ''
                if (inQuotes && i + 1 < tuple.length() && tuple.charAt(i + 1) == '\'') {
                    sb.append("''");
                    i++; // skip next quote
                } else {
                    inQuotes = !inQuotes;  // Toggle quote state
                    sb.append(c);
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


    private static String trimQuotes(String input) {
        input = input.trim();
        if (input.startsWith("'") && input.endsWith("'")) {
            return input.substring(1, input.length() - 1);
        }
        return input;
    }

    private String bytesToHex(byte[] bytes) {
        StringBuilder sb = new StringBuilder();
        for (byte b : bytes) {
            sb.append(String.format("%02x", b));
        }
        return sb.toString();
    }

    // Main for testing
    public static void main(String[] args) throws IOException, URISyntaxException {
        AESGCMEncryptionService encryptionService = new AESGCMEncryptionService("zZhnG8Pe0W9bOHWNDrqTNHC0sDIdVHEsCW/jJWPt1cI=");
        MockDataEncryptor encryptor = new MockDataEncryptor(encryptionService);

        // 4. Run encryption on the mock_data.sql
        Path inputFile = Paths.get(ClassLoader.getSystemResource("01-mock-data.sql").toURI());
        Path outputFile = Paths.get("mock-data-encrypted.sql");

        encryptor.encryptFile(inputFile, outputFile);

        System.out.println("Mock data encryption complete.");

    }
}
