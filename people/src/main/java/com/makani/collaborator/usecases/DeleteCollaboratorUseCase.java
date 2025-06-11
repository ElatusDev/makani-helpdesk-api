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
import com.makani.exception.CollaboratorDeletionNotAllowedException;
import com.makani.exception.CollaboratorNotFoundException;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class DeleteCollaboratorUseCase {
    private final CollaboratorRepository repository;

    public DeleteCollaboratorUseCase(CollaboratorRepository repository) {
        this.repository = repository;
    }

    public void delete(Integer collaboratorId) {
        Optional<CollaboratorDataModel> found = repository.findById(collaboratorId);
        if(found.isPresent()) {
            try {
                repository.delete(found.get());
            } catch (DataIntegrityViolationException ex) {
                throw new CollaboratorDeletionNotAllowedException(ex);
            }
        } else {
            throw new CollaboratorNotFoundException(String.valueOf(collaboratorId));
        }
    }
}
