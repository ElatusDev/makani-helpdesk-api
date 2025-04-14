package com.makani.program.interfaceadapters;

import com.makani.coordination.program.CourseDataModel;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CourseRepository extends JpaRepository <CourseDataModel, Integer>{
}
