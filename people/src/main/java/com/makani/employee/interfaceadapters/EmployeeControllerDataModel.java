package com.makani.employee.interfaceadapters;

import com.makani.employee.usecases.CreationEmployeeUseCase;
import com.makani.employee.usecases.InvalidCreateRequestException;
import openapi.makani.domain.people.api.EmployeesApi;
import com.makani.employee.usecases.GetEmployeeByIdUseCase;
import jakarta.validation.Valid;
import jakarta.validation.constraints.NotNull;
import openapi.makani.domain.people.dto.EmployeeCreationRequestDTO;
import openapi.makani.domain.people.dto.EmployeeCreationResponseDTO;
import openapi.makani.domain.people.dto.GetEmployeeResponseDTO;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@RestController
@RequestMapping("/people")
public class EmployeeControllerDataModel implements EmployeesApi {

    private final GetEmployeeByIdUseCase getEmployeeByIdUseCase;
    private final CreationEmployeeUseCase createEmployeeUseCase;

    public EmployeeControllerDataModel(GetEmployeeByIdUseCase getEmployeeByIdUseCase, CreationEmployeeUseCase createEmployeeUseCase) {
        this.getEmployeeByIdUseCase = getEmployeeByIdUseCase;
        this.createEmployeeUseCase = createEmployeeUseCase;
    }

    @Override
    public ResponseEntity<GetEmployeeResponseDTO> getEmployeeById(
            @NotNull  @Valid @RequestParam(value = "employeeId", required = true) Integer employeeId ) {
        Optional<GetEmployeeResponseDTO> employeeResponse = getEmployeeByIdUseCase.getEmployeeId(employeeId);
        return employeeResponse.map(ResponseEntity::ok).orElseGet(() -> ResponseEntity.notFound().build());
    }

    @Override
    public ResponseEntity<EmployeeCreationResponseDTO> createEmployee(
            @Valid @RequestBody EmployeeCreationRequestDTO employeeCreateRequest) {
        try {
            Integer employeeId = createEmployeeUseCase.create(employeeCreateRequest);
            return null;
        } catch (InvalidCreateRequestException e) {
            return ResponseEntity.status(HttpStatus.CONFLICT).build();
        }

    }
}
