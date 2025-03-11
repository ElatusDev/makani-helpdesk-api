package com.makani.domain.treasury.payroll;

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
@Table(name = "compensation")
public class Compensation implements Serializable {
    @Serial
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "compensation_id")
    private Integer compensationId;
    @Column(name = "compensation_type", nullable = false, length = 10)
    private String compensationType;
    @Column(nullable = false)
    private Double amount;

    @OneToMany
    @JoinColumn(name = "compensation_id")
    private List<Instructor> instructors;
}
