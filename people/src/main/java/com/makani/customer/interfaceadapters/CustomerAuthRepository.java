package com.makani.customer.interfaceadapters;

import org.springframework.data.jpa.repository.JpaRepository;

public interface CustomerAuthRepository extends JpaRepository <CustomerAuthDataModel, Integer> {
}
