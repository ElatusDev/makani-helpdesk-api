package com.makani.event.interfaceadapters;

import com.makani.coordination.event.CourseEventDataModel;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CourseEventRepository extends JpaRepository <CourseEventDataModel, Integer >{
}
