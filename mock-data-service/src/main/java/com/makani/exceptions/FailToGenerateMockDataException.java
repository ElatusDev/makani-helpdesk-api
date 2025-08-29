/*
 * Copyright (c) 2025 ElatusDev
 * All rights reserved.
 *
 * This code is proprietary and confidential.
 * Unauthorized copying, distribution, or modification is strictly prohibited.
 */
package com.makani.exceptions;

public class FailToGenerateMockDataException extends RuntimeException {
    public FailToGenerateMockDataException(Exception e) {
        super(e);
    }
}
