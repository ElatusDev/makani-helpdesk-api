package com.makani.employee.interfaceadapters;

import com.makani.people.employee.EmployeeDataModel;
import com.makani.utilities.AESGCMEncryptionService;
import com.makani.utilities.exceptions.DecryptionException;
import com.makani.utilities.exceptions.EncryptionException;
import org.springframework.stereotype.Component;

@Component
public class EmployeeEncryption {
    
    private final AESGCMEncryptionService encryptionService;
    
    public EmployeeEncryption(AESGCMEncryptionService encryptionService) {
        this.encryptionService = encryptionService;
    }

    public EmployeeDataModel encrypt(EmployeeDataModel model) throws EncryptionException {
        model.setFirstName(encryptionService.encrypt(model.getFirstName()));
        model.setLastName(encryptionService.encrypt(model.getLastName()));
        model.setEmail(encryptionService.encrypt(model.getEmail()));
        model.setPhone(encryptionService.encrypt(model.getPhone()));
        model.setAddress(encryptionService.encrypt(model.getAddress()));
        model.setZipCode(encryptionService.encrypt(model.getZipCode()));
        return model;
    }

    public EmployeeDataModel decrypt(EmployeeDataModel model) throws DecryptionException {
        model.setFirstName(encryptionService.decrypt(model.getFirstName()));
        model.setLastName(encryptionService.decrypt(model.getLastName()));
        model.setEmail(encryptionService.decrypt(model.getEmail()));
        model.setPhone(encryptionService.decrypt(model.getPhone()));
        model.setAddress(encryptionService.decrypt(model.getAddress()));
        model.setZipCode(encryptionService.decrypt(model.getZipCode()));
        model.setEmployeeType(encryptionService.decrypt(model.getEmployeeType()));
        return model;
    }
}
