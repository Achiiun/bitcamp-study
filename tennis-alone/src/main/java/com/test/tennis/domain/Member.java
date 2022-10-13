package com.test.tennis.domain;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.io.Serializable;

@Entity
@Getter @Setter
@NoArgsConstructor
public class Member implements Serializable {

    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "member_id")
    private Long id;

    @NotNull @Column(unique = true, length = 16)
    private String loginId;

    @NotNull @Column(unique = true, length = 25)
    private String password;

    @NotNull @Column(length = 11)
    private String nickname;

    @NotNull @Column(unique = true, length = 50)
    private String email;



}
