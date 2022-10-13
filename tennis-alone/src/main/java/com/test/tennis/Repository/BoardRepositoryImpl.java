package com.test.tennis.Repository;

import com.test.tennis.domain.Board;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Repository
@RequiredArgsConstructor
public class BoardRepositoryImpl implements BoardRepositoryInterface {

    @PersistenceContext
    private final EntityManager em;

//    @Autowired
//    public BoardRepositoryImpl(EntityManager em) {
//        this.em = em;
//    }

    @Override
    public Board findOne(Long boardId) {
        return em.find(Board.class, boardId);
    }

    @Override
    public void updateView(Long boardId) {
        Board board = findOne(boardId);
        board.updateView(board);
    }
}
