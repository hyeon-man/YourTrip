package kr.ac.kopo.YourTrip.board;

import kr.ac.kopo.YourTrip.VO.*;

import java.util.List;

public interface BoardService {
    List<Board> list(Search search);

    void add(Board board);

    Board item(int boardNum);

    void delete(int boardNum);

    void update(Board board);

    int recommendCheck(int boardNum);

    void recommend(int boardNum);

    void recommendInsert(int boardNum);


    void hit(int boardNum);

    int total();

    Board hotTopic();

    List<Reply> getReply(int boardNum);

    void addReply(Reply reply);

    Reply getReplyItem(int replyNum);

    void deleteReply(int replyNum);

    List<Hash> getHash(int boardNum);

    void replyUpdate(Reply reply);

    List<Attach> hotTopicPicture(int boardNum);
}
