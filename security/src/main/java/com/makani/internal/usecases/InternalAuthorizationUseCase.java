package com.makani.internal.usecases;

import com.makani.internal.interfaceadapters.InternalAuthRepository;
import com.makani.security.user.InternalAuthDataModel;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Component
public class InternalAuthorizationUseCase implements UserDetailsService {
    private final InternalAuthRepository repository;

    public InternalAuthorizationUseCase(InternalAuthRepository repository) {
        this.repository = repository;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Optional<InternalAuthDataModel> result =  repository.findByUsernameToken(username);
        if(result.isPresent()) {
            InternalAuthDataModel internalAuth = result.get();
            String role = internalAuth.getRole();
            List<GrantedAuthority> list = new ArrayList<>();
            list.add(new SimpleGrantedAuthority("ROLE_" + role));
            return new User(
                    internalAuth.getUsernameToken(),
                    "",
                    true,
                    true,
                    true,
                    true,
                    list
            );
        } else {
            throw new SecurityException("failed to find user for authorization");
        }
    }
}
