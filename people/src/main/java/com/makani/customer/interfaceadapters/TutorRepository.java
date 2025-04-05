package com.makani.customer.interfaceadapters;

import org.springframework.data.jpa.repository.JpaRepository;

public interface TutorRepository extends JpaRepository <TutorDataModel, Integer> {
}
