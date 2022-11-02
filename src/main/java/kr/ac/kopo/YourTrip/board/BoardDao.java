package kr.ac.kopo.YourTrip.board;

import kr.ac.kopo.YourTrip.Vo.*;

import java.util.List;

public interface BoardDao {
    List<Board> list(Search search);

    void add(Board board);

    Board item(int boardNum);

    void delete(int boardNum);

    void update(Board board);

    int total();

    Board hotTopic();

    List<Reply> getReply(int boardNum);

    void addReply(Reply reply);

    Reply getReplyItem(int replyNum);

    void deleteReply(int replyNum);

    List<Hash> getHash(int boardNum);

    void replyUpdate(Reply reply);

    List<Attach> hotTopicPicture(int boardNum);

    List<Attach> getAttach(int boardNum);

    int recommendCheck(Board board);

    void insertRecommendTable(Board board);

    void updateBoardRecommend(Board board);

    List<Board> hashSearchList(String hashName);

    int hashSearchListTotal(String hashName);


    List<Hash> hashOption();

    List<Board> search(Search search);

    int keyworldTotalList(String keyword);
}
