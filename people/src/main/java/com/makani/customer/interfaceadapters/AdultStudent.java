package com.makani.customer.interfaceadapters;

import com.makani.AbstractPerson;
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
@Table(name = "adult_student")
public class AdultStudent extends AbstractPerson implements Serializable {
    @Serial
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "adult_student_id")
    private Integer adultStudentId;
    @Lob
    @Column(name = "profile_picture", columnDefinition = "MEDIUMBLOB")
    private Byte[] profilePicture;

    @OneToOne(optional = false)
    @JoinColumn(name = "customer_auth_id")
    private CustomerAuth customerAuth;


}
