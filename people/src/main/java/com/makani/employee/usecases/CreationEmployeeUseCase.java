/*
 * Copyright (c) 2025 ElatusDev
 * All rights reserved.
 *
 * This code is proprietary and confidential.
 * Unauthorized copying, distribution, or modification is strictly prohibited.
 */
package com.makani.employee.usecases;

import com.makani.people.employee.EmployeeDataModel;
import com.makani.employee.interfaceadapters.EmployeeRepository;
import openapi.makani.domain.people.dto.EmployeeCreationRequestDTO;
import org.modelmapper.ModelMapper;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

@Service
public class CreationEmployeeUseCase {

    private final EmployeeRepository employeeRepository;
    private final ModelMapper modelMapper;
    private final MessageSource messageSource;

    public CreationEmployeeUseCase(EmployeeRepository employeeRepository, ModelMapper modelMapper, MessageSource messageSource) {
        this.employeeRepository = employeeRepository;
        this.modelMapper = modelMapper;
        this.messageSource = messageSource;
    }

    public Integer create(EmployeeCreationRequestDTO employeeCreateRequest) throws InvalidCreateRequestException {
            EmployeeDataModel received =  modelMapper.map(employeeCreateRequest, EmployeeDataModel.class);
            try {
                EmployeeDataModel persisted = employeeRepository.save(received);
                return persisted.getEmployeeId();
            } catch(Exception e) {
                String message = messageSource.getMessage("data.fieldDataIsNotUnique",
                                new Object[]{"email", "empleado"}, LocaleContextHolder.getLocale());
                throw new InvalidCreateRequestException(message, e);
            }
    }
}
