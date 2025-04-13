package com.makani.calendar.interfaceadapters;

import com.makani.program.interfaceadapters.ScheduleDataModel;
import jakarta.persistence.Column;
import jakarta.persistence.MappedSuperclass;
import jakarta.persistence.OneToOne;
import lombok.Getter;
import lombok.Setter;

import java.sql.Time;
import java.time.LocalDate;

@Getter
@Setter
@MappedSuperclass
public class AbstractEvent {

    @Column(name = "event_date", nullable = false, columnDefinition = "DATE", updatable = false)
    private LocalDate date;
    @Column(name = "event_title", nullable = false, length = 50)
    private String title;
    @Column(name = "event_description", nullable = false, length = 200)
    private String description;
    @OneToOne
    private ScheduleDataModel schedule;
}
