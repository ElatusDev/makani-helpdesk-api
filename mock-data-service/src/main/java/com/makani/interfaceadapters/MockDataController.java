/*
 * Copyright (c) 2025 ElatusDev
 * All rights reserved.
 *
 * This code is proprietary and confidential.
 * Unauthorized copying, distribution, or modification is strictly prohibited.
 */
package com.makani.interfaceadapters;

import com.makani.usecases.GeneratePeopleMockDataUseCase;
import openapi.makani.domain.mock_data_service.api.MockDataApi;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/v1")
public class MockDataController implements MockDataApi {
    private final GeneratePeopleMockDataUseCase generatePeopleMockDataUseCase;

    public MockDataController(GeneratePeopleMockDataUseCase generatePeopleMockDataUseCase) {
        this.generatePeopleMockDataUseCase = generatePeopleMockDataUseCase;
    }

    @Override
    public ResponseEntity<String> generateAllMockData() {
        generatePeopleMockDataUseCase.create();
        return ResponseEntity.status(HttpStatus.CREATED).body("mock data ready!");
    }



}
