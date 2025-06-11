package com.makani.program.usecases;

import com.makani.coordination.program.CourseDataModel;
import com.makani.program.interfaceadapters.CourseRepository;
import openapi.makani.domain.coordination.dto.CourseCreationRequestDTO;
import openapi.makani.domain.coordination.dto.CourseCreationResponseDTO;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

@Service
public class CreateCourseUseCase {
    private final CourseRepository courseRepository;
    private final ModelMapper modelMapper;

    public CreateCourseUseCase(CourseRepository courseRepository,
                               ModelMapper modelMapper) {
        this.courseRepository = courseRepository;
        this.modelMapper = modelMapper;
    }

    public CourseCreationResponseDTO create(CourseCreationRequestDTO courseCreationRequestDTO) {
        CourseDataModel model = modelMapper.map(courseCreationRequestDTO, CourseDataModel.class);
        CourseDataModel persisted = courseRepository.save(model);
        return modelMapper.map(persisted, CourseCreationResponseDTO.class);
    }
}
