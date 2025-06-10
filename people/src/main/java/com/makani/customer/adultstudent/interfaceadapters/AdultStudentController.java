package com.makani.customer.adultstudent.interfaceadapters;

import com.makani.customer.adultstudent.usecases.AdultStudentCreationUseCase;
import openapi.makani.domain.people.api.AdultStudentsApi;
import openapi.makani.domain.people.dto.AdultStudentCreationRequestDTO;
import openapi.makani.domain.people.dto.AdultStudentCreationResponseDTO;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/people")
public class AdultStudentController implements AdultStudentsApi {
    private final AdultStudentCreationUseCase adultStudentCreationUseCase;

    public AdultStudentController(AdultStudentCreationUseCase adultStudentCreationUseCase) {
        this.adultStudentCreationUseCase = adultStudentCreationUseCase;
    }

    @Override
    public ResponseEntity<AdultStudentCreationResponseDTO> createAdultStudent(
            AdultStudentCreationRequestDTO adultStudentCreationRequestDTO) {
        return ResponseEntity.status(HttpStatus.CREATED).body(adultStudentCreationUseCase.create(adultStudentCreationRequestDTO));
    }
}
