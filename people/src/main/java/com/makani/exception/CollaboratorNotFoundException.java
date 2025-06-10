package com.makani.exception;

public class CollaboratorNotFoundException extends RuntimeException {
    public CollaboratorNotFoundException(String msg) {
        super(msg);
    }
}
