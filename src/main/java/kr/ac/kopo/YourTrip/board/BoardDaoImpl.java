package kr.ac.kopo.YourTrip.board;

import kr.ac.kopo.YourTrip.VO.Board;
import kr.ac.kopo.YourTrip.VO.Search;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class BoardDaoImpl implements BoardDao {
    @Autowired
    SqlSession sql;

    @Override
    public List<Board> list(Search search) {
        return sql.selectList("board.list", search);
    }

    @Override
    public void add(Board board) {
        sql.insert("board.add", board);
    }

    @Override
    public Board item(int boardNum) {
        return sql.selectOne("board.item", boardNum);
    }

    @Override
    public void delete(int boardNum) {
        sql.delete("board.delete", boardNum);
    }

    @Override
    public void update(Board board) {
        sql.update("board.update", board);
    }

    @Override
    public int recommendCheck(int boardNum) {
        return sql.selectOne("board.recommendCheck", boardNum);
    }

    @Override
    public void recommend(int boardNum) {
        sql.update("board.recommend", boardNum);
    }

    @Override
    public void recommendInsert(int boardNum) {
        sql.insert("board.recommendInsert", boardNum);
    }

    @Override
    public void hit(int boardNum) {
        sql.update("board.hit", boardNum);
    }


}
