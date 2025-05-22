package com.makani.people.employee.interfaceadapters;

import openapi.makani.domain.people.dto.ErrorResponseDTO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import java.util.NoSuchElementException;

@ControllerAdvice(basePackageClasses= {EmployeeController.class})
public class EmployeeControllerAdvice {
    private static final Logger LOGGER = LoggerFactory.getLogger(EmployeeControllerAdvice.class);
    private final MessageSource messageSource;

    public EmployeeControllerAdvice(MessageSource messageSource) {
        this.messageSource = messageSource;
    }

    @ExceptionHandler
    public ResponseEntity<ErrorResponseDTO> handleDataIntegrityViolationException(DataIntegrityViolationException ex) {
        String errorMessage = ex.getCause().getCause().getMessage();
        String message = null;

        if (errorMessage != null && errorMessage.contains("email")) {
            message = messageSource.getMessage("invalid.data.email.employee.creation.request",
                   null, LocaleContextHolder.getLocale());
        } else if (errorMessage != null && errorMessage.contains("phone")) {
            message = messageSource.getMessage("invalid.data.phone.employee.creation.request",
                    null, LocaleContextHolder.getLocale());
        }else if (errorMessage != null && errorMessage.contains("Cannot delete or update")) {
            message = messageSource.getMessage("employee.delete.not.allow",
                    null, LocaleContextHolder.getLocale());
        } else {
            message = messageSource.getMessage("invalid.unknown.data.employee.request",
                    null , LocaleContextHolder.getLocale());
        }
        return new ResponseEntity<>(new ErrorResponseDTO(message), HttpStatus.BAD_REQUEST);
    }

    @ExceptionHandler
    public ResponseEntity<ErrorResponseDTO> handleNoSuchElementException(NoSuchElementException ex) {
       String message = messageSource.getMessage("employee.delete.not.found",
               null,LocaleContextHolder.getLocale());
       return new ResponseEntity<>(new ErrorResponseDTO(message), HttpStatus.NOT_FOUND);
    }
}
