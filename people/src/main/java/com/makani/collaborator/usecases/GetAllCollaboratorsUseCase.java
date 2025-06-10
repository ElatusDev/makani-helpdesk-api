/*
 * Copyright (c) 2025 ElatusDev
 * All rights reserved.
 *
 * This code is proprietary and confidential.
 * Unauthorized copying, distribution, or modification is strictly prohibited.
 */
package com.makani.collaborator.usecases;

import com.makani.collaborator.interfaceadapters.CollaboratorRepository;
import openapi.makani.domain.people.dto.GetCollaboratorResponseDTO;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GetAllCollaboratorsUseCase {

    private final CollaboratorRepository repository;
    private final ModelMapper modelMapper;

    public GetAllCollaboratorsUseCase(CollaboratorRepository repository, ModelMapper modelMapper) {
        this.repository = repository;
        this.modelMapper = modelMapper;
    }

    public List<GetCollaboratorResponseDTO> getAll(){
        return repository.findAll() .stream()
                .map(dataModel -> modelMapper.map(dataModel, GetCollaboratorResponseDTO.class))
                .toList();
    }
}
