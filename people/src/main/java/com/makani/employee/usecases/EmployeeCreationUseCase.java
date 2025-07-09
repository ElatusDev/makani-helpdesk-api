/*
 * Copyright (c) 2025 ElatusDev
 * All rights reserved.
 *
 * This code is proprietary and confidential.
 * Unauthorized copying, distribution, or modification is strictly prohibited.
 */
package com.makani.employee.usecases;

import com.makani.employee.interfaceadapters.EmployeeEncryption;
import com.makani.people.employee.EmployeeDataModel;
import com.makani.employee.interfaceadapters.EmployeeRepository;
import openapi.makani.domain.people.dto.EmployeeCreationRequestDTO;
import openapi.makani.domain.people.dto.EmployeeCreationResponseDTO;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class EmployeeCreationUseCase {
    private static final String MAP_NAME = "employeeMap";
    private final EmployeeRepository employeeRepository;
    private final ModelMapper modelMapper;
    private final EmployeeEncryption encryption;

    public EmployeeCreationUseCase(EmployeeRepository employeeRepository, ModelMapper modelMapper,
                                   EmployeeEncryption encryption) {
        this.employeeRepository = employeeRepository;
        this.modelMapper = modelMapper;
        this.encryption = encryption;
    }

    @Transactional
    public EmployeeCreationResponseDTO create(EmployeeCreationRequestDTO employeeCreateRequest) {
        EmployeeDataModel received =  modelMapper.map(employeeCreateRequest, EmployeeDataModel.class, MAP_NAME);
        EmployeeDataModel encrypted = encryption.encrypt(received);
        return modelMapper.map(employeeRepository.save(encrypted), EmployeeCreationResponseDTO.class);
    }
}
