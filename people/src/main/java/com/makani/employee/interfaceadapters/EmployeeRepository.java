package com.makani.employee.interfaceadapters;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface EmployeeRepository extends JpaRepository<EmployeeDataModel, Integer> {
    Optional<EmployeeDataModel> findByEmployeeId(Integer employeeId);
}
