package com.makani.utilities.exceptions;

public class DecryptionFailureException extends RuntimeException {
    public DecryptionFailureException(Exception e) {
        super(e);
    }
}
