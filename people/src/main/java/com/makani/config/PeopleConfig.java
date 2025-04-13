package com.makani.config;

import com.makani.employee.interfaceadapters.EmployeeDataModel;
import openapi.makani.domain.people.dto.EmployeeCreateRequestDTO;
import org.modelmapper.ModelMapper;
import org.modelmapper.PropertyMap;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class PeopleConfig {
    @Bean
    public ModelMapper modelMapper() {
        ModelMapper modelMapper = new ModelMapper();
        PropertyMap<EmployeeCreateRequestDTO, EmployeeDataModel> employeeAuthMap = new PropertyMap<>() {
            protected void configure() {
                assert source.getEmployeeAuth() != null;
                map(source.getEmployeeAuth().getUsernameToken(), destination.getEmployeeAuth().getUsernameToken());
                map(source.getEmployeeAuth().getUsernameToken(), destination.getEmployeeAuth().getPasswordToken());
            }
        };

        modelMapper.addMappings(employeeAuthMap);
        return modelMapper;
    }
}
