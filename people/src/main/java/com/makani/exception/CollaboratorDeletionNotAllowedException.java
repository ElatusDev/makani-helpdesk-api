package com.makani.exception;

public class CollaboratorDeletionNotAllowedException extends RuntimeException {
    public CollaboratorDeletionNotAllowedException(Exception ex) {
        super(ex);
    }
}
