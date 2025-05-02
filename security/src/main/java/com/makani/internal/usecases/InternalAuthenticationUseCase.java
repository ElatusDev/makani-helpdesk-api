package com.makani.internal.usecases;

import com.makani.security.user.InternalAuthDataModel;
import com.makani.internal.interfaceadapters.InternalAuthRepository;
import com.makani.internal.interfaceadapters.jwt.JwtTokenProvider;
import openapi.makani.domain.security.dto.AuthTokenResponseDTO;
import openapi.makani.domain.security.dto.LoginRequestDTO;
import org.springframework.context.MessageSource;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

@Service
public class InternalAuthenticationUseCase {
    private final InternalAuthRepository repository;
    private final PasswordEncoder passwordEncoder;
    private final JwtTokenProvider jwtTokenProvider;
    private final MessageSource messageSource;

    public InternalAuthenticationUseCase(InternalAuthRepository repository,
                                         PasswordEncoder passwordEncoder,
                                         JwtTokenProvider jwtTokenProvider,
                                         MessageSource messageSource) {
        this.repository = repository;
        this.passwordEncoder = passwordEncoder;
        this.jwtTokenProvider = jwtTokenProvider;
        this.messageSource = messageSource;
    }

    public AuthTokenResponseDTO loginEmployee(LoginRequestDTO dto) {
        InternalAuthDataModel auth = repository.findByUsername(dto.getUsername())
                .filter(user -> passwordEncoder.matches(dto.getPassword(), user.getPasswordToken()))
                .orElseThrow(() -> new IllegalArgumentException(
                        messageSource.getMessage("invalid.login", null, Locale.getDefault())));

        Map<String,Object> claims = new HashMap<>();
        claims.put("Has role", auth.getRole());
        return new AuthTokenResponseDTO(jwtTokenProvider.createToken(auth.getUsernameToken(), claims));
    }
}
