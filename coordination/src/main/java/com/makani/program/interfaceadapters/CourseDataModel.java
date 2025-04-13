package com.makani.program.interfaceadapters;

import com.makani.customer.interfaceadapters.AdultStudentDataModel;
import com.makani.instructor.interfaceadapters.InstructorDataModel;
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
public class CourseDataModel implements Serializable {
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
    private List<ScheduleDataModel> timeTable;

    @ManyToMany
    @JoinTable(
            name = "course_available_instructors",
            joinColumns = @JoinColumn(name = "course_id"),
            inverseJoinColumns = @JoinColumn(name = "instructor_id")
    )
    private List<InstructorDataModel> availableInstructors;
}
