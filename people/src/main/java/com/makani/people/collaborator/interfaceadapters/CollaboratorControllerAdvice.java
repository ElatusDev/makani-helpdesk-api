package com.makani.people.collaborator.interfaceadapters;

import openapi.makani.domain.people.dto.ErrorResponseDTO;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import java.util.NoSuchElementException;

@ControllerAdvice(basePackageClasses= {CollaboratorController.class})
public class CollaboratorControllerAdvice {
    private final MessageSource messageSource;

    public CollaboratorControllerAdvice(MessageSource messageSource) {
        this.messageSource = messageSource;
    }

    @ExceptionHandler
    public ResponseEntity<ErrorResponseDTO> handleDataIntegrityViolationException(DataIntegrityViolationException ex) {
        String errorMessage = ex.getCause().getCause().getMessage();
        String message = null;

        if (errorMessage != null && errorMessage.contains("email")) {
            message = messageSource.getMessage("invalid.data.email.creation.request",
                    null, LocaleContextHolder.getLocale());
        } else if (errorMessage != null && errorMessage.contains("phone")) {
            message = messageSource.getMessage("invalid.data.phone.creation.request",
                    null, LocaleContextHolder.getLocale());
        }else if (errorMessage != null && errorMessage.contains("Cannot delete or update")) {
            message = messageSource.getMessage("collaborator.delete.not.allow",
                    null, LocaleContextHolder.getLocale());
        } else {
            message = messageSource.getMessage("invalid.unknown.data.request",
                    null , LocaleContextHolder.getLocale());
        }
        return new ResponseEntity<>(new ErrorResponseDTO(message), HttpStatus.BAD_REQUEST);
    }

    @ExceptionHandler
    public ResponseEntity<ErrorResponseDTO> handleNoSuchElementException(NoSuchElementException ex) {
        String message = messageSource.getMessage("collaborator.not.found",
                new Object[]{ ex.getMessage() },LocaleContextHolder.getLocale());
        return new ResponseEntity<>(new ErrorResponseDTO(message), HttpStatus.NOT_FOUND);
    }
}
