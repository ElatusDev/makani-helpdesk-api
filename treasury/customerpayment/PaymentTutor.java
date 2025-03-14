package com.makani.domain.treasury.customerpayment;

import com.makani.domain.people.customer.Tutor;
import com.makani.domain.treasury.membership.interfaceadapters.Membership;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import java.io.Serial;
import java.io.Serializable;
import java.time.LocalDateTime;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Scope("prototype")
@Component
@Entity
@Table(name = "payment_tutor")
public class PaymentTutor implements Serializable {
    @Serial
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "payment_tutor_id")
    private Integer paymentTutorId;
    @Column(name = "payment_date", columnDefinition = "TIMESTAMP", nullable = false)
    private LocalDateTime paymentDate;
    @Column(nullable = false)
    private Double amount;
    @Column(name = "payment_method", nullable = false, length = 25)
    private String paymentMethod;

    @ManyToOne
    @JoinColumn(name = "membership_id")
    private Membership membership;

    @ManyToOne
    @JoinColumn(name = "tutor_id")
    private Tutor tutor;
}
