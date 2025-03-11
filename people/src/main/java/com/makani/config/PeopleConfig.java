package com.makani.config;

import com.makani.employee.interfaceadapters.EmployeeDataModel;
import openapi.makani.domain.people.dto.EmployeeCreateRequest;
import org.modelmapper.ModelMapper;
import org.modelmapper.PropertyMap;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class PeopleConfig {
    @Bean
    public ModelMapper modelMapper() {
        ModelMapper modelMapper = new ModelMapper();
        PropertyMap<EmployeeCreateRequest, EmployeeDataModel> employeeAuthMap = new PropertyMap<>() {
            protected void configure() {
                map(source.getUsernameToken(), destination.getEmployeeAuth().getUsernameToken());
                map(source.getPasswordToken(), destination.getEmployeeAuth().getPasswordToken());
            }
        };

        modelMapper.addMappings(employeeAuthMap);
        return modelMapper;
    }
}
