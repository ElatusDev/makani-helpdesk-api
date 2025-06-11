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
import openapi.makani.domain.people.dto.CollaboratorCreationRequestDTO;
import openapi.makani.domain.people.dto.CollaboratorCreationResponseDTO;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class CollaboratorCreationUseCase {

    private final CollaboratorRepository repository;
    private final ModelMapper modelMapper;

    public CollaboratorCreationUseCase(CollaboratorRepository repository, ModelMapper modelMapper) {
        this.repository = repository;
        this.modelMapper = modelMapper;
    }

    @Transactional
    public CollaboratorCreationResponseDTO create(CollaboratorCreationRequestDTO collaboratorCreateRequest) {
        CollaboratorDataModel received =  modelMapper.map(collaboratorCreateRequest, CollaboratorDataModel.class, "collaboratorMap");
        return modelMapper.map(repository.save(received), CollaboratorCreationResponseDTO.class);
    }
}
