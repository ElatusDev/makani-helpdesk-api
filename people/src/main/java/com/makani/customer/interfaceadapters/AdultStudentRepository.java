package com.makani.customer.interfaceadapters;

import org.springframework.data.jpa.repository.JpaRepository;

public interface AdultStudentRepository extends JpaRepository <AdultStudentDataModel, Integer> {
}
