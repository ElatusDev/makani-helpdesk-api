package com.makani.utilities.security;

import jakarta.persistence.AttributeConverter;
import jakarta.persistence.Converter;
import org.springframework.stereotype.Component;

@Component
@Converter
public class StringEncryptor implements AttributeConverter<String, String> { // Note: String -> String

    private final AESGCMEncryptionService encryptionService;

    public StringEncryptor(AESGCMEncryptionService encryptionService) {
        this.encryptionService = encryptionService;
    }

    @Override
    public String convertToDatabaseColumn(String attribute)  {
        if (attribute == null) {
            return null;
        }

        return encryptionService.encrypt(attribute.getBytes());
    }

    @Override
    public String convertToEntityAttribute(String dbData) {
        if (dbData == null) {
            return null;
        }

        return encryptionService.decrypt(dbData);
    }
}
