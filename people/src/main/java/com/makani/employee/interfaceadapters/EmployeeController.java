/*
 * Copyright (c) 2025 ElatusDev
 * All rights reserved.
 *
 * This code is proprietary and confidential.
 * Unauthorized copying, distribution, or modification is strictly prohibited.
 */
package com.makani.employee.interfaceadapters;

import com.makani.employee.usecases.DeleteEmployeeUseCase;
import com.makani.employee.usecases.EmployeeCreationUseCase;
import com.makani.employee.usecases.GetAllEmployeesUseCase;
import openapi.makani.domain.people.api.EmployeesApi;
import com.makani.employee.usecases.GetEmployeeByIdUseCase;
import openapi.makani.domain.people.dto.EmployeeCreationRequestDTO;
import openapi.makani.domain.people.dto.EmployeeCreationResponseDTO;
import openapi.makani.domain.people.dto.GetEmployeeResponseDTO;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/people")
public class EmployeeController implements EmployeesApi {

    private final GetEmployeeByIdUseCase getEmployeeByIdUseCase;
    private final GetAllEmployeesUseCase getAllEmployeesUseCase;
    private final EmployeeCreationUseCase employeeCreationUseCase;
    private final DeleteEmployeeUseCase deleteEmployeeUseCase;

    public EmployeeController(GetEmployeeByIdUseCase getEmployeeByIdUseCase,
                              GetAllEmployeesUseCase getAllEmployeesUseCase,
                              EmployeeCreationUseCase employeeCreationUseCase,
                              DeleteEmployeeUseCase deleteEmployeeUseCase) {
        this.getEmployeeByIdUseCase = getEmployeeByIdUseCase;
        this.getAllEmployeesUseCase = getAllEmployeesUseCase;
        this.employeeCreationUseCase = employeeCreationUseCase;
        this.deleteEmployeeUseCase = deleteEmployeeUseCase;
    }

    @Override
    public ResponseEntity<GetEmployeeResponseDTO> getEmployeeById(Integer employeeId) {
        Optional<GetEmployeeResponseDTO> employeeResponse = getEmployeeByIdUseCase.getEmployeeId(employeeId);
        return employeeResponse.map(ResponseEntity::ok).orElseGet(() -> ResponseEntity.notFound().build());
    }

    @Override
    public ResponseEntity<List<GetEmployeeResponseDTO>> getEmployees() {
        return ResponseEntity.ok(getAllEmployeesUseCase.getAllEmployees());
    }

    @Override
    public ResponseEntity<EmployeeCreationResponseDTO> createEmployee(
            EmployeeCreationRequestDTO employeeCreationRequestDTO) {
        return ResponseEntity.status(HttpStatus.CREATED)
                .body(employeeCreationUseCase.create(employeeCreationRequestDTO));
    }

    @Override
    public ResponseEntity<String> deleteEmployeeById(Integer employeeId) {
         deleteEmployeeUseCase.delete(employeeId);
         return ResponseEntity.noContent().build();
    }
}
