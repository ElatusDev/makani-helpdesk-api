package com.makani.customerpayment.interfaceadapters;

import org.springframework.data.jpa.repository.JpaRepository;

public interface PayInfoRepository extends JpaRepository<PayInfoDataModel, Integer> {
}
