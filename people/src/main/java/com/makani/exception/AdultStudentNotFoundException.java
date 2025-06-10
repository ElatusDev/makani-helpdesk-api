package com.makani.exception;

public class AdultStudentNotFoundException extends RuntimeException {
    public AdultStudentNotFoundException(String msg) {
        super(msg);
    }
}
