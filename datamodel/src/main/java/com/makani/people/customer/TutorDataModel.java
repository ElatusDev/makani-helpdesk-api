/*
 * Copyright (c) 2025 ElatusDev
 * All rights reserved.
 *
 * This code is proprietary and confidential.
 * Unauthorized copying, distribution, or modification is strictly prohibited.
 */
package com.makani.people.customer;

import com.makani.utilities.interfaceadapters.StringEncryptor;
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
@Table(name = "tutor")
public class TutorDataModel implements Serializable {
    @Serial
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "tutor_id")
    private Integer tutorId;

    @Convert(converter = StringEncryptor.class)
    @Column(name = "encrypted_first_name", nullable = false)
    private String firstName;

    @Convert(converter = StringEncryptor.class)
    @Column(name = "encrypted_last_name", nullable = false)
    private String lastName;

    @Convert(converter = StringEncryptor.class)
    @Column(name = "encrypted_phone", nullable = false)
    private String phone;

    @Convert(converter = StringEncryptor.class)
    @Column(name = "encrypted_email")
    private String email;

    @Column(name = "email_hash", nullable = false, length = 64, unique = true)
    private String emailHash;
    @Column(name = "phone_hash", nullable = false, length = 64, unique = true)
    private String phoneHash;

    @OneToOne(optional = true, cascade =  CascadeType.ALL, orphanRemoval = true)
    @JoinColumn(name = "customer_auth_id")
    private CustomerAuthDataModel customerAuth;
}
