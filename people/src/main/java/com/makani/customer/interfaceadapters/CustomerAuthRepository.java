package com.makani.customer.interfaceadapters;

import com.makani.people.customer.CustomerAuthDataModel;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CustomerAuthRepository extends JpaRepository <CustomerAuthDataModel, Integer> {
}
