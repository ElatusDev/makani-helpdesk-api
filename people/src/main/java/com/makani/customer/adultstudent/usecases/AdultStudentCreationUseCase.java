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
import com.makani.utilities.interfaceadapters.HashingService;
import com.makani.utilities.interfaceadapters.PiiNormalizer;
import openapi.makani.domain.people.dto.AdultStudentCreationRequestDTO;
import openapi.makani.domain.people.dto.AdultStudentCreationResponseDTO;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class AdultStudentCreationUseCase {
    private final AdultStudentRepository adultStudentRepository;
    private final ModelMapper modelMapper;
    private final HashingService hashingService;
    private final PiiNormalizer piiNormalizer;

    public AdultStudentCreationUseCase(AdultStudentRepository adultStudentRepository,
                                       ModelMapper modelMapper,
                                       HashingService hashingService,
                                       PiiNormalizer piiNormalizer) {
        this.adultStudentRepository = adultStudentRepository;
        this.modelMapper = modelMapper;
        this.hashingService = hashingService;
        this.piiNormalizer = piiNormalizer;
    }

    @Transactional
    public AdultStudentCreationResponseDTO create(AdultStudentCreationRequestDTO dto) {
        AdultStudentDataModel received = modelMapper.map(dto, AdultStudentDataModel.class);

        String normalizedEmail = piiNormalizer.normalizeEmail(received.getPersonPII().getEmail());
        received.getPersonPII().setEmailHash(hashingService.generateHash(normalizedEmail));

        String normalizedPhone = piiNormalizer.normalizePhoneNumber(received.getPersonPII().getPhone());
        received.getPersonPII().setPhoneHash(hashingService.generateHash(normalizedPhone));

        return modelMapper.map(adultStudentRepository.save(received), AdultStudentCreationResponseDTO.class);
    }
}
