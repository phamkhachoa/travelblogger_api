package com.travelblogger.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AccountDto {
    private Long id;
    private String username;
    private String email;
    private String phoneNumber;
    private String password;
    private Integer salt;
    private Integer role;
    private Integer aliases;
    private Integer activeFlag;
}
