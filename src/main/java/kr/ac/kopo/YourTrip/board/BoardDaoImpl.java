package kr.ac.kopo.YourTrip.board;

import kr.ac.kopo.YourTrip.Vo.*;
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
    public void hit(int boardNum) {
        sql.update("board.hit", boardNum);
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
        return sql.selectList("board.getHash",boardNum);
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


}
