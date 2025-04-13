package com.makani.calendar.interfaceadapters;

import com.makani.customer.interfaceadapters.AdultStudentDataModel;
import com.makani.customer.interfaceadapters.MinorStudentDataModel;
import com.makani.instructor.interfaceadapters.InstructorDataModel;
import com.makani.program.interfaceadapters.CourseDataModel;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import java.io.Serial;
import java.io.Serializable;
import java.sql.Time;
import java.time.LocalDate;
import java.util.List;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Scope("prototype")
@Component
@Entity
@Table(name = "course_event")
public class CourseEventDataModel extends AbstractEvent implements Serializable {
    @Serial
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "course_event_id")
    private Integer courseEventId;

    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    @JoinColumn(name = "course_id")
    private CourseDataModel course;

    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    @JoinColumn(name = "instructor_id")
    private InstructorDataModel instructor;

    @ManyToMany
    @JoinTable(
            name = "course_event_attendees",
            joinColumns = @JoinColumn(name = "event_id"),
            inverseJoinColumns = @JoinColumn(name = "adult_student_id")
    )
    private List<AdultStudentDataModel> adultAttendees;
    @ManyToMany
    @JoinTable(
            name = "course_event_attendees",
            joinColumns = @JoinColumn(name = "event_id"),
            inverseJoinColumns = @JoinColumn(name = "minor_student_id")
    )
    private List<MinorStudentDataModel> minorAttendees;
}
