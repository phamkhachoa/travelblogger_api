package com.travelblogger.entities;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name = "tbl_account")
@Data
@Getter
@Setter
public class AccountEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "username")
    private String username;
    @Column(name = "email")
    private String email;
    @Column(name = "phone_number")
    private String phoneNumber;
    @Column(name = "password")
    private String password;
    @Column(name = "salt")
    private Integer salt;
    @Column(name = "role")
    private Integer role;
    @Column(name = "aliases")
    private String aliases;
    @Column(name = "active_flag")
    private Integer activeFlag;
}
