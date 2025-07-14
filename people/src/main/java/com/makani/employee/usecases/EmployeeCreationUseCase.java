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
import com.makani.utilities.interfaceadapters.HashingService;
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
    private final HashingService hashingService;

    public EmployeeCreationUseCase(EmployeeRepository employeeRepository,
                                   ModelMapper modelMapper,
                                   HashingService hashingService) {
        this.employeeRepository = employeeRepository;
        this.modelMapper = modelMapper;
        this.hashingService = hashingService;
    }

    @Transactional
    public EmployeeCreationResponseDTO create(EmployeeCreationRequestDTO dto) {
        EmployeeDataModel received =  modelMapper.map(dto, EmployeeDataModel.class, MAP_NAME);

        String normalizedEmail = hashingService.normalizeEmail(received.getPersonPII().getEmail());
        received.getPersonPII().setEmailHash(hashingService.generateHash(normalizedEmail));
        String normalizedPhone = hashingService.normalizePhoneNumber(received.getPersonPII().getPhone());
        received.getPersonPII().setPhoneHash(normalizedPhone);

        return modelMapper.map(employeeRepository.save(received), EmployeeCreationResponseDTO.class);
    }
}
