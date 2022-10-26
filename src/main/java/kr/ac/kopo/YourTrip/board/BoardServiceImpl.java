package kr.ac.kopo.YourTrip.board;

import kr.ac.kopo.YourTrip.VO.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class BoardServiceImpl implements BoardService {
    final BoardDao dao;

    public BoardServiceImpl(BoardDao dao, AttachDao attachDao) {
        this.dao = dao;
        this.attachDao = attachDao;
    }
    final AttachDao attachDao;

    @Override
    public List<Board> list(Search search) {
        return dao.list(search);
    }

    @Override
    @Transactional
    public void add(Board board) {
        dao.add(board);
        System.out.println(board.getBoardNum() + "보드넘은");

        if(board.getAttachs() != null){
            for (Attach attach : board.getAttachs()){
                attach.setAttachBoardNum(board.getBoardNum());
                attachDao.add(attach);
                System.out.println(attach.getAttachBoardNum() + "보드넘은");

            }
        }
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

    @Override
    public List<Attach> hotTopicPicture(int boardNum) {
        return dao.hotTopicPicture(boardNum);
    }


}
