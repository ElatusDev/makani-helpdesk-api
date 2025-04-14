/*
 * Copyright (c) 2025 ElatusDev
 * All rights reserved.
 *
 * This code is proprietary and confidential.
 * Unauthorized copying, distribution, or modification is strictly prohibited.
 */
package com.makani.coordination.event;

import com.makani.coordination.program.ScheduleDataModel;
import jakarta.persistence.Column;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.MappedSuperclass;
import jakarta.persistence.OneToOne;
import lombok.Getter;
import lombok.Setter;

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
    @JoinColumn(name = "schedule_id")
    private ScheduleDataModel schedule;
}
