package com.makani.instructor.interfaceadapters;

import org.springframework.data.jpa.repository.JpaRepository;

public interface InstructorRespository extends JpaRepository<InstructorDataModel, Integer> {

}
