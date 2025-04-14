package com.makani.treasury.membership.interfaceadapters;

import com.makani.treasury.customerpayment.PaymentTutorDataModel;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PaymentTutorRepository extends JpaRepository<PaymentTutorDataModel, Integer> {
}
