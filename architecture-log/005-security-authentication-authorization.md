# Architecture Log: Security - Authentication and Authorization

**Date:** 2025-05-02
**Author:** David Martinez
**Status:** Proposed

### 1. Introduction

This log outlines the proposed security architecture for authentication and authorization within the Makani Help Desk API. 
The system needs to support distinct authentication mechanisms for employees and general users, as well as role-based access control for employees.

### 2. Requirements

* **Employee Authentication:** Securely authenticate employees using their internal credentials (username/token and password/token).
* **General User Authentication:** Allow users to authenticate using popular social login providers: Google, Facebook, and Instagram.
* **Role-Based Access Control (RBAC):** Implement RBAC to control employee access to specific API endpoints and functionalities based on their assigned roles (e.g., ADMIN, USER).
* **Secure Credential Storage:** Ensure that employee passwords are stored securely using a strong hashing algorithm.
* **Token-Based Authorization (Recommended):** For both employee and general user authentication, leverage token-based authorization (e.g., JWT) to manage access after successful authentication.
* **Stateless Backend:** Aim for a stateless backend architecture where each request is self-contained and authenticated via a token.

### 3. Proposed Architecture

We will utilize Spring Security as the primary framework for implementing authentication and authorization.

#### 3.1. Employee Authentication

1.  **Mechanism:** Username/Password-based authentication.
2.  **Implementation:**
    * **`UserDetailsService`:** A custom `UserDetailsService` (`EmployeeUserDetailsService`) will be implemented to fetch employee details (username, hashed password, roles) from the `internal_auth` and `employee` tables in the database.
    * **`PasswordEncoder`:** A `BCryptPasswordEncoder` bean will be used for securely hashing and verifying employee passwords.
    * **Authentication Provider:** A `DaoAuthenticationProvider` will be configured, using the `EmployeeUserDetailsService` and `PasswordEncoder` for authentication.
    * **Authentication Endpoint:** A dedicated `/login/employee` endpoint (POST) will handle employee login requests. Upon successful authentication, a JWT will be generated and returned to the client.

#### 3.2. General User Authentication

1.  **Mechanism:** OAuth 2.0 based social login with Google, Facebook, and Instagram.
2.  **Implementation:**
    * **Spring Security OAuth 2.0 Client:** We will leverage Spring Security's OAuth 2.0 Client support to handle the social login flows.
    * **Registration:** Client registrations for each provider (Google, Facebook, Instagram) will be configured with their respective client IDs, client secrets, authorization URIs, token URIs, and redirect URIs. These configurations will likely be stored in `application.yml` or `application.properties`.
    * **Authentication Endpoints:** Dedicated endpoints (e.g., `/oauth2/authorization/google`, `/oauth2/authorization/facebook`, `/oauth2/authorization/instagram`) will be used to initiate the social login flows. A callback endpoint (e.g., `/oauth2/callback/{registrationId}`) will handle the redirection after successful authentication by the provider.
    * **Custom OAuth2UserService:** A custom `OAuth2UserService` (`SocialUserService`) will be implemented to fetch user information from the social provider upon successful authentication and potentially create or update a local user account in the `customer_auth`, `adult_student`, `tutor`, or `minor_student` tables.
    * **JWT Generation:** Upon successful social login and user account association, a JWT will be generated and returned to the client.

#### 3.3. Authorization (Role-Based Access Control)

1.  **Mechanism:** Role-based access control using Spring Security's `@PreAuthorize` and `SecurityFilterChain`.
2.  **Implementation:**
    * **Roles:** Employee roles will be defined in the `role` table and associated with employee accounts through the `user_roles` (assuming a `User` entity mapping to `internal_auth`) or a similar mechanism.
    * **`SecurityFilterChain`:** The `SecurityFilterChain` will define URL-based authorization rules:
        * `/public/**`: `permitAll()` (for publicly accessible endpoints).
        * `/employees/**`: `authenticated()` (requires any authenticated employee).
        * `/admin/**`: `hasRole('ADMIN')` (requires employees with the 'ADMIN' role).
        * Specific endpoints can be further restricted using `.hasRole('ROLE_NAME')`.
    * **`@PreAuthorize`:** For finer-grained control at the method level, `@PreAuthorize` annotations can be used in controllers to restrict access based on the authenticated user's roles or custom expressions.

#### 3.4. JWT Handling

1.  **Generation:** Upon successful authentication (both employee and general user), a JWT will be generated containing user information (e.g., user ID, username/email, roles) and an expiration time.
2.  **Issuance:** The JWT will be returned to the client in the authentication response (e.g., as a JSON field or an HTTP header).
3.  **Request Authentication:** Clients will include the JWT in subsequent requests (typically in the `Authorization` header as a Bearer token).
4.  **Validation:** A `JwtAuthenticationFilter` will intercept incoming requests, validate the JWT signature, expiration, and claims, and if valid, populate the Spring Security context with the authenticated user's details and authorities (roles).

### 4. Technology Stack

* Java
* Spring Boot
* Spring Security
* Spring Security OAuth 2.0 Client
* JWT (e.g., using `java-jwt` library or Spring Security's built-in JWT support)
* MariaDB

### 5. Considerations

* **Token Management:** Implement proper JWT generation, signing (using a secure secret key), and validation. Consider token expiration and refresh mechanisms.
* **User Linking:** For social login, handle the process of linking social accounts to existing local user accounts.
* **Error Handling:** Implement consistent error handling for authentication and authorization failures (e.g., returning appropriate HTTP status codes and error messages).
* **Security Best Practices:** Follow security best practices for password storage, preventing common web vulnerabilities (CSRF, XSS), and protecting API endpoints.
* **Scalability:** Ensure the chosen authentication and authorization mechanisms can scale with the application's user base.

### 6. Next Steps

* Implement the `EmployeeUserDetailsService` and password encoding.
* Configure the OAuth 2.0 client registrations.
* Implement the `SocialUserService` for handling social login user details.
* Set up JWT generation and validation.
* Define roles in the database and implement role mapping in the `UserDetailsService`.
* Configure the `SecurityFilterChain` with the initial authorization rules.
* Implement `@PreAuthorize` annotations for finer-grained access control.
* Implement the authentication endpoints.

This architecture log provides a high-level plan for implementing security in your application. The next steps will involve diving into the code implementation details for each component.