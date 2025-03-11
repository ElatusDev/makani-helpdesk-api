package com.makani.employee.entities;

import com.makani.employee.interfaceadapters.EmployeeAuthDataModel;


public class EmployeeEntity {

    private Integer employeeId;
    private String employeeType;
    private EmployeeAuthDataModel employeeAuth;

    public boolean isValidEmployeeType() {
        return employeeType != null && !employeeType.isEmpty()
                && (employeeType.equals("Directora") || employeeType.equals("Recepcionista"));
    }
}
