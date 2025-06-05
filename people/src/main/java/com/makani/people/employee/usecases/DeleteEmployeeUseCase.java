package com.makani.people.employee.usecases;

import com.makani.people.employee.interfaceadapters.EmployeeRepository;
import com.makani.people.employee.EmployeeDataModel;
import org.springframework.stereotype.Service;

import java.util.NoSuchElementException;
import java.util.Optional;

@Service
public class DeleteEmployeeUseCase {
    private final EmployeeRepository employeeRepository;
    public DeleteEmployeeUseCase(EmployeeRepository employeeRepository) {
        this.employeeRepository = employeeRepository;
    }

    public void delete(Integer employeeId) {
        Optional<EmployeeDataModel> found = employeeRepository.findByEmployeeId(employeeId);
        if(found.isPresent()) {
            employeeRepository.delete(found.get());
        } else {
            throw new NoSuchElementException(String.valueOf(employeeId));
        }
    }
}
