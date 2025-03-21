package com.makani.domain.treasury.membership.interfaceadapters;

import com.makani.domain.coordination.program.Course;
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
@Table(name = "membership")
public class Membership implements Serializable {
    @Serial
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "membership_id")
    private Integer membershipId;
    @Column(name = "membership_type", nullable = false, length = 10)
    private String membershipType;
    @Column(nullable = false)
    private Double fee;
    @Column(nullable = false, length = 100)
    private String description;

    @ManyToOne
    @JoinColumn(name = "course_id")
    private Course course;
}
