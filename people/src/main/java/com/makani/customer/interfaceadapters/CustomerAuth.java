package com.makani.customer.interfaceadapters;

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
@Table(name = "customer_auth")
public class CustomerAuth implements Serializable {
    @Serial
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "customer_auth_id")
    private Integer customerAuthId;
    @Column(nullable = false, length = 9)
    private String provider;
    @Lob
    @Column(nullable = false, columnDefinition = "TEXT")
    private String token;
}
