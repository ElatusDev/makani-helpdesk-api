/*
 * Copyright (c) 2025 ElatusDev
 * All rights reserved.
 *
 * This code is proprietary and confidential.
 * Unauthorized copying, distribution, or modification is strictly prohibited.
 */
package com.makani.people.employee.usecases;

public class InvalidCreateRequestException extends Exception{
    public InvalidCreateRequestException(String msg, Exception ex) {
        super(msg, ex);
    }
}
