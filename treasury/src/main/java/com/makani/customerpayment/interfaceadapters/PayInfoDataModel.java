package com.makani.customerpayment.interfaceadapters;

import com.makani.customer.interfaceadapters.AdultStudentDataModel;
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
public class PayInfoDataModel implements Serializable {
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
    @JoinColumn(name = "adult_student_id")
    private AdultStudentDataModel AdultStudent;

    @OneToOne
    @JoinColumn(name = "tutor_id")
    private AdultStudentDataModel Tutor;

}
