package com.makani.program.interfaceadapters;

import com.makani.coordination.program.ScheduleDataModel;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ScheduleRepository extends JpaRepository<ScheduleDataModel, Integer> {
}
