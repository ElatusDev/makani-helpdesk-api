package com.makani.utilities.exceptions;

public class EncryptionFailureException extends RuntimeException {
    public EncryptionFailureException(Exception e) {
        super(e);
    }
}
