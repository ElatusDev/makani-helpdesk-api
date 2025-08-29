/*
 * Copyright (c) 2025 ElatusDev
 * All rights reserved.
 *
 * This code is proprietary and confidential.
 * Unauthorized copying, distribution, or modification is strictly prohibited.
 */
package com.makani.usecases;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.makani.collaborator.usecases.CollaboratorCreationUseCase;
import com.makani.customer.adultstudent.usecases.AdultStudentCreationUseCase;
import com.makani.employee.usecases.EmployeeCreationBatchUseCase;
import com.makani.exceptions.FailToGenerateMockDataException;
import jakarta.transaction.Transactional;
import openapi.makani.domain.people.dto.EmployeeCreationRequestDTO;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Service;

import java.nio.charset.StandardCharsets;
import java.util.List;

@Service
public class GeneratePeopleMockDataUseCase {

    private final EmployeeCreationBatchUseCase employeeCreationBatchUseCase;
    private final CollaboratorCreationUseCase collaboratorCreationUseCase;
    private final AdultStudentCreationUseCase adultStudentCreationUseCase;
    private final ResourceLoader resourceLoader;
    private final ObjectMapper objectMapper;

    public GeneratePeopleMockDataUseCase(EmployeeCreationBatchUseCase employeeCreationBatchUseCase,
                                         CollaboratorCreationUseCase collaboratorCreationUseCase,
                                         AdultStudentCreationUseCase adultStudentCreationUseCase,
                                         ResourceLoader resourceLoader,
                                         ObjectMapper objectMapper) {
        this.employeeCreationBatchUseCase = employeeCreationBatchUseCase;
        this.collaboratorCreationUseCase = collaboratorCreationUseCase;
        this.adultStudentCreationUseCase = adultStudentCreationUseCase;
        this.resourceLoader = resourceLoader;
        this.objectMapper = objectMapper;
    }

    @Transactional
    public void create() {
        try {
            String jsonContent = new String(resourceLoader.getResource("classpath:mock-data/employee_mock_data.json")
                                    .getInputStream().readAllBytes(), StandardCharsets.UTF_8);
            List<EmployeeCreationRequestDTO> dtos = objectMapper.readValue(jsonContent, new TypeReference<List<EmployeeCreationRequestDTO>>() {});
            employeeCreationBatchUseCase.createAll(dtos);
        } catch (Exception e) {
            throw new FailToGenerateMockDataException(e);
        }
    }

}