package com.makani.collaborator.interfaceadapters;

import com.makani.collaborator.usecases.CollaboratorCreationUseCase;
import com.makani.collaborator.usecases.DeleteCollaboratorUseCase;
import com.makani.collaborator.usecases.GetAllCollaboratorsUseCase;
import com.makani.collaborator.usecases.GetCollaboratorByIdUseCase;
import openapi.makani.domain.people.api.CollaboratorsApi;
import openapi.makani.domain.people.dto.CollaboratorCreationRequestDTO;
import openapi.makani.domain.people.dto.CollaboratorCreationResponseDTO;
import openapi.makani.domain.people.dto.GetCollaboratorResponseDTO;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/people")
public class CollaboratorController implements CollaboratorsApi {

    private final GetAllCollaboratorsUseCase getAllCollaboratorsUseCase;
    private final CollaboratorCreationUseCase collaboratorCreationUseCase;
    private final GetCollaboratorByIdUseCase getCollaboratorByIdUseCase;
    private final DeleteCollaboratorUseCase deleteCollaboratorUseCase;

    public CollaboratorController(GetAllCollaboratorsUseCase getAllCollaboratorsUseCase,
                                  CollaboratorCreationUseCase collaboratorCreationUseCase,
                                  GetCollaboratorByIdUseCase getCollaboratorByIdUseCase,
                                  DeleteCollaboratorUseCase deleteCollaboratorUseCase) {
        this.getAllCollaboratorsUseCase = getAllCollaboratorsUseCase;
        this.collaboratorCreationUseCase = collaboratorCreationUseCase;
        this.getCollaboratorByIdUseCase = getCollaboratorByIdUseCase;
        this.deleteCollaboratorUseCase = deleteCollaboratorUseCase;
    }

    @Override
    public ResponseEntity<CollaboratorCreationResponseDTO> createCollaborator(
            CollaboratorCreationRequestDTO collaboratorCreationRequestDTO) {
        return ResponseEntity.status(HttpStatus.CREATED)
                .body(collaboratorCreationUseCase.create(collaboratorCreationRequestDTO));
    }

    @Override
    public ResponseEntity<Void> deleteCollaboratorById(Integer collaboratorId) {
        deleteCollaboratorUseCase.delete(collaboratorId);
        return ResponseEntity.noContent().build();
    }

    @Override
    public ResponseEntity<GetCollaboratorResponseDTO> getCollaboratorById(Integer collaboratorId) {
        Optional<GetCollaboratorResponseDTO> response = getCollaboratorByIdUseCase.getCollaboratorId(collaboratorId);
        return response.map(ResponseEntity::ok).orElseGet(() -> ResponseEntity.notFound().build());
    }

    @Override
    public ResponseEntity<List<GetCollaboratorResponseDTO>> getCollaborators() {
        return ResponseEntity.ok(getAllCollaboratorsUseCase.getAll());
    }
}
