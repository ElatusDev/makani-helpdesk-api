package com.makani;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Profile;
import org.springframework.context.annotation.PropertySource;

@Profile("mock-data")
@PropertySource("mock-data-loader.properties")
@SpringBootApplication
public class MockDataLoaderApplication {

    public static void main(String[] args) {
        SpringApplication.run(MockDataLoaderApplication.class, args);
    }
}