package com.makani.internal.interfaceadapters;

import com.makani.security.user.InternalAuthDataModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface InternalAuthRepository extends JpaRepository<InternalAuthDataModel, Integer> {
    Optional<InternalAuthDataModel> findByUsernameToken(String usernameToken);
}
