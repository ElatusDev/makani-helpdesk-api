package com.makani.exceptions;

public class SerializationFailureException extends RuntimeException {
    public SerializationFailureException(String msg) {
        super(msg);
    }
}
