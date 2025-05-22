package com.makani.internal.interfaceadapters.jwt;

import io.jsonwebtoken.*;
import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.security.KeyPair;
import java.util.Date;
import java.util.Map;

@Component
public class JwtTokenProvider  {

    @Value("${jwt.keystore.path}")
    private String keystorePath;

    @Value("${jwt.keystore.password}")
    private String keystorePassword;

    @Value("${jwt.keystore.alias}")
    private String keyAlias;

    @Value("${jwt.token.validity-ms:3600000}")
    private long validityInMs;

    private KeyPair keyPair;
    private JwtParser jwtParser;

    @PostConstruct
    public void init() {
        try {
            this.keyPair = KeyLoader.loadKeyPair(keystorePath, keystorePassword, keyAlias);

            this.jwtParser = Jwts.parser()
                    .verifyWith(keyPair.getPublic())
                    .decryptWith(keyPair.getPrivate())
                    .build();

        } catch (Exception e) {
            throw new SecurityException("Failed to initialize JWT key pair", e);
        }
    }

    public String createToken(String username, Map<String, Object> claims) {
        Date now = new Date();
        Date expiry = new Date(now.getTime() + validityInMs);

        return Jwts.builder()
                .subject(username)
                .claims(claims)
                .issuedAt(now)
                .expiration(expiry)
                .signWith(keyPair.getPrivate())
                .compact();
    }

    public boolean validateToken(String token) {
        try {
            jwtParser.parseSignedClaims(token);
            return true;
        } catch (JwtException e) {
            return false;
        }
    }

    public Claims getClaims(String token) {
        return jwtParser.parseSignedClaims(token).getPayload();
    }

    public String getUsername(String token) {
        Claims claims =  getClaims(token);
        return String.valueOf(claims.get("sub"));
    }

}