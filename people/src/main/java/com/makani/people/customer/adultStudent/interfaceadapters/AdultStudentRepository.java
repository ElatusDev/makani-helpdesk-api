/*
 * Copyright (c) 2025 ElatusDev
 * All rights reserved.
 *
 * This code is proprietary and confidential.
 * Unauthorized copying, distribution, or modification is strictly prohibited.
 */
package com.makani.people.customer.adultStudent.interfaceadapters;

import com.makani.people.customer.AdultStudentDataModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AdultStudentRepository extends JpaRepository <AdultStudentDataModel, Integer> {
}
