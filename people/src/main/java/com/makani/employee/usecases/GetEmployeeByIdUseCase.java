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
import openapi.makani.domain.people.dto.GetEmployeeResponseDTO;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class GetEmployeeByIdUseCase {
    private final EmployeeRepository employeeRepository;
    private final ModelMapper modelMapper;

    public GetEmployeeByIdUseCase(EmployeeRepository employeeRepository, ModelMapper modelMapper) {
        this.employeeRepository = employeeRepository;
        this.modelMapper = modelMapper;
    }

    public Optional<GetEmployeeResponseDTO> getEmployeeId(Integer employeeId) {
          Optional<EmployeeDataModel> queryResult = employeeRepository.findByEmployeeId(employeeId);
          return queryResult.map(employeeDataModel -> modelMapper.map(employeeDataModel, GetEmployeeResponseDTO.class));
    }
}
