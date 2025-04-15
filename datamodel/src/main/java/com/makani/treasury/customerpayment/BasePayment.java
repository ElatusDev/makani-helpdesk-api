package com.makani.treasury.customerpayment;

import jakarta.persistence.Column;
import jakarta.persistence.MappedSuperclass;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDate;

@Getter
@Setter
@MappedSuperclass
public abstract class BasePayment {
    @Column(name = "payment_date", columnDefinition = "DATE", nullable = false)
    private LocalDate paymentDate;
    @Column(nullable = false)
    private Double amount;
    @Column(name = "payment_method", nullable = false, length = 25)
    private String paymentMethod;
}
