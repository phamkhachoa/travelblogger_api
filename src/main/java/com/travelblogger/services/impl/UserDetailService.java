package com.travelblogger.services.impl;

import com.travelblogger.entities.AccountEntity;
import com.travelblogger.repositories.AccountRepository;
import com.travelblogger.security.CustomUserDetails;
import lombok.SneakyThrows;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;
import java.util.Optional;

@Service
public class UserDetailService implements UserDetailsService {

    private final AccountRepository accountRepository;

    @Autowired
    public UserDetailService(AccountRepository accountRepository) {
        this.accountRepository = accountRepository;
    }

    @SneakyThrows
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Optional<AccountEntity> opt = accountRepository.findByUsername(username);
        if (!opt.isPresent()) {
            throw new Exception("user not found");
        }
        return new CustomUserDetails(opt.get());
//        List<GrantedAuthority> authorities = Collections.singletonList(new SimpleGrantedAuthority("USER"));
//        return accountRepository.findByUsername(username)
//                .map(u -> new User(u.getUsername(), u.getPassword(), authorities))
//                .orElseThrow(() -> new Exception("user not found"));
    }

    public UserDetails loadUserById(Long userId) throws Exception {

        Optional<AccountEntity> opt = accountRepository.findById(userId);
        if (!opt.isPresent()) {
            throw new Exception("not found");
        }
        return new CustomUserDetails(opt.get());
    }
}
