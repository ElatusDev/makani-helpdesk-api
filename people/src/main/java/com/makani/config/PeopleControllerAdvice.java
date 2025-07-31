/*
 * Copyright (c) 2025 ElatusDev
 * All rights reserved.
 *
 * This code is proprietary and confidential.
 * Unauthorized copying, distribution, or modification is strictly prohibited.
 */
package com.makani.config;

import com.makani.collaborator.interfaceadapters.CollaboratorController;
import com.makani.customer.adultstudent.interfaceadapters.AdultStudentController;
import com.makani.employee.interfaceadapters.EmployeeController;
import com.makani.exception.*;
import com.makani.utilities.interfaceadapters.MessageService;
import com.makani.utilities.exceptions.DecryptionException;
import com.makani.utilities.exceptions.EncryptionException;
import openapi.makani.domain.people.dto.ErrorResponseDTO;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice(basePackageClasses= {EmployeeController.class, CollaboratorController.class,
                    AdultStudentController.class})
public class PeopleControllerAdvice {
    private final MessageService messageService;

    public PeopleControllerAdvice(MessageService messageService) {
        this.messageService = messageService;
    }

    @ExceptionHandler
    public ResponseEntity<ErrorResponseDTO> handleDataIntegrityViolationException(DataIntegrityViolationException ex) {
        String errorMessage = ex.getCause().getCause().getMessage();
        String message = null;

        if (errorMessage != null && errorMessage.contains("email")) {
            message = messageService.getInvalidDataEmailCreationRequest();
        } else if (errorMessage != null && errorMessage.contains("phone")) {
            message = messageService.getInvalidDataPhoneCreationRequest();
        } else {
            message = messageService.getInvalidUnknownDataRequest();
        }
        return new ResponseEntity<>(new ErrorResponseDTO(message), HttpStatus.BAD_REQUEST);
    }

    @ExceptionHandler({AdultStudentDeletionNotAllowedException.class})
    public ResponseEntity<ErrorResponseDTO>  handleAdultStudentDeletionNotAllowedException() {
        return new ResponseEntity<>(new ErrorResponseDTO(messageService.getAdultStudentDeleteNotAllowed()), HttpStatus.BAD_REQUEST);
    }

    @ExceptionHandler({CollaboratorDeletionNotAllowedException.class})
    public ResponseEntity<ErrorResponseDTO>  handleCollaboratorDeletionNotAllowedException() {
        return new ResponseEntity<>(new ErrorResponseDTO(messageService.getCollaboratorDeleteNotAllowed()), HttpStatus.BAD_REQUEST);
    }

    @ExceptionHandler({EmployeeDeletionNotAllowedException.class})
    public ResponseEntity<ErrorResponseDTO>  handleEmployeeDeletionNotAllowedException() {
        return new ResponseEntity<>(new ErrorResponseDTO(messageService.getEmployeeDeleteNotAllowed()), HttpStatus.BAD_REQUEST);
    }

    @ExceptionHandler
    public ResponseEntity<ErrorResponseDTO> handleAdultStudentNotFoundException(AdultStudentNotFoundException ex) {
        return new ResponseEntity<>(new ErrorResponseDTO(messageService.getAdultStudentNotFound(ex.getMessage())), HttpStatus.NOT_FOUND);
    }

    @ExceptionHandler
    public ResponseEntity<ErrorResponseDTO> handleCollaboratorNotFoundException(CollaboratorNotFoundException ex) {
        return new ResponseEntity<>(new ErrorResponseDTO(messageService.getCollaboratorNotFound(ex.getMessage())), HttpStatus.NOT_FOUND);
    }

    @ExceptionHandler
    public ResponseEntity<ErrorResponseDTO> handleEmployeeNotFoundException(EmployeeNotFoundException ex) {
        return new ResponseEntity<>(new ErrorResponseDTO(messageService.getEmployeeNotFound(ex.getMessage())), HttpStatus.NOT_FOUND);
    }

    @ExceptionHandler(MethodArgumentNotValidException.class)
    public ResponseEntity<ErrorResponseDTO> handleValidationExceptions(
            MethodArgumentNotValidException ex) {
        ErrorResponseDTO errorResponse = new ErrorResponseDTO();
        errorResponse.setMessage("Validation failed for request. Please check provided data." + ex.getMessage());
        return new ResponseEntity<>(errorResponse, HttpStatus.BAD_REQUEST);
    }

    @ExceptionHandler({EncryptionException.class , DecryptionException.class})
    public ResponseEntity<ErrorResponseDTO> handleEncryptionException(){
        ErrorResponseDTO errorResponse  = new ErrorResponseDTO();
        errorResponse.setMessage(messageService.getInternalErrorHighSeverity());
        return new ResponseEntity<>(errorResponse, HttpStatus.INTERNAL_SERVER_ERROR);
    }
}
