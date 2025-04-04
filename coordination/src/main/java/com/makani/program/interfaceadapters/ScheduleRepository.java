package com.makani.program.interfaceadapters;

import org.springframework.data.jpa.repository.JpaRepository;

public interface ScheduleRepository extends JpaRepository<ScheduleDataModel, Integer> {
}
