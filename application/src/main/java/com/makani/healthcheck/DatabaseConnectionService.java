package com.makani.healthcheck;

import org.springframework.retry.annotation.Backoff;
import org.springframework.retry.annotation.Retryable;
import org.springframework.stereotype.Service;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;

import org.springframework.retry.annotation.EnableRetry;

@Service
@EnableRetry // Important!
public class DatabaseConnectionService {

    private final DataSource dataSource;

    public DatabaseConnectionService(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    @Retryable(maxAttempts = 5, backoff = @Backoff(delay = 5000))
    public Connection getConnection() throws SQLException {
        System.out.println("Attempting to get database connection..."); // Log this properly!
        return dataSource.getConnection();
    }

    public void performDatabaseOperation() {
        try (Connection connection = getConnection()) {
            // Use the connection for your database operations
        } catch (SQLException e) {
            System.err.println("Failed to get database connection after retries: " + e.getMessage()); // Log this properly!
            // Handle the failure appropriately (e.g., throw a custom exception, log and exit)
            throw new DatabaseConnectionException("Failed to connect to the database", e); // Example
        }
    }
}

// Example Custom Exception (optional)
class DatabaseConnectionException extends RuntimeException {
    public DatabaseConnectionException(String message, Throwable cause) {
        super(message, cause);
    }
}