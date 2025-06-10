package com.makani.exception;

public class EmployeeDeletionNotAllowedException extends RuntimeException {
    public EmployeeDeletionNotAllowedException(Exception ex) {
        super(ex);
    }
}
