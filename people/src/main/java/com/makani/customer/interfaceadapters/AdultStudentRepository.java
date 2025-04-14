/*
 * Copyright (c) 2025 ElatusDev
 * All rights reserved.
 *
 * This code is proprietary and confidential.
 * Unauthorized copying, distribution, or modification is strictly prohibited.
 */
package com.makani.customer.interfaceadapters;

import com.makani.people.customer.AdultStudentDataModel;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AdultStudentRepository extends JpaRepository <AdultStudentDataModel, Integer> {
}
