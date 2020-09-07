package com.travelblogger.services;

import com.travelblogger.entities.AccountEntity;

import java.util.Optional;

public interface IAccountService {
    Optional<AccountEntity> findByUsername(String username);
}
