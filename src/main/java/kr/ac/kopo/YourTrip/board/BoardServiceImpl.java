package kr.ac.kopo.YourTrip.board;

import kr.ac.kopo.YourTrip.VO.Board;
import kr.ac.kopo.YourTrip.VO.Search;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BoardServiceImpl implements BoardService {
    final BoardDao dao;

    public BoardServiceImpl(BoardDao dao) {
        this.dao = dao;
    }

    @Override
    public List<Board> list(Search search) {
        return dao.list(search);
    }

    @Override
    public void add(Board board) {
        dao.add(board);
    }

    @Override
    public Board item(int boardNum) {
        return dao.item(boardNum);
    }

    @Override
    public void delete(int boardNum) {
        dao.delete(boardNum);
    }

    @Override
    public void update(Board board) {
        dao.update(board);
    }

    @Override
    public int recommendCheck(int boardNum) {
        return dao.recommendCheck(boardNum);
    }

    @Override
    public void recommend(int boardNum) {
        dao.recommend(boardNum);
    }

    @Override
    public void recommendInsert(int boardNum) {
        dao.recommendInsert(boardNum);
    }
}
