package com.test.tennis.domain;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

import static javax.persistence.FetchType.*;

@Entity // create query
@Getter @Setter
@NoArgsConstructor
public class Board {
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY) // autoincrement
    @Column(name = "board_id")
    private Long id;

    @NotNull @Column(length = 31)
    private String title;

    @NotNull @Column(length = 150)
    private String content;

    @NotNull @Column(length = 10)
    private String author;

    @Column(columnDefinition = "integer default 0") // 조회수 기본값 = 0
    private Integer views;

    @CreatedDate @Column(length = 40)
    private String createdDate;

    @LastModifiedDate
    @Column(length = 40)
    private String modifiedDate;

    @ManyToOne(fetch = LAZY)
    @JoinColumn(name = "member_id")
    private Member member;


    public void updateView(Board board) {
        board.setViews(board.getViews() + 1);
    }

}
