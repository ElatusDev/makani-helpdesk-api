package com.makani.employee.usecases;

public class InvalidCreateRequestException extends Exception{
    public InvalidCreateRequestException(String msg, Exception ex) {
        super(msg, ex);
    }
}
