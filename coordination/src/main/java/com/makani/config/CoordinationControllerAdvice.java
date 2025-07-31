/*
 * Copyright (c) 2025 ElatusDev
 * All rights reserved.
 *
 * This code is proprietary and confidential.
 * Unauthorized copying, distribution, or modification is strictly prohibited.
 */
package com.makani.config;

import com.makani.exception.CollaboratorNotFoundException;
import com.makani.exception.ScheduleNotAvailableException;
import com.makani.exception.ScheduleNotFoundException;
import com.makani.program.interfaceadapters.CourseController;
import com.makani.utilities.interfaceadapters.MessageService;
import openapi.makani.domain.coordination.dto.ErrorResponseDTO;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice(basePackageClasses= {CourseController.class})
public class CoordinationControllerAdvice {
    private final MessageService messageService;

    public CoordinationControllerAdvice(MessageService messageService) {
        this.messageService = messageService;
    }

    @ExceptionHandler
    public ResponseEntity<ErrorResponseDTO> handleScheduleNotAvailableException(ScheduleNotAvailableException ex) {
        return new ResponseEntity<>(new ErrorResponseDTO(messageService.getScheduleNotAvailable(ex.getMessage())), HttpStatus.BAD_REQUEST);
    }

    @ExceptionHandler
    public ResponseEntity<ErrorResponseDTO> handleCollaboratorNotFoundException(CollaboratorNotFoundException ex) {
        return new ResponseEntity<>(new ErrorResponseDTO(messageService.getCourseCollaboratorNotFound(ex.getMessage())), HttpStatus.BAD_REQUEST);
    }

    @ExceptionHandler
    public ResponseEntity<ErrorResponseDTO> handleScheduleNotFoundException(ScheduleNotFoundException ex) {
        return new ResponseEntity<>(new ErrorResponseDTO(messageService.getScheduleNotFound(ex.getMessage())), HttpStatus.BAD_REQUEST);
    }

}
