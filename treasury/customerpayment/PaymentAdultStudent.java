package com.makani.domain.treasury.customerpayment;

import com.makani.domain.people.customer.AdultStudent;
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
import java.time.LocalDate;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Scope("prototype")
@Component
@Entity
@Table(name = "payment_adult_student")
public class PaymentAdultStudent implements Serializable {
    @Serial
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "payment_adult_student_id")
    private Integer paymentAdultStudentId;
    @Column(name = "payment_date", columnDefinition = "DATE", nullable = false)
    private LocalDate paymentDate;
    @Column(nullable = false)
    private Double amount;
    @Column(name = "payment_method", nullable = false, length = 25)
    private String paymentMethod;

    @JoinColumn(name = "membership_id")
    @ManyToOne
    private Membership membership;

    @ManyToOne
    @JoinColumn(name = "adult_student_id")
    private AdultStudent adultStudent;
}
