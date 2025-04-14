/*
 * Copyright (c) 2025 ElatusDev
 * All rights reserved.
 *
 * This code is proprietary and confidential.
 * Unauthorized copying, distribution, or modification is strictly prohibited.
 */
package com.makani.treasury.membership;

import com.makani.people.customer.AdultStudentDataModel;
import com.makani.coordination.program.CourseDataModel;
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


@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Scope("prototype")
@Component
@Entity
@Table(name = "membership_adult_student")
public class MembershipAdultStudentDataModel extends MembershipBaseDataModel implements Serializable {
    @Serial
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "membership_adult_student_id")
    private Integer membershipAdultStudentId;

    @ManyToOne
    @JoinColumn(name = "adult_student_id")
    private AdultStudentDataModel adultStudent;

}
