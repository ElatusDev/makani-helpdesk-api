package com.makani.treasury.membership.interfaceadapters;

import com.makani.treasury.customerpayment.PaymentAdultStudentDataModel;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PaymentAdultStudentRepository extends JpaRepository<PaymentAdultStudentDataModel, Integer> {
}
