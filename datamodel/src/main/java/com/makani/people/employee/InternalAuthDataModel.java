package com.makani.people.employee;

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
@Table(name = "internal_auth")
public class InternalAuthDataModel implements Serializable {
    @Serial
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "internal_auth_id")
    private Integer internalAuthId;
    @Lob
    @Column(name = "username_token",nullable = false, columnDefinition = "TEXT")
    private String usernameToken;
    @Lob
    @Column(name = "password_token",nullable = false, columnDefinition = "TEXT")
    private String passwordToken;
}
