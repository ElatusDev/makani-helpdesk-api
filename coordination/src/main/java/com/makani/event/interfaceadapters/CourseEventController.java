package com.makani.event.interfaceadapters;

import openapi.makani.domain.coordination.api.CourseEventsApiController;
import org.springframework.web.context.request.NativeWebRequest;

public class CourseEventController extends CourseEventsApiController {
    public CourseEventController(NativeWebRequest request) {
        super(request);
    }
}
