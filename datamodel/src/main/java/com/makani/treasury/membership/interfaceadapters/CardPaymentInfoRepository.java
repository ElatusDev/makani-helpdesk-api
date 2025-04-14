package com.makani.treasury.membership.interfaceadapters;

import com.makani.treasury.customerpayment.CardPaymentInfoDataModel;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CardPaymentInfoRepository extends JpaRepository<CardPaymentInfoDataModel, Integer> {
}
