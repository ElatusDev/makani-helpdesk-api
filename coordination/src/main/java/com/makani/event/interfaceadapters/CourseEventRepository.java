/*
 * Copyright (c) 2025 ElatusDev
 * All rights reserved.
 *
 * This code is proprietary and confidential.
 * Unauthorized copying, distribution, or modification is strictly prohibited.
 */
package com.makani.event.interfaceadapters;

import com.makani.coordination.event.CourseEventDataModel;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CourseEventRepository extends JpaRepository <CourseEventDataModel, Integer >{
}
