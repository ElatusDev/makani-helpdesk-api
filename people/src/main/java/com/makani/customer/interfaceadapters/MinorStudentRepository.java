package com.makani.customer.interfaceadapters;

import com.makani.people.customer.MinorStudentDataModel;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MinorStudentRepository extends JpaRepository <MinorStudentDataModel, Integer> {
}
