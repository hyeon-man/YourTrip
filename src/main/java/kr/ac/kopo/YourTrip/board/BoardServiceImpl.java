package kr.ac.kopo.YourTrip.board;

import kr.ac.kopo.YourTrip.VO.Board;
import kr.ac.kopo.YourTrip.VO.Hash;
import kr.ac.kopo.YourTrip.VO.Reply;
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

    @Override
    public void hit(int boardNum) {
        dao.hit(boardNum);
    }

    @Override
    public int total() {
        return dao.total();
    }

    @Override
    public Board hotTopic() {
        return dao.hotTopic();
    }

    @Override
    public List<Reply> getReply(int boardNum) {
        return dao.getReply(boardNum);
    }

    @Override
    public void addReply(Reply reply) {
        dao.addReply(reply);
    }

    @Override
    public Reply getReplyItem(int replyNum) {
        return dao.getReplyItem(replyNum);
    }

    @Override
    public void deleteReply(int replyNum) {
        dao.deleteReply(replyNum);
    }

    @Override
    public List<Hash> getHash(int boardNum) {
        return dao.getHash(boardNum);
    }

    @Override
    public void replyUpdate(Reply reply) {
        dao.replyUpdate(reply);
    }

}
