package com.makani.employee.interfaceadapters;

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
@Table(name = "employee_auth")
public class EmployeeAuthDataModel implements Serializable {
    @Serial
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "employee_auth_id")
    private Integer employeeAuthId;
    @Lob
    @Column(name = "username_token",nullable = false, columnDefinition = "TEXT")
    private String usernameToken;
    @Lob
    @Column(name = "password_token",nullable = false, columnDefinition = "TEXT")
    private String passwordToken;
}
