package com.makani.employee.usecases;

import com.makani.employee.interfaceadapters.EmployeeRepository;
import com.makani.people.employee.EmployeeDataModel;
import openapi.makani.domain.people.dto.EmployeeCreationRequestDTO;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collector;
import java.util.stream.Collectors;

@Service
public class EmployeeCreationBatchUseCase {
    private final EmployeeRepository employeeRepository;
    private final EmployeeCreationUseCase employeeCreationUseCase;

    public EmployeeCreationBatchUseCase(EmployeeRepository employeeRepository,
                                        EmployeeCreationUseCase employeeCreationUseCase) {
        this.employeeRepository = employeeRepository;
        this.employeeCreationUseCase = employeeCreationUseCase;
    }

    public void createAll(List<EmployeeCreationRequestDTO> dtos) {
        employeeRepository.saveAll(dtos.stream().map(employeeCreationUseCase::transform).collect(Collectors.toList()));
    }
}
