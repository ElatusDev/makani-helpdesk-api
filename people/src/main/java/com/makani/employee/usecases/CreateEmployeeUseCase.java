package com.makani.employee.usecases;

import openapi.makani.domain.people.dto.EmployeeCreateRequest;
import com.makani.employee.interfaceadapters.EmployeeDataModel;
import com.makani.employee.interfaceadapters.EmployeeRepository;
import org.modelmapper.ModelMapper;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

@Service
public class CreateEmployeeUseCase {

    private final EmployeeRepository employeeRepository;
    private final ModelMapper modelMapper;
    private final MessageSource messageSource;

    public CreateEmployeeUseCase(EmployeeRepository employeeRepository, ModelMapper modelMapper, MessageSource messageSource) {
        this.employeeRepository = employeeRepository;
        this.modelMapper = modelMapper;
        this.messageSource = messageSource;
    }

    public Integer createEmployee(EmployeeCreateRequest employeeCreateRequest) throws InvalidCreateRequestException {
            EmployeeDataModel received =  modelMapper.map(employeeCreateRequest, EmployeeDataModel.class);
            try {
                EmployeeDataModel persisted = employeeRepository.save(received);
                return persisted.getEmployeeId();
            } catch(Exception e) {
                String message = messageSource.getMessage("data.fieldDataIsNotUnique",
                                new Object[]{"email", "empleado"}, LocaleContextHolder.getLocale());
                throw new InvalidCreateRequestException(message, e);
            }
    }
}
