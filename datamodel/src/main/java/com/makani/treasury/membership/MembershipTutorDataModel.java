/*
 * Copyright (c) 2025 ElatusDev
 * All rights reserved.
 *
 * This code is proprietary and confidential.
 * Unauthorized copying, distribution, or modification is strictly prohibited.
 */
package com.makani.treasury.membership;

import com.makani.people.customer.TutorDataModel;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import java.io.Serial;
import java.io.Serializable;

@NoArgsConstructor
@AllArgsConstructor
@Scope("prototype")
@Component
@Entity
@Table(name = "membership_tutor")
public class MembershipTutorDataModel extends MembershipAssociationBase implements Serializable {
    @Serial
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "membership_tutor_id")
    private Integer membershipTutorId;

    @ManyToOne
    @JoinColumn(name = "tutor_id")
    private TutorDataModel tutor;
}
