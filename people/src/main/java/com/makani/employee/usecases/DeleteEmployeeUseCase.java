package com.makani.employee.usecases;

import com.makani.employee.interfaceadapters.EmployeeRepository;
import com.makani.people.employee.EmployeeDataModel;
import com.makani.exception.EmployeeDeletionNotAllowedException;
import com.makani.exception.EmployeeNotFoundException;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

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
            try {
                employeeRepository.delete(found.get());
            } catch(DataIntegrityViolationException ex) {
                throw new EmployeeDeletionNotAllowedException(ex);
            }
        } else {
            throw new EmployeeNotFoundException(String.valueOf(employeeId));
        }
    }
}
