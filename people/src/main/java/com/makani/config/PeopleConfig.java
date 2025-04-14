package com.makani.config;

import com.makani.people.employee.EmployeeDataModel;
import openapi.makani.domain.people.dto.EmployeeCreationRequestDTO;
import org.modelmapper.ModelMapper;
import org.modelmapper.PropertyMap;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class PeopleConfig {
    @Bean
    public ModelMapper modelMapper() {
        ModelMapper modelMapper = new ModelMapper();
        PropertyMap<EmployeeCreationRequestDTO, EmployeeDataModel> employeeAuthMap = new PropertyMap<>() {
            protected void configure() {
                assert source.getEmployeeAuth() != null;
                map(source.getEmployeeAuth().getUsernameToken(), destination.getInternalAuth().getUsernameToken());
                map(source.getEmployeeAuth().getUsernameToken(), destination.getInternalAuth().getPasswordToken());
            }
        };

        modelMapper.addMappings(employeeAuthMap);
        return modelMapper;
    }
}
