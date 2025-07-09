package com.makani.utilities;

import java.io.IOException;
import java.net.URISyntaxException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class MockDataEncryptor {

    private final AESGCMEncryptionService encryptionService;

    public MockDataEncryptor(AESGCMEncryptionService encryptionService) {
        this.encryptionService = encryptionService;
    }

    public void encryptFile(Path inputFilePath, Path outputFilePath) throws IOException {
        String content = Files.readString(inputFilePath, StandardCharsets.UTF_8);

        // Pattern to capture one full INSERT statement for employee table
        Pattern employeeInsertPattern = Pattern.compile(
                "INSERT INTO employee\\s*\\([^)]*\\)\\s*VALUES\\s*(.+?);",
                Pattern.DOTALL | Pattern.CASE_INSENSITIVE
        );

        // Pattern to extract individual tuples within the VALUES block
        Pattern tuplePattern = Pattern.compile("\\([^)]*\\)(?:,\\s*)?", Pattern.DOTALL);

        Matcher insertMatcher = employeeInsertPattern.matcher(content);

        StringBuffer outputBuffer = new StringBuffer();

        while (insertMatcher.find()) {
            String valuesBlock = insertMatcher.group(1); // all tuples as a single string

            Matcher tupleMatcher = tuplePattern.matcher(valuesBlock);
            List<String> encryptedRows = new ArrayList<>();

            while (tupleMatcher.find()) {
                String tuple = tupleMatcher.group();

                // Trim trailing comma if present
                tuple = tuple.trim();
                if (tuple.endsWith(",")) {
                    tuple = tuple.substring(0, tuple.length() - 1).trim();
                }

                // Remove surrounding parentheses
                String inner = tuple.substring(1, tuple.length() - 1);

                // Split fields carefully on commas outside quotes
                String[] fields = splitSqlTuple(inner).toArray(new String[0]);

                if (fields.length != 9) {
                    throw new IllegalArgumentException("Expected 9 fields per row but got: " + fields.length + " → " + tuple);
                }

                // Extract fields by index
                String firstName = trimQuotes(fields[0]);
                String lastName = trimQuotes(fields[1]);
                String email = trimQuotes(fields[2]);
                String phone = trimQuotes(fields[3]);
                String address = trimQuotes(fields[4]);
                String zipCode = trimQuotes(fields[5]);
                String employeeType = trimQuotes(fields[6]);
                String internalAuthId = fields[7].trim();
                String birthdate = trimQuotes(fields[8]);

                String encryptedRow = String.format(
                        "('%s', '%s', '%s', '%s', '%s', '%s', '%s', %s, '%s')",
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

                encryptedRows.add(encryptedRow);
            }

            // Reconstruct full INSERT with encrypted rows
            String reconstructedInsert = "INSERT INTO employee (first_name, last_name, email, phone, address, zip_code, employee_type, internal_auth_id, birthdate) VALUES\n"
                    + String.join(",\n", encryptedRows) + ";";

            insertMatcher.appendReplacement(outputBuffer, Matcher.quoteReplacement(reconstructedInsert));
        }

        insertMatcher.appendTail(outputBuffer);

        // Write final encrypted content to output
        Files.writeString(outputFilePath, outputBuffer.toString(), StandardCharsets.UTF_8);
    }

    private String encrypt(String value) {
        byte[] encryptedBytes = encryptionService.encrypt(value.getBytes(StandardCharsets.UTF_8));
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

        String original = "Alice";
        byte[] encryptedBytes = encryptionService.encrypt(original.getBytes(StandardCharsets.UTF_8));
        String encryptedBase64 = Base64.getEncoder().encodeToString(encryptedBytes);
        System.out.println("Encrypted Alice: " + encryptedBase64);


        // 4. Run encryption on the mock_data.sql
        Path inputFile = Paths.get(ClassLoader.getSystemResource("01-mock-data.sql").toURI());
        Path outputFile = Paths.get("mock-data-encrypted.sql");

        encryptor.encryptFile(inputFile, outputFile);

        System.out.println("Mock data encryption complete.");

    }
}
