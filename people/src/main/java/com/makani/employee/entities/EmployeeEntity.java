/*
 * Copyright (c) 2025 ElatusDev
 * All rights reserved.
 *
 * This code is proprietary and confidential.
 * Unauthorized copying, distribution, or modification is strictly prohibited.
 */
package com.makani.employee.entities;

import com.makani.people.employee.InternalAuthDataModel;


public class EmployeeEntity {

    private Integer employeeId;
    private String employeeType;
    private InternalAuthDataModel employeeAuth;

    public boolean isValidEmployeeType() {
        return employeeType != null && !employeeType.isEmpty()
                && (employeeType.equals("Directora") || employeeType.equals("Recepcionista"));
    }
}
