/*
 * Copyright (c) 2025 ElatusDev
 * All rights reserved.
 *
 * This code is proprietary and confidential.
 * Unauthorized copying, distribution, or modification is strictly prohibited.
 */
package com.makani.people.config;

import com.makani.people.collaborator.CollaboratorDataModel;
import com.makani.people.employee.EmployeeDataModel;
import openapi.makani.domain.people.dto.CollaboratorCreationRequestDTO;
import openapi.makani.domain.people.dto.EmployeeCreationRequestDTO;
import org.modelmapper.Converter;
import org.modelmapper.ModelMapper;
import org.modelmapper.PropertyMap;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.sql.Date;
import java.time.LocalDate;

@Configuration
public class PeopleConfig {

    @Bean
    public ModelMapper modelMapper() {
        ModelMapper modelMapper = new ModelMapper();

        PropertyMap<EmployeeCreationRequestDTO, EmployeeDataModel> employeeMap = new PropertyMap<>() {
            protected void configure() {
                map(source.getBirthDate(), destination.getBirthDate());

                assert source.getEmployeeAuth() != null;
                map(source.getEmployeeAuth().getUsernameToken(), destination.getInternalAuth().getUsernameToken());
                map(source.getEmployeeAuth().getPasswordToken(), destination.getInternalAuth().getPasswordToken());
            }
        };

        PropertyMap<CollaboratorCreationRequestDTO, CollaboratorDataModel> collaboratorMap = new PropertyMap<>() {
            protected void configure() {
                map(source.getBirthDate(), destination.getBirthDate());

                assert source.getEmployeeAuth() != null;
                map(source.getEmployeeAuth().getUsernameToken(), destination.getInternalAuth().getUsernameToken());
                map(source.getEmployeeAuth().getPasswordToken(), destination.getInternalAuth().getPasswordToken());
            }
        };

        modelMapper.addMappings(employeeMap);
        modelMapper.addMappings(collaboratorMap);
        addLocalDateToSqlDateConverter(modelMapper);
        return modelMapper;
    }

    private void addLocalDateToSqlDateConverter(ModelMapper modelMapper) {
        Converter<LocalDate, Date> localDateToSqlDate = mappingContext ->
                mappingContext.getSource() == null ? null : Date.valueOf(mappingContext.getSource());

        modelMapper.addConverter(localDateToSqlDate, LocalDate.class, Date.class);
    }

}
