package com.makani.program.interfaceadapters;

import com.makani.coordination.program.ScheduleDataModel;

import java.util.List;
import java.util.Optional;

public interface SchedulePersistenceOutputPort {
    Optional<ScheduleDataModel> findById(Integer id);
    List<ScheduleDataModel> findAllById(List<Integer> ids);
    void update(List<ScheduleDataModel> schedules);
}