package com.makani.exception;

public class ScheduleNotAvailableException extends RuntimeException {
    public ScheduleNotAvailableException(String msg) {
        super(msg);
    }
}
