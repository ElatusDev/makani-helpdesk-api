package com.makani.program.interfaceadapters;

import com.makani.program.usecases.CreateCourseUseCase;
import io.swagger.v3.oas.annotations.Parameter;
import jakarta.validation.Valid;
import openapi.makani.domain.coordination.api.CoursesApi;
import openapi.makani.domain.coordination.dto.CourseCreationRequestDTO;
import openapi.makani.domain.coordination.dto.CourseCreationResponseDTO;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/coordination")
public class CourseController implements CoursesApi {
    private final CreateCourseUseCase createCourseUseCase;

    public CourseController(CreateCourseUseCase createCourseUseCase) {
        this.createCourseUseCase = createCourseUseCase;
    }

    @Override
    public ResponseEntity<CourseCreationResponseDTO> createCourse(CourseCreationRequestDTO courseCreationRequestDTO) {
        return ResponseEntity.status(HttpStatus.CREATED).body(createCourseUseCase.create(courseCreationRequestDTO));
    }
}
