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
import openapi.makani.domain.people.dto.EmployeeCreationResponseDTO;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

@Service
public class EmployeeCreationUseCase {
    private final EmployeeRepository employeeRepository;
    private final ModelMapper modelMapper;

    public EmployeeCreationUseCase(EmployeeRepository employeeRepository, ModelMapper modelMapper) {
        this.employeeRepository = employeeRepository;
        this.modelMapper = modelMapper;
    }

    public EmployeeCreationResponseDTO create(EmployeeCreationRequestDTO employeeCreateRequest) {
        EmployeeDataModel received =  modelMapper.map(employeeCreateRequest, EmployeeDataModel.class, "employeeMap");
        return modelMapper.map(employeeRepository.save(received), EmployeeCreationResponseDTO.class);
    }
}
