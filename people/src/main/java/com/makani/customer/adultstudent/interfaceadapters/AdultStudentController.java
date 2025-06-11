/*
 * Copyright (c) 2025 ElatusDev
 * All rights reserved.
 *
 * This code is proprietary and confidential.
 * Unauthorized copying, distribution, or modification is strictly prohibited.
 */
package com.makani.customer.adultstudent.interfaceadapters;

import com.makani.customer.adultstudent.usecases.AdultStudentCreationUseCase;
import com.makani.customer.adultstudent.usecases.DeleteAdultStudentUseCase;
import com.makani.customer.adultstudent.usecases.GetAdultStudentByIdUseCase;
import com.makani.customer.adultstudent.usecases.GetAllAdultStudentsUseCase;
import openapi.makani.domain.people.api.AdultStudentsApi;
import openapi.makani.domain.people.dto.AdultStudentCreationRequestDTO;
import openapi.makani.domain.people.dto.AdultStudentCreationResponseDTO;
import openapi.makani.domain.people.dto.GetAdultStudentResponseDTO;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/people")
public class AdultStudentController implements AdultStudentsApi {
    private final AdultStudentCreationUseCase adultStudentCreationUseCase;
    private final DeleteAdultStudentUseCase deleteAdultStudentUseCase;
    private final GetAdultStudentByIdUseCase getAdultStudentByIdUseCase;
    private final GetAllAdultStudentsUseCase getAllAdultStudentsUseCase;

    public AdultStudentController(AdultStudentCreationUseCase adultStudentCreationUseCase,
                                  DeleteAdultStudentUseCase deleteAdultStudentUseCase,
                                  GetAdultStudentByIdUseCase getAdultStudentByIdUseCase,
                                  GetAllAdultStudentsUseCase getAllAdultStudentsUseCase) {
        this.adultStudentCreationUseCase = adultStudentCreationUseCase;
        this.deleteAdultStudentUseCase = deleteAdultStudentUseCase;
        this.getAdultStudentByIdUseCase = getAdultStudentByIdUseCase;
        this.getAllAdultStudentsUseCase = getAllAdultStudentsUseCase;
    }

    @Override
    public ResponseEntity<AdultStudentCreationResponseDTO> createAdultStudent(
            AdultStudentCreationRequestDTO adultStudentCreationRequestDTO) {
        return ResponseEntity.status(HttpStatus.CREATED).body(adultStudentCreationUseCase.create(adultStudentCreationRequestDTO));
    }

    @Override
    public ResponseEntity<Void> deleteAdultStudent(Integer adultStudentId) {
        deleteAdultStudentUseCase.delete(adultStudentId);
        return ResponseEntity.noContent().build();
    }

    @Override
    public ResponseEntity<GetAdultStudentResponseDTO> getAdultStudentById(Integer adultStudentId){
        return ResponseEntity.ok(getAdultStudentByIdUseCase.get(adultStudentId));
    }

    @Override
    public ResponseEntity<List<GetAdultStudentResponseDTO>> getAdultStudents() {
        return ResponseEntity.ok(getAllAdultStudentsUseCase.getAll());
    }
}