package kr.ac.kopo.YourTrip.board;

import kr.ac.kopo.YourTrip.Vo.*;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
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
    public int total() {
        return sql.selectOne("board.total");

    }

    @Override
    public Board hotTopic() {

        return sql.selectOne("board.HotTopic");
    }

    @Override
    public List<Reply> getReply(int boardNum) {
        return sql.selectList("reply.list", boardNum);
    }

    @Override
    public void addReply(Reply reply) {
        sql.insert("reply.insert", reply);
    }

    @Override
    public Reply getReplyItem(int replyNum) {
        return sql.selectOne("reply.item", replyNum);
    }

    @Override
    public void deleteReply(int replyNum) {
        sql.delete("reply.deleteReply", replyNum);
    }

    @Override
    public List<Hash> getHash(int boardNum) {
        return sql.selectList("board.getHash", boardNum);
    }

    @Override
    public void replyUpdate(Reply reply) {
        sql.update("reply.replyUpdate", reply);
    }

    @Override
    public List<Attach> hotTopicPicture(int boardNum) {
        return sql.selectList("hotTopicPicture", boardNum);
    }

    @Override
    public List<Attach> getAttach(int boardNum) {
        return sql.selectList("board.getAttach", boardNum);
    }


    //추천
    @Override
    public int recommendCheck(Board board) {
        return sql.selectOne("board.recommendCheck", board);
    }

    @Override
    public void insertRecommendTable(Board board) {
        sql.insert("insertRecommendTable", board);
    }

    @Override
    public void updateBoardRecommend(Board board) {
        sql.update("updateBoardRecommend", board);
    }

    @Override
    public List<Board> hashSearchList(String hashName) {
        return sql.selectList("board.hashSearchList", hashName);
    }

    @Override
    public int hashSearchListTotal(String hashName) {
        return sql.selectOne("board.hashSearchListTotal", hashName);
    }

    @Override
    public List<Hash> hashOption() {
        return sql.selectList("board.hashOption");
    }

    @Override
    public List<Board> search(Search search) {
        return sql.selectList("board.search", search);
    }

    @Override
    public int keyworldTotalList(String keyword) {
        return sql.selectOne("board.keyworldTotalList", keyword);
    }

    @Override
    public void setBoardImage(Board board) {
        sql.update("board.setBoardImage", board);
    }


    // 추천 삭제 //
    @Override
    public void recommendTableDelete(Board board) {
        sql.delete("board.recommendTableDelete", board);
    }

    @Override
    public void recommendCancel(Board board) {
        sql.update("board.recommendCancel", board);
    }

    @Override
    public Board test(int boardNum, int memberNum) {
        HashMap<String, Object> map = new HashMap<>();
        map.put("boardNum", boardNum);
        map.put("memberNum", memberNum);

        return sql.selectOne("board.test", map);
    }


}
