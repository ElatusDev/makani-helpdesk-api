/*
 * Copyright (c) 2025 ElatusDev
 * All rights reserved.
 *
 * This code is proprietary and confidential.
 * Unauthorized copying, distribution, or modification is strictly prohibited.
 */
package com.makani.customer.adultstudent.usecases;

import com.makani.customer.adultstudent.interfaceadapters.AdultStudentRepository;
import openapi.makani.domain.people.dto.AdultStudentCreationResponseDTO;
import org.springframework.stereotype.Service;

@Service
public class GetAdultStudentByIdUseCase {
    private final AdultStudentRepository adultStudentRepository;

    public GetAdultStudentByIdUseCase(AdultStudentRepository adultStudentRepository) {
        this.adultStudentRepository = adultStudentRepository;
    }

    public AdultStudentCreationResponseDTO create() {
        return null;
    }
}
