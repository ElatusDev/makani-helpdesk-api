/*
 * Copyright (c) 2025 ElatusDev
 * All rights reserved.
 *
 * This code is proprietary and confidential.
 * Unauthorized copying, distribution, or modification is strictly prohibited.
 */
package com.makani.collaborator.usecases;

import com.makani.people.collaborator.CollaboratorDataModel;
import com.makani.collaborator.interfaceadapters.CollaboratorRepository;
import com.makani.utilities.interfaceadapters.HashingService;
import com.makani.utilities.interfaceadapters.PiiNormalizer;
import openapi.makani.domain.people.dto.CollaboratorCreationRequestDTO;
import openapi.makani.domain.people.dto.CollaboratorCreationResponseDTO;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class CollaboratorCreationUseCase {


    private final CollaboratorRepository repository;
    private final ModelMapper modelMapper;
    private final HashingService hashingService;
    private final PiiNormalizer piiNormalizer;

    public static final String TYPE_MAP = "collaboratorMap";

    public CollaboratorCreationUseCase(CollaboratorRepository repository,
                                       ModelMapper modelMapper,
                                       HashingService hashingService,
                                       PiiNormalizer piiNormalizer) {
        this.repository = repository;
        this.modelMapper = modelMapper;
        this.hashingService = hashingService;
        this.piiNormalizer = piiNormalizer;
    }

    @Transactional
    public CollaboratorCreationResponseDTO create(CollaboratorCreationRequestDTO dto) {
        CollaboratorDataModel received =  modelMapper.map(dto, CollaboratorDataModel.class, TYPE_MAP);

        String normalizedEmail = piiNormalizer.normalizeEmail(received.getPersonPII().getEmail());
        received.getPersonPII().setEmailHash(hashingService.generateHash(normalizedEmail));

        String normalizedPhone = piiNormalizer.normalizePhoneNumber(received.getPersonPII().getPhone());
        received.getPersonPII().setPhoneHash(hashingService.generateHash(normalizedPhone));

        return modelMapper.map(repository.save(received), CollaboratorCreationResponseDTO.class);
    }
}
