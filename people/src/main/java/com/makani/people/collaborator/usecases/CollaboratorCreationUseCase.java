/*
 * Copyright (c) 2025 ElatusDev
 * All rights reserved.
 *
 * This code is proprietary and confidential.
 * Unauthorized copying, distribution, or modification is strictly prohibited.
 */
package com.makani.people.collaborator.usecases;

import com.makani.people.collaborator.CollaboratorDataModel;
import com.makani.people.collaborator.interfaceadapters.CollaboratorRepository;
import openapi.makani.domain.people.dto.CollaboratorCreationRequestDTO;
import openapi.makani.domain.people.dto.CollaboratorCreationResponseDTO;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

@Service
public class CollaboratorCreationUseCase {

    private final CollaboratorRepository repository;
    private final ModelMapper modelMapper;

    public CollaboratorCreationUseCase(CollaboratorRepository repository, ModelMapper modelMapper) {
        this.repository = repository;
        this.modelMapper = modelMapper;
    }

    public CollaboratorCreationResponseDTO create(CollaboratorCreationRequestDTO collaboratorCreateRequest) {
        CollaboratorDataModel received =  modelMapper.map(collaboratorCreateRequest, CollaboratorDataModel.class, "collaboratorMap");
        return modelMapper.map(repository.save(received), CollaboratorCreationResponseDTO.class);
    }
}
