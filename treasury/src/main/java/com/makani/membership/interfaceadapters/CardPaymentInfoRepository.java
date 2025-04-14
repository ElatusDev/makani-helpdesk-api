/*
 * Copyright (c) 2025 ElatusDev
 * All rights reserved.
 *
 * This code is proprietary and confidential.
 * Unauthorized copying, distribution, or modification is strictly prohibited.
 */
package com.makani.membership.interfaceadapters;

import com.makani.treasury.customerpayment.CardPaymentInfoDataModel;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CardPaymentInfoRepository extends JpaRepository<CardPaymentInfoDataModel, Integer> {
}
