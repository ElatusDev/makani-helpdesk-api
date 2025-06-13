package com.makani.internal.usecases;

import com.makani.exceptions.InvalidLoginException;
import com.makani.security.user.InternalAuthDataModel;
import com.makani.internal.interfaceadapters.InternalAuthRepository;
import com.makani.internal.interfaceadapters.jwt.JwtTokenProvider;
import openapi.makani.domain.security.dto.AuthTokenResponseDTO;
import openapi.makani.domain.security.dto.LoginRequestDTO;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class InternalAuthenticationUseCase {
    private final InternalAuthRepository repository;
    private final JwtTokenProvider jwtTokenProvider;

    public InternalAuthenticationUseCase(InternalAuthRepository repository,
                                         JwtTokenProvider jwtTokenProvider) {
        this.repository = repository;
        this.jwtTokenProvider = jwtTokenProvider;
    }

    public AuthTokenResponseDTO login(LoginRequestDTO dto) {
        InternalAuthDataModel auth = repository.findByUsernameToken(dto.getUsername())
                .filter(user -> dto.getPassword().equals(user.getPasswordToken()))
                .orElseThrow(InvalidLoginException::new);

        Map<String,Object> claims = new HashMap<>();
        claims.put("Has role", auth.getRole());
        return new AuthTokenResponseDTO(jwtTokenProvider.createToken(auth.getUsernameToken(), claims));
    }

}
