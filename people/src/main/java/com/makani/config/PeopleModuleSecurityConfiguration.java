package com.makani.config;

import com.makani.utilities.ModuleSecurityConfigurator;
import com.makani.utilities.Role;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configurers.AuthorizeHttpRequestsConfigurer;

@Configuration
public class PeopleModuleSecurityConfiguration implements ModuleSecurityConfigurator {

    private final String employeePath;
    private final String employeePathAnyPathVars;
    private final String collaboratorPath;
    private final String collaboratorPathAnyPathVars;

    public PeopleModuleSecurityConfiguration(@Value("${api.people.employee.base-url}") String employeeBaseUri,
                                             @Value("${api.people.collaborator.base-url}") String collaboratorBaseUri) {
        String anyPathVar = "/**";
        employeePath = employeeBaseUri;
        employeePathAnyPathVars = employeePath + anyPathVar;
        collaboratorPath = collaboratorBaseUri;
        collaboratorPathAnyPathVars = collaboratorPath + anyPathVar;
    }

    @Override
    public void configure(AuthorizeHttpRequestsConfigurer<HttpSecurity>.AuthorizationManagerRequestMatcherRegistry auth) throws Exception {
            employeePaths(auth);
            collaboratorPaths(auth);
    }

    public void employeePaths(AuthorizeHttpRequestsConfigurer<HttpSecurity>.AuthorizationManagerRequestMatcherRegistry auth) {
        auth
                .requestMatchers(HttpMethod.DELETE, employeePathAnyPathVars)
                .hasAnyRole(Role.ADMIN.name(), Role.PRINCIPAL.name())
                .requestMatchers(HttpMethod.GET, employeePathAnyPathVars)
                .hasAnyRole(Role.ADMIN.name(), Role.PRINCIPAL.name(), Role.CSR.name())
                .requestMatchers(HttpMethod.POST, employeePathAnyPathVars)
                .hasAnyRole(Role.ADMIN.name(), Role.PRINCIPAL.name(), Role.CSR.name())
                .requestMatchers(HttpMethod.PUT, employeePathAnyPathVars)
                .denyAll()
                .requestMatchers(HttpMethod.PATCH, employeePathAnyPathVars)
                .hasAnyRole(Role.ADMIN.name(), Role.PRINCIPAL.name(), Role.CSR.name())
                .requestMatchers(HttpMethod.GET, employeePath)
                .hasAnyRole(Role.ADMIN.name(), Role.PRINCIPAL.name(), Role.CSR.name());
    }

    public void collaboratorPaths(AuthorizeHttpRequestsConfigurer<HttpSecurity>.AuthorizationManagerRequestMatcherRegistry auth) {
        auth
                .requestMatchers(HttpMethod.DELETE, collaboratorPathAnyPathVars)
                .hasAnyRole(Role.ADMIN.name(), Role.PRINCIPAL.name())
                .requestMatchers(HttpMethod.GET, collaboratorPathAnyPathVars)
                .hasAnyRole(Role.ADMIN.name(), Role.PRINCIPAL.name(), Role.CSR.name())
                .requestMatchers(HttpMethod.POST, collaboratorPathAnyPathVars)
                .hasAnyRole(Role.ADMIN.name(), Role.PRINCIPAL.name(), Role.CSR.name())
                .requestMatchers(HttpMethod.PUT, collaboratorPathAnyPathVars)
                .denyAll()
                .requestMatchers(HttpMethod.PATCH, collaboratorPathAnyPathVars)
                .hasAnyRole(Role.ADMIN.name(), Role.PRINCIPAL.name(), Role.CSR.name())
                .requestMatchers(HttpMethod.GET, collaboratorPath)
                .hasAnyRole(Role.ADMIN.name(), Role.PRINCIPAL.name(), Role.CSR.name());
    }

}