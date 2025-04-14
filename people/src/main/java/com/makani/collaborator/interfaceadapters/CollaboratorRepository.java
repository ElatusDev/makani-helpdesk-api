package com.makani.collaborator.interfaceadapters;

import com.makani.people.collaborator.CollaboratorDataModel;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CollaboratorRepository extends JpaRepository<CollaboratorDataModel, Integer> {

}
