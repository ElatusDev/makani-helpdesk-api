/*
 * Copyright (c) 2025 ElatusDev
 * All rights reserved.
 *
 * This code is proprietary and confidential.
 * Unauthorized copying, distribution, or modification is strictly prohibited.
 */
package com.makani.customer.adultstudent.usecases;

import com.makani.customer.adultstudent.interfaceadapters.AdultStudentRepository;
import com.makani.exception.AdultStudentDeletionNotAllowedException;
import com.makani.exception.AdultStudentNotFoundException;
import com.makani.people.customer.AdultStudentDataModel;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class DeleteAdultStudentUseCase {
    private final AdultStudentRepository adultStudentRepository;

    public DeleteAdultStudentUseCase(AdultStudentRepository adultStudentRepository) {
        this.adultStudentRepository = adultStudentRepository;
    }

    public void delete(Integer adultStudentId) {
        Optional<AdultStudentDataModel> result = adultStudentRepository.findById(adultStudentId);
        if(result.isPresent()) {
            try {
                adultStudentRepository.delete(result.get());
            } catch(DataIntegrityViolationException ex) {
                throw new AdultStudentDeletionNotAllowedException(ex);
            }
        } else {
            throw new AdultStudentNotFoundException(String.valueOf(adultStudentId));
        }
    }
}
