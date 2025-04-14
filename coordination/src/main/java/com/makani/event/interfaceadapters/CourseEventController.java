/*
 * Copyright (c) 2025 ElatusDev
 * All rights reserved.
 *
 * This code is proprietary and confidential.
 * Unauthorized copying, distribution, or modification is strictly prohibited.
 */
package com.makani.event.interfaceadapters;

import openapi.makani.domain.coordination.api.CourseEventsApiController;
import org.springframework.web.context.request.NativeWebRequest;

public class CourseEventController extends CourseEventsApiController {
    public CourseEventController(NativeWebRequest request) {
        super(request);
    }
}
