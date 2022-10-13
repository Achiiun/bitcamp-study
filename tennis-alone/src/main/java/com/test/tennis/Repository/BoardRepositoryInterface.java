package com.test.tennis.Repository;

import com.test.tennis.domain.Board;

public interface BoardRepositoryInterface {
    Board findOne(Long boardId);

    void updateView(Long boardId);
}
