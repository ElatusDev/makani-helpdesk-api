/*
 * Copyright (c) 2025 ElatusDev
 * All rights reserved.
 *
 * This code is proprietary and confidential.
 * Unauthorized copying, distribution, or modification is strictly prohibited.
 */
package com.makani.customer.adultstudent.usecases;

import com.makani.people.customer.AdultStudentDataModel;
import com.makani.customer.adultstudent.interfaceadapters.AdultStudentRepository;
import openapi.makani.domain.people.dto.AdultStudentCreationRequestDTO;
import openapi.makani.domain.people.dto.AdultStudentCreationResponseDTO;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class AdultStudentCreationUseCase {
    private final AdultStudentRepository adultStudentRepository;
    private final ModelMapper modelMapper;

    public AdultStudentCreationUseCase(AdultStudentRepository adultStudentRepository,
                                       ModelMapper modelMapper) {
        this.adultStudentRepository = adultStudentRepository;
        this.modelMapper = modelMapper;
    }

    @Transactional
    public AdultStudentCreationResponseDTO create(AdultStudentCreationRequestDTO dto) {
        AdultStudentDataModel model = modelMapper.map(dto, AdultStudentDataModel.class);
        AdultStudentDataModel persisted = adultStudentRepository.save(model);
        return modelMapper.map(persisted, AdultStudentCreationResponseDTO.class);
    }
}
