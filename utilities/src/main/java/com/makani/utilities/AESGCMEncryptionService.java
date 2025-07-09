package com.makani.utilities;

import com.makani.utilities.exceptions.DecryptionException;
import com.makani.utilities.exceptions.EncryptionException;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import javax.crypto.Cipher;
import javax.crypto.spec.GCMParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import java.nio.ByteBuffer;
import java.nio.charset.StandardCharsets;
import java.security.SecureRandom;
import java.util.Base64;

@Service
public class AESGCMEncryptionService {
    private static final String AES = "AES";
    private static final String AES_GCM = "AES/GCM/NoPadding";
    private static final int IV_SIZE = 12; // 96 bits recommended for GCM
    private static final int TAG_LENGTH = 128; // 128-bit auth tag
    private final SecretKeySpec secretKey;

    public AESGCMEncryptionService(@Value("${security.encryption-key}") String base64Key) {
        byte[] keyBytes = Base64.getDecoder().decode(base64Key);
        this.secretKey = new SecretKeySpec(keyBytes, AES);
    }

    public String encrypt(String plainText) throws EncryptionException {
        byte[] iv = new byte[IV_SIZE];
        SecureRandom random = new SecureRandom();
        random.nextBytes(iv);
        try {
            Cipher cipher = Cipher.getInstance(AES_GCM);
            GCMParameterSpec spec = new GCMParameterSpec(TAG_LENGTH, iv);
            cipher.init(Cipher.ENCRYPT_MODE, secretKey, spec);

            byte[] encrypted = cipher.doFinal(plainText.getBytes(StandardCharsets.UTF_8));

            byte[] encryptedWithIv = new byte[IV_SIZE + encrypted.length];
            System.arraycopy(iv, 0, encryptedWithIv, 0, IV_SIZE);
            System.arraycopy(encrypted, 0, encryptedWithIv, IV_SIZE, encrypted.length);

            return Base64.getEncoder().encodeToString(encryptedWithIv);
        } catch(Exception e) {
            throw new EncryptionException(e);
        }
    }

    public String decrypt(String cipherText) throws DecryptionException {
        byte[] encryptedWithIv = Base64.getDecoder().decode(cipherText);
        byte[] iv = new byte[IV_SIZE];
        byte[] encrypted = new byte[encryptedWithIv.length - IV_SIZE];

        System.arraycopy(encryptedWithIv, 0, iv, 0, IV_SIZE);
        System.arraycopy(encryptedWithIv, IV_SIZE, encrypted, 0, encrypted.length);

        try {
            Cipher cipher = Cipher.getInstance(AES_GCM);
            GCMParameterSpec spec = new GCMParameterSpec(TAG_LENGTH, iv);
            cipher.init(Cipher.DECRYPT_MODE, secretKey, spec);

            byte[] decrypted = cipher.doFinal(encrypted);
            return new String(decrypted, StandardCharsets.UTF_8);
        } catch(Exception e) {
            throw new DecryptionException(e);
        }
    }

    public Byte[] encrypt(Byte[] data) {
        try {
            Cipher cipher = Cipher.getInstance(AES_GCM);
            byte[] iv = new byte[IV_SIZE];
            SecureRandom secureRandom = new SecureRandom();
            secureRandom.nextBytes(iv);

            GCMParameterSpec spec = new GCMParameterSpec(128, iv);
            cipher.init(Cipher.ENCRYPT_MODE, secretKey, spec);
            byte[] encrypted = cipher.doFinal(toPrimitive(data));

            ByteBuffer byteBuffer = ByteBuffer.allocate(iv.length + encrypted.length);
            byteBuffer.put(iv);
            byteBuffer.put(encrypted);
            return toObject(byteBuffer.array());
        } catch (Exception e) {
            throw new EncryptionException(e);
        }
    }

    public byte[] encrypt(byte[] data) {
        try {
            Cipher cipher = Cipher.getInstance(AES_GCM);
            byte[] iv = new byte[IV_SIZE];
            SecureRandom secureRandom = new SecureRandom();
            secureRandom.nextBytes(iv);


            GCMParameterSpec spec = new GCMParameterSpec(128, iv);
            cipher.init(Cipher.ENCRYPT_MODE, secretKey, spec);
            byte[] encrypted = cipher.doFinal(data);

            ByteBuffer byteBuffer = ByteBuffer.allocate(iv.length + encrypted.length);
            byteBuffer.put(iv);
            byteBuffer.put(encrypted);
            return byteBuffer.array();
        } catch (Exception e) {
            throw new EncryptionException(e);
        }
    }

    public Byte[] decrypt(Byte[] encryptedData) {
        try {
            ByteBuffer byteBuffer = ByteBuffer.wrap(toPrimitive(encryptedData));
            byte[] iv = new byte[12];
            byteBuffer.get(iv);

            byte[] encrypted = new byte[byteBuffer.remaining()];
            byteBuffer.get(encrypted);

            Cipher cipher = Cipher.getInstance(AES_GCM);
            GCMParameterSpec spec = new GCMParameterSpec(128, iv);
            cipher.init(Cipher.DECRYPT_MODE, secretKey, spec);
            return toObject(cipher.doFinal(encrypted));
        } catch (Exception e) {
            throw new DecryptionException(e);
        }
    }

    public byte[] decrypt(byte[] encryptedData) {
        try {
            ByteBuffer byteBuffer = ByteBuffer.wrap(encryptedData);
            byte[] iv = new byte[12];
            byteBuffer.get(iv);

            byte[] encrypted = new byte[byteBuffer.remaining()];
            byteBuffer.get(encrypted);

            Cipher cipher = Cipher.getInstance(AES_GCM);
            GCMParameterSpec spec = new GCMParameterSpec(128, iv);
            cipher.init(Cipher.DECRYPT_MODE, secretKey, spec);
            return cipher.doFinal(encrypted);
        } catch (Exception e) {
            throw new DecryptionException(e);
        }
    }

    private static Byte[] toObject(byte[] bytes) {
        Byte[] result = new Byte[bytes.length];
        for (int i = 0; i < bytes.length; i++) {
            result[i] = bytes[i];
        }
        return result;
    }

    private static byte[] toPrimitive(Byte[] bytes) {
        byte[] result = new byte[bytes.length];
        for (int i = 0; i < bytes.length; i++) {
            result[i] = bytes[i];
        }
        return result;
    }
}
