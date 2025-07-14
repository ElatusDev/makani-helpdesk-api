package com.makani.utilities.interfaceadapters;

import com.google.i18n.phonenumbers.PhoneNumberUtil;
import com.google.i18n.phonenumbers.Phonenumber;
import org.springframework.stereotype.Component;

@Component
public class PhoneNumberNormalizer {
    private final PhoneNumberUtil phoneUtil;

    public PhoneNumberNormalizer(PhoneNumberUtil phoneUtil) {
        this.phoneUtil = phoneUtil;
    }

    public String normalizePhoneNumberForHashing(String phoneNumberString, String defaultRegionCode) {
        if (phoneNumberString == null || phoneNumberString.trim().isEmpty()) {
            return null;
        }

        try {
            Phonenumber.PhoneNumber phoneNumber = phoneUtil.parse(phoneNumberString, defaultRegionCode);

            if (!phoneUtil.isValidNumber(phoneNumber)) {
                System.err.println("Warning: Invalid phone number detected: " + phoneNumberString);
                return null; // Or throw an exception
            }

            // Format to E.164, which is the international standard and best for unique hashing
            return phoneUtil.format(phoneNumber, PhoneNumberUtil.PhoneNumberFormat.E164);

        } catch (com.google.i18n.phonenumbers.NumberParseException e) {
            // Handle parsing errors (e.g., malformed number)
            System.err.println("Error parsing phone number: " + phoneNumberString + " - " + e.getMessage());
            return null; // Or throw an exception
        }
    }
}
