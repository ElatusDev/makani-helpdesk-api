package com.makani.calendar.interfaceadapters;

import org.springframework.data.jpa.repository.JpaRepository;

public interface EventRepository extends JpaRepository <EventDataModel, Integer >{
}
