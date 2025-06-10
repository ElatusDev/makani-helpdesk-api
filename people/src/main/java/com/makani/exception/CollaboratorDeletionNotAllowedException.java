/*
 * Copyright (c) 2025 ElatusDev
 * All rights reserved.
 *
 * This code is proprietary and confidential.
 * Unauthorized copying, distribution, or modification is strictly prohibited.
 */
package com.makani.exception;

public class CollaboratorDeletionNotAllowedException extends RuntimeException {
    public CollaboratorDeletionNotAllowedException(Exception ex) {
        super(ex);
    }
}
