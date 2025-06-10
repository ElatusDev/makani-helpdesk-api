package com.makani.exception;

public class AdultStudentDeletionNotAllowedException extends RuntimeException {
    public AdultStudentDeletionNotAllowedException(Exception ex) {
        super(ex);
    }
}
