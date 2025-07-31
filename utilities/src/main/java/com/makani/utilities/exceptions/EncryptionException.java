package com.makani.utilities.exceptions;

public class EncryptionException extends RuntimeException {
    public EncryptionException(Exception e) {
        super(e);
    }
}
