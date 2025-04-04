package com.makani.program.interfaceadapters;

import org.springframework.data.jpa.repository.JpaRepository;

public interface CourseRepository extends JpaRepository <CourseDataModel, Integer>{
}
