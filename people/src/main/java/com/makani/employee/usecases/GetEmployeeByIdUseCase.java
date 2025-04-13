package com.makani.employee.usecases;

import openapi.makani.domain.people.dto.EmployeeResponseDTO;
import com.makani.employee.interfaceadapters.EmployeeDataModel;
import com.makani.employee.interfaceadapters.EmployeeRepository;
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

    public Optional<EmployeeResponseDTO> getEmployeeId(Integer employeeId) {
          Optional<EmployeeDataModel> queryResult = employeeRepository.findByEmployeeId(employeeId);
          return queryResult.map(employeeDataModel -> modelMapper.map(employeeDataModel, EmployeeResponseDTO.class));
    }
}
