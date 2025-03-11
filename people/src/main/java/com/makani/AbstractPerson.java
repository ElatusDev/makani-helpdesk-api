package com.makani;

import jakarta.persistence.Column;
import jakarta.persistence.MappedSuperclass;
import lombok.Getter;
import lombok.Setter;

import java.sql.Date;

@Getter
@Setter
@MappedSuperclass
public abstract class AbstractPerson {

    @Column(name = "first_name", nullable = false, length = 30)
    private String firstName;
    @Column(name = "last_name", nullable = false, length = 30)
    private String lastName;
    @Column(nullable = false, length = 50, unique = true)
    private String email;
    @Column(nullable = false, length = 15, unique = true)
    private String phone;
    @Column(nullable = false, length = 50)
    private String address;
    @Column(name = "zip_code", nullable = false, length = 8)
    private String zipCode;
    @Column(name ="birthdate", nullable = false)
    private Date birthDate;
}
