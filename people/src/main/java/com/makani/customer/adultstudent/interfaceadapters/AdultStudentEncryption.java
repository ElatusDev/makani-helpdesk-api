package com.makani.customer.adultstudent.interfaceadapters;


import com.makani.people.customer.AdultStudentDataModel;
import com.makani.utilities.AESGCMEncryptionService;
import org.springframework.stereotype.Component;

@Component
public class AdultStudentEncryption {

    private final AESGCMEncryptionService encryption;

    public AdultStudentEncryption(AESGCMEncryptionService encryption) {
        this.encryption = encryption;
    }

    public AdultStudentDataModel encrypt(AdultStudentDataModel model) {
        model.setFirstName(encryption.encrypt(model.getFirstName()));
        model.setLastName(encryption.encrypt(model.getLastName()));
        model.setEmail(encryption.encrypt(model.getEmail()));
        model.setPhone(encryption.encrypt(model.getPhone()));
        model.setAddress(encryption.encrypt(model.getAddress()));
        model.setZipCode(encryption.encrypt(model.getZipCode()));
        model.setProfilePicture(encryption.encrypt(model.getProfilePicture()));
        return model;
    }

    public AdultStudentDataModel decrypt(AdultStudentDataModel model) {
        model.setFirstName(encryption.decrypt(model.getFirstName()));
        model.setLastName(encryption.decrypt(model.getLastName()));
        model.setEmail(encryption.decrypt(model.getEmail()));
        model.setPhone(encryption.decrypt(model.getPhone()));
        model.setAddress(encryption.decrypt(model.getAddress()));
        model.setZipCode(encryption.decrypt(model.getZipCode()));
        model.setProfilePicture(encryption.decrypt(model.getProfilePicture()));
        return model;
    }
}
