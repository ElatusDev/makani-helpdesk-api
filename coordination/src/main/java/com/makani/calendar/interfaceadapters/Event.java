package com.makani.calendar.interfaceadapters;

import com.makani.customer.interfaceadapters.AdultStudent;
import com.makani.customer.interfaceadapters.MinorStudent;
import com.makani.program.interfaceadapters.Course;
import com.makani.instructor.interfaceadapters.InstructorDataModel;
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
@Table(name = "calendar_event")
public class Event implements Serializable {
    @Serial
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "event_id")
    private Integer eventId;
    @Column(name = "event_date", nullable = false, columnDefinition = "DATE", updatable = false)
    private LocalDate date;
    @Column(name = "event_title", nullable = false, length = 50)
    private String title;
    @Column(name = "event_description", nullable = false, length = 200)
    private String description;
    @Column(name = "start_time", nullable = false)
    private Time startTime;
    @Column(name = "end_time", nullable = false)
    private Time endTime;

    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    @JoinColumn(name = "course_id")
    private Course course;

    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    @JoinColumn(name = "instructor_id")
    private InstructorDataModel instructor;

    @ManyToMany
    @JoinTable(
            name = "event_attendees",
            joinColumns = @JoinColumn(name = "event_id"),
            inverseJoinColumns = @JoinColumn(name = "adult_student_id")
    )
    private List<AdultStudent> adultAttendees;
    @ManyToMany
    @JoinTable(
            name = "event_attendees",
            joinColumns = @JoinColumn(name = "event_id"),
            inverseJoinColumns = @JoinColumn(name = "minor_student_id")
    )
    private List<MinorStudent> minorAttendees;
}
