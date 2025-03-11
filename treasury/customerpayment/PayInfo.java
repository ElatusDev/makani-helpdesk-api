package com.makani.domain.treasury.customerpayment;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import java.io.Serial;
import java.io.Serializable;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Scope("prototype")
@Component
@Entity
@Table(name = "pay_info")
public class PayInfo implements Serializable {
    @Serial
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "pay_info_id")
    private Integer payInfoId;
    @Column(name = "payment_id", nullable = false)
    private Long paymentId;
    @Lob
    @Column(nullable = false, columnDefinition = "TEXT")
    private String token;
    @Column(name = "card_type", nullable = false, length = 7)
    private String cardType;

    @OneToOne
    @JoinColumn(optional = true,name = "adult_student_id")
    private AdultStudent AdultStudent;

    @OneToOne
    @JoinColumn(optional = true, name = "tutor_id")
    private AdultStudent Tutor;

}
