package com.makani.people.collaborator.usecases;

import com.makani.people.collaborator.CollaboratorDataModel;
import com.makani.people.collaborator.interfaceadapters.CollaboratorRepository;
import org.springframework.stereotype.Service;

import java.util.NoSuchElementException;
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
            repository.delete(found.get());
        } else {
            throw new NoSuchElementException(String.valueOf(collaboratorId));
        }
    }
}
