package com.makani.customer.interfaceadapters;

import org.springframework.data.jpa.repository.JpaRepository;

public interface MinorStudentRepository extends JpaRepository <MinorStudentDataModel, Integer> {
}
