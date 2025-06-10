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
import com.makani.exception.CollaboratorNotFoundException;
import openapi.makani.domain.people.dto.GetCollaboratorResponseDTO;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class GetCollaboratorByIdUseCase {
    private final CollaboratorRepository repository;
    private final ModelMapper modelMapper;

    public GetCollaboratorByIdUseCase(CollaboratorRepository repository, ModelMapper modelMapper) {
        this.repository = repository;
        this.modelMapper = modelMapper;
    }

    public GetCollaboratorResponseDTO getCollaboratorId(Integer collaboratorId) {
          Optional<CollaboratorDataModel> queryResult = repository.findById(collaboratorId);
          if(queryResult.isPresent()) {
              return modelMapper.map(queryResult.get(), GetCollaboratorResponseDTO.class);
          } else {
              throw new CollaboratorNotFoundException(String.valueOf(collaboratorId));
          }
    }
}
