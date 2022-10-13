package com.test.tennis.dto;

import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Getter @Setter
public class BoardSaveForm {

    private Long id;

    @NotNull @Size(min = 1, max = 30, message = "제목은 1~30자 이내여야 합니다.")
    private String title;

    @NotNull @Size(min = 1, max = 144, message = "내용은 1~30자 이내여야 합니다.")
    private String content;
}
