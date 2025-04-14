package com.makani.customer.interfaceadapters;

import com.makani.people.customer.TutorDataModel;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TutorRepository extends JpaRepository <TutorDataModel, Integer> {
}
