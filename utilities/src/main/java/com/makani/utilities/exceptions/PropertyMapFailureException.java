package com.makani.utilities.exceptions;

public class PropertyMapFailureException extends RuntimeException {
    public PropertyMapFailureException(Exception e) {
        super(e);
    }
}
