package com.test.tennis.service;

import com.test.tennis.Repository.BoardRepository;
import com.test.tennis.domain.Board;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 비즈니스 로직을 담당하는 Service 클래스
 * Repository에 위임하는 경우가 많다.
 */
@Service
@Transactional(readOnly = true)
@RequiredArgsConstructor // final, @NotNull 이 붙은 필드의 생성자 만들어줌.
public class BoardService {

    private final BoardRepository boardRepository;

    //==Board 단건 조회==//
    public Board findOne(Long boardId) {
        return boardRepository.findOne(boardId);
    }

    //==Board 단건 삭제==//
    @Transactional
    public void deleteById(Long boardId) {
        boardRepository.deleteById(boardId);
    }

    //==Board 조회수 증가==//
    @Transactional
    public void increaseView(Long boardId) {
        boardRepository.updateView(boardId);
    }


}
