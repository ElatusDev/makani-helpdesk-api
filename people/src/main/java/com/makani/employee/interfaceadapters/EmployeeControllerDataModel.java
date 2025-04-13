package com.makani.employee.interfaceadapters;

import com.makani.employee.usecases.InvalidCreateRequestException;
import openapi.makani.domain.people.api.EmployeeApi;
import openapi.makani.domain.people.dto.EmployeeCreateRequestDTO;
import openapi.makani.domain.people.dto.EmployeeResponseDTO;
import com.makani.employee.usecases.CreateEmployeeUseCase;
import com.makani.employee.usecases.GetEmployeeByIdUseCase;
import jakarta.validation.Valid;
import jakarta.validation.constraints.NotNull;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@RestController
@RequestMapping("/people")
public class EmployeeControllerDataModel implements EmployeeApi {

    private final GetEmployeeByIdUseCase getEmployeeByIdUseCase;
    private final CreateEmployeeUseCase createEmployeeUseCase;

    public EmployeeControllerDataModel(GetEmployeeByIdUseCase getEmployeeByIdUseCase, CreateEmployeeUseCase createEmployeeUseCase) {
        this.getEmployeeByIdUseCase = getEmployeeByIdUseCase;
        this.createEmployeeUseCase = createEmployeeUseCase;
    }

    @Override
    public ResponseEntity<EmployeeResponseDTO> getEmployeeById(
            @NotNull  @Valid @RequestParam(value = "employeeId", required = true) Integer employeeId ) {
        Optional<EmployeeResponseDTO> employeeResponse = getEmployeeByIdUseCase.getEmployeeId(employeeId);
        return employeeResponse.map(ResponseEntity::ok).orElseGet(() -> ResponseEntity.notFound().build());
    }

    @Override
    public ResponseEntity<Integer> postEmployee(
            @Valid @RequestBody EmployeeCreateRequestDTO employeeCreateRequest) {
        try {
            Integer employeeId = createEmployeeUseCase.createEmployee(employeeCreateRequest);
            return ResponseEntity.ok(employeeId);
        } catch (InvalidCreateRequestException e) {
            return ResponseEntity.status(HttpStatus.CONFLICT).build();
        }

    }
}
