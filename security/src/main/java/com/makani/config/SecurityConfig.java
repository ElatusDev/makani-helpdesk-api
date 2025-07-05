package com.makani.config;

import com.makani.internal.interfaceadapters.jwt.JwtRequestFilter;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;

import java.util.Arrays;
import java.util.List;
import java.util.Set;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

    @Bean
    public SecurityFilterChain securityFilterChain(Set<ModuleSecurityConfigurator> moduleSecurityConfigurators, HttpSecurity http, JwtRequestFilter jwtRequestFilter) throws Exception {
        http
                .csrf(AbstractHttpConfigurer::disable) // Disable CSRF for stateless API
                .cors(cors -> cors.configurationSource(corsConfigurationSourceForLogin()))
                .authorizeHttpRequests(auth -> {
                    auth
                            .requestMatchers("/security/login/internal").permitAll();
                    try {
                        for (ModuleSecurityConfigurator configurator : moduleSecurityConfigurators) {
                            configurator.configure(auth);
                        }
                    } catch (Exception e) {
                        throw new IllegalStateException("Failed to apply module security configurations", e);
                    }
                })
                .sessionManagement(session -> session.sessionCreationPolicy(SessionCreationPolicy.STATELESS))
                .formLogin(AbstractHttpConfigurer::disable)
                .httpBasic(AbstractHttpConfigurer::disable)
                .addFilterBefore(jwtRequestFilter, UsernamePasswordAuthenticationFilter.class);

        return http.build();
    }

    @Bean
    @Profile({"dev", "local"})
    public CorsConfigurationSource corsConfigurationSourceForLogin() {
        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();

        CorsConfiguration defaultCorsConfig = new CorsConfiguration();
        defaultCorsConfig.setAllowedOriginPatterns(List.of("http://localhost:*", "https://localhost:*"));
        defaultCorsConfig.setAllowedMethods(Arrays.asList("GET", "POST", "PUT", "DELETE", "OPTIONS"));
        defaultCorsConfig.setAllowedHeaders(List.of("*"));
        defaultCorsConfig.setAllowCredentials(false);

        CorsConfiguration loginCorsConfig = new CorsConfiguration();
        loginCorsConfig.setAllowedOriginPatterns(List.of("http://localhost:*", "https://localhost:*"));
        loginCorsConfig.setAllowedMethods(List.of("POST"));
        loginCorsConfig.setAllowedHeaders(List.of("Content-Type"));
        loginCorsConfig.setAllowCredentials(false);

        source.registerCorsConfiguration("/**", defaultCorsConfig);
        source.registerCorsConfiguration("/security/login/internal", loginCorsConfig);
        return source;
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
}