package kr.ac.kopo.YourTrip.board;

import kr.ac.kopo.YourTrip.Vo.*;
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

        if(board.getAttachs() != null){
            for (Attach attach : board.getAttachs()){
                attach.setAttachBoardNum(board.getBoardNum());
                attachDao.add(attach);
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

    @Override
    public List<Attach> getAttach(int boardNum) {
        return dao.getAttach(boardNum);
    }

    @Override
    public void recommend(Board board) {
        if(dao.recommendCheck(board) == 0){
            dao.insertRecommendTable(board);
            dao.updateBoardRecommend(board);
            System.out.println("추천 완료");
        } else {
            System.out.println("이미 추천한 게시글");
        }
    }

    @Override
    public List<Board> hashSearchList(String hashName) {
        return dao.hashSearchList(hashName);
    }

    @Override
    public int hashSearchListTotal(String hashName) {
        return dao.hashSearchListTotal(hashName);
    }

    @Override
    public List<Hash> hashOption() {
        return dao.hashOption();
    }

    @Override
    public List<Board> search(Search search) {
        return dao.search(search);
    }

    @Override
    public int keyworldTotalList(String keyword) {
        return dao.keyworldTotalList(keyword);
    }


}
