package com.makani.utilities.interfaceadapters;

import org.apache.commons.codec.binary.Hex;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;


@Service
public class HashingService {

    private final PhoneNumberNormalizer phoneNumberNormalizer;
    private final String defaultRegionCode;

    public HashingService(@Value("${app.phone.default-region:US}")
                          String defaultRegionCode,
                          PhoneNumberNormalizer phoneNumberNormalizer) {
        this.phoneNumberNormalizer = phoneNumberNormalizer;
        this.defaultRegionCode = defaultRegionCode;
    }

    public String generateHash(String input) {
        if (input == null) {
            return null;
        }
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] hash = digest.digest(input.getBytes(StandardCharsets.UTF_8));
            return Hex.encodeHexString(hash);
        } catch (NoSuchAlgorithmException e) {
            throw new IllegalStateException("SHA-256 algorithm not found", e);
        }
    }

    public String normalizeEmail(String email) {
        if (email == null) return null;
        return email.trim().toLowerCase(); // Basic normalization
    }

    public String normalizePhoneNumber(String phoneNumber) {
        if (phoneNumber == null) return null;
        // This is a placeholder. Use a dedicated library like Google's libphonenumber for robust normalization.
        return phoneNumberNormalizer.normalizePhoneNumberForHashing(phoneNumber, defaultRegionCode);
    }
}
