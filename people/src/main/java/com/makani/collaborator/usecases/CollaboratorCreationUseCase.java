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
import openapi.makani.domain.people.dto.CollaboratorCreationRequestDTO;
import openapi.makani.domain.people.dto.CollaboratorCreationResponseDTO;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class CollaboratorCreationUseCase {
    private static final String TYPE_MAP = "collaboratorMap";

    private final CollaboratorRepository repository;
    private final ModelMapper modelMapper;
    private final HashingService hashingService;

    public CollaboratorCreationUseCase(CollaboratorRepository repository,
                                       ModelMapper modelMapper,
                                       HashingService hashingService) {
        this.repository = repository;
        this.modelMapper = modelMapper;
        this.hashingService = hashingService;
    }

    @Transactional
    public CollaboratorCreationResponseDTO create(CollaboratorCreationRequestDTO dto) {
        CollaboratorDataModel received =  modelMapper.map(dto, CollaboratorDataModel.class, TYPE_MAP);


        String normalizedEmail = hashingService.normalizeEmail(received.getPersonPII().getEmail());
        received.getPersonPII().setEmailHash(hashingService.generateHash(normalizedEmail));
        String normalizedPhone = hashingService.normalizePhoneNumber(received.getPersonPII().getPhone());
        received.getPersonPII().setPhoneHash(normalizedPhone);

        return modelMapper.map(repository.save(received), CollaboratorCreationResponseDTO.class);
    }
}
