# Decision Proposal: Backend Architecture - Modular Monolith with Clean Architecture

**Date:** 2025-04-19

**Proposed By:** David Martinez Enciso

**Location Context:** Guadalajara, Jalisco, Mexico

**Context:**

This proposal outlines the architectural decisions for the Arts Academy
backend application, focusing on maintainability, testability, and a
balance between simplicity and scalability. We propose a modular
monolith architecture using Maven modules while strictly adhering to
Clean Architecture principles. This application will manage data for
arts academy daily operations, class assistance, announcements
(email and WhatsApp), basic accounting for the internal convenience
store, payment records and due date notifications, a training gaming
course for service representatives, and basic payroll schema
management. The expected concurrent user load is minimal, ranging
from 1 to 5 users at a time. The API will be designed using a
RESTful architecture, documented with OpenAPI (Swagger), and
implemented using Spring Boot modules. Deployment will initially be
via Docker containers orchestrated by AWS Lightsail Container
Services, chosen for its cost-effectiveness for the anticipated small
user base.

**Proposed Decision:**

Adopt a modular monolith architecture for the backend application,
structured using Maven modules to represent the different layers and
features, and strictly following Clean Architecture principles to
ensure separation of concerns and testability. We will utilize Java
21, Spring Boot JPA for data persistence, Spring Security for
authentication and authorization, Spring WebFlux for reactive
non-blocking operations, Spring Mail for email communication, Bean
Validation for data validation, Spring Boot Actuator for monitoring,
JUnit 5 and Mockito with H2 for unit testing, Spring Boot Test for
integration testing, and BDD with Cucumber for behavior-driven
development within this modular monolith.

**Rationale:**

1.  **Modular Monolith Architecture:**
    * **Logical Separation:** Divides the application into distinct,
      loosely coupled modules based on business domains (e.g.,
      student management, course management, payments,
      notifications, payroll) or technical layers. This improves
      organization and maintainability within a single deployable
      unit.
    * **Shared Codebase:** All modules reside within the same
      codebase, simplifying development and deployment compared to a
      distributed system.
    * **Simplified Deployment:** Deployment involves a single
      application instance, reducing the complexity of managing
      multiple services, which is suitable for the initial low user
      concurrency.
    * **Improved Maintainability (vs. Traditional Monolith):** Clear
      module boundaries and enforced separation of concerns through
      Clean Architecture make the codebase easier to understand, test,
      and modify by different developers.
    * **Gradual Scalability:** While a monolith, individual modules can
      be optimized and scaled as needed within the single instance.
      Future transition to microservices can be made incrementally
      by extracting modules if the application's scale significantly
      increases.

2.  **Maven Modules:**
    * **Project Organization:** Maven's multi-module support allows us
      to structure the project logically, aligning with both the
      business domains and the layers of Clean Architecture (e.g.,
      core domain, application services, interface adapters,
      infrastructure).
    * **Dependency Management:** Maven provides robust dependency
      management, ensuring consistent and manageable dependencies
      across the project modules.
    * **Build Management:** Standardized build process for all modules.
    * **Improved Collaboration:** Clear module boundaries can facilitate
      parallel development among team members in Guadalajara.

3.  **Clean Architecture:**
    * **Separation of Concerns:** Enforces a clear separation between
      business logic (Entities, Use Cases), application logic
      (Interface Adapters), and infrastructure concerns (Frameworks &
      Drivers). This leads to a highly maintainable, testable, and
      independent codebase.
    * **Testability:** Business logic is independent of frameworks,
      making it easy to unit test in isolation.
    * **Flexibility:** Allows for easy changes to frameworks and
      infrastructure (e.g., database, UI) without impacting the core
      business logic.
    * **Maintainability:** Clear layers and dependencies make the
      codebase easier to understand and modify by different