package com.makani.utilities.exceptions;

public class ErrorNormalizationException extends RuntimeException {
    public ErrorNormalizationException(Exception e) {
        super(e);
    }

    public ErrorNormalizationException(String msg) {
        super(msg);
    }
}
