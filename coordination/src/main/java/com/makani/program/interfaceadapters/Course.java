package com.makani.program.interfaceadapters;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import openapi.makani.domain.people.dto.Instructor;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import java.io.Serial;
import java.io.Serializable;
import java.util.List;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Scope("prototype")
@Component
@Entity
@Table(name = "course")
public class Course implements Serializable {
    @Serial
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "course_id")
    private Integer courseId;
    @Column(name = "course_name", nullable = false, length = 50)
    private String name;
    @Column(name = "course_description", nullable = false, length = 200)
    private String description;
    @Column(name = "max_capacity", nullable = false)
    private Integer maxCapacity;

    @ManyToMany
    @JoinTable(
            name = "course_schedule",
            joinColumns = @JoinColumn(name = "course_id"),
            inverseJoinColumns = @JoinColumn(name = "schedule_id")
    )
    private List<Schedule> timeTable;

    @ManyToMany
    @JoinTable(
            name = "course_available_instructors",
            joinColumns = @JoinColumn(name = "course_id"),
            inverseJoinColumns = @JoinColumn(name = "instructor_id")
    )
    private List<Instructor> availableInstructors;

    @ManyToMany
    @JoinTable(
            name = "adult_student_course",
            joinColumns = @JoinColumn(name = "adult_student_id"),
            inverseJoinColumns = @JoinColumn(name = "course_id")
    )
    private List<Course> registeredCourses;

}
