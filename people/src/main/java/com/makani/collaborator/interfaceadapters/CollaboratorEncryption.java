package com.makani.collaborator.interfaceadapters;

import com.makani.people.collaborator.CollaboratorDataModel;
import com.makani.utilities.AESGCMEncryptionService;
import org.springframework.stereotype.Component;

@Component
public class CollaboratorEncryption {

    private final AESGCMEncryptionService encryptionService;

    public CollaboratorEncryption(AESGCMEncryptionService encryptionService) {
        this.encryptionService = encryptionService;
    }

    public CollaboratorDataModel encrypt(CollaboratorDataModel model) {
        model.setFirstName(encryptionService.encrypt(model.getFirstName()));
        model.setLastName(encryptionService.encrypt(model.getLastName()));
        model.setEmail(encryptionService.encrypt(model.getEmail()));
        model.setPhone(encryptionService.encrypt(model.getPhone()));
        model.setAddress(encryptionService.encrypt(model.getAddress()));
        model.setZipCode(encryptionService.encrypt(model.getZipCode()));
        model.setProfilePicture(encryptionService.encrypt(model.getProfilePicture()));
        return model;
    }

    public CollaboratorDataModel decrypt(CollaboratorDataModel model) {
        model.setFirstName(encryptionService.decrypt(model.getFirstName()));
        model.setLastName(encryptionService.decrypt(model.getLastName()));
        model.setEmail(encryptionService.decrypt(model.getEmail()));
        model.setPhone(encryptionService.decrypt(model.getPhone()));
        model.setAddress(encryptionService.decrypt(model.getAddress()));
        model.setZipCode(encryptionService.decrypt(model.getZipCode()));
        model.setProfilePicture(encryptionService.decrypt(model.getProfilePicture()));
        return model;
    }
}
