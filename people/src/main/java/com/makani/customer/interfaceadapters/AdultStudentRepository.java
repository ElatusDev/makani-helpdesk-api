package com.makani.customer.interfaceadapters;

import com.makani.people.customer.AdultStudentDataModel;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AdultStudentRepository extends JpaRepository <AdultStudentDataModel, Integer> {
}
