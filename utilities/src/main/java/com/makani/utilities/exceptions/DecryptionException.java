package com.makani.utilities.exceptions;

public class DecryptionException extends RuntimeException {
    public DecryptionException(Exception e) {
        super(e);
    }
}
