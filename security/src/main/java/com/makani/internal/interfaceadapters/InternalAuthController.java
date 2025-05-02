package com.makani.internal.interfaceadapters;

import com.makani.internal.usecases.InternalAuthenticationUseCase;
import openapi.makani.domain.security.api.LoginApi;
import openapi.makani.domain.security.dto.AuthTokenResponseDTO;
import openapi.makani.domain.security.dto.LoginRequestDTO;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("security/")
public class InternalAuthController implements LoginApi {

    private final InternalAuthenticationUseCase internalAuthenticationUseCase;

    public InternalAuthController(InternalAuthenticationUseCase internalAuthenticationUseCase) {
        this.internalAuthenticationUseCase = internalAuthenticationUseCase;
    }

    @Override
    public ResponseEntity<AuthTokenResponseDTO> loginInternal(LoginRequestDTO loginRequestDTO) {
        return ResponseEntity.ok(internalAuthenticationUseCase.loginEmployee(loginRequestDTO));
    }
}

