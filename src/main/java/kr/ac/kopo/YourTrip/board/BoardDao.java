package kr.ac.kopo.YourTrip.board;

import kr.ac.kopo.YourTrip.VO.Board;
import kr.ac.kopo.YourTrip.VO.Search;

import java.util.List;

public interface BoardDao {
    List<Board> list(Search search);

    void add(Board board);

    Board item(int boardNum);

    void delete(int boardNum);

    void update(Board board);

    int recommendCheck(int boardNum);

    void recommend(int boardNum);

    void recommendInsert(int boardNum);
}
