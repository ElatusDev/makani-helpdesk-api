package com.makani.utilities;

import jakarta.annotation.PostConstruct;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import java.util.Locale;

@Service
public class MessageService {
    private static final String ENTITY_NOT_FOUND = "entity.not.found";
    private static final String ADULT_STUDENT_ENTITY = "entity.adult.student";
    private static final String EMPLOYEE_ENTITY = "entity.employee";
    private static final String COLLABORATOR_ENTITY = "entity.collaborator";

    private static final String INVALID_DATA_EMAIL_CREATION_REQUEST = "invalid.data.email.creation.request";
    private static final String INVALID_DATA_PHONE_CREATION_REQUEST = "invalid.data.phone.creation.request";
    private static final String ENTITY_DELETE_NOT_ALLOWED = "entity.delete.not.allowed";
    private static final String INVALID_UNKNOWN_DATA_REQUEST = "invalid.unknown.data.request";

    private final MessageSource messageSource;
    private final Locale locale;
    private String adultStudent;
    private String collaborator;
    private String employee;

    public MessageService(MessageSource messageSource) {
        this.messageSource = messageSource;
        this.locale = LocaleContextHolder.getLocale();
    }

    @PostConstruct
    public void init() {
        adultStudent = messageSource.getMessage(ADULT_STUDENT_ENTITY, null, locale);
        collaborator = messageSource.getMessage(COLLABORATOR_ENTITY, null, locale);
        employee = messageSource.getMessage(EMPLOYEE_ENTITY, null, locale);
    }

    public String getAdultStudentNotFound(String id) {
        return getEntityNotFound(adultStudent, id);
    }

    public String getCollaboratorNotFound(String id) {
        return getEntityNotFound(collaborator, id);
    }

    public String getEmployeeNotFound(String id) {
        return getEntityNotFound(employee, id);
    }

    private String getEntityNotFound(String entityName, String id){
        return messageSource.getMessage(ENTITY_NOT_FOUND,
                new Object[] { entityName, id}, locale);
    }

    public String getInvalidDataEmailCreationRequest() {
        return  messageSource.getMessage(INVALID_DATA_EMAIL_CREATION_REQUEST, null, locale);
    }

    public String getInvalidDataPhoneCreationRequest() {
        return messageSource.getMessage(INVALID_DATA_PHONE_CREATION_REQUEST, null, locale);
    }

    public String getAdultStudentDeleteNotAllowed() {
        return getEntityDeleteNotAllowed(adultStudent);
    }

    public String getCollaboratorDeleteNotAllowed() {
        return getEntityDeleteNotAllowed(collaborator);
    }

    public String getEmployeeDeleteNotAllowed() {
        return getEntityDeleteNotAllowed(employee);
    }

    private String getEntityDeleteNotAllowed(String entityName) {
        return messageSource.getMessage(ENTITY_DELETE_NOT_ALLOWED, new Object[]{entityName}, locale);
    }

    public String getInvalidUnknownDataRequest() {
        return messageSource.getMessage(INVALID_UNKNOWN_DATA_REQUEST, null, locale);
    }
}
