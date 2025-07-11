/*
 * Copyright (c) 2025 ElatusDev
 * All rights reserved.
 *
 * This code is proprietary and confidential.
 * Unauthorized copying, distribution, or modification is strictly prohibited.
 */
package com.makani.exception;

public class CollaboratorNotFoundException extends RuntimeException {
    public CollaboratorNotFoundException(String msg) {
        super(msg);
    }
}
