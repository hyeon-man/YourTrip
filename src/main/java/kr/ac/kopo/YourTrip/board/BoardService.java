package kr.ac.kopo.YourTrip.board;

import kr.ac.kopo.YourTrip.Vo.*;

import java.util.List;

public interface BoardService {
    List<Board> list(Search search);

    void add(Board board);

    Board item(int boardNum);

    void delete(int boardNum);

    void update(Board board);


    int total();

    Board hotTopic();

    List<Reply> getReply(int boardNum);

    void addReply(Reply reply);

    void deleteReply(int replyNum);

    List<Hash> getHash(int boardNum);

    void replyUpdate(Reply reply);

    List<Attach> hotTopicPicture(int boardNum);

    List<Attach> getAttach(int boardNum);

    void recommend(Board board);

    List<Board> hashSearchList(String hashName);

    int hashSearchListTotal(String hashName);


    List<Hash> hashOption();

    List<Board> search(Search search);

    int keyworldTotalList(String keyword);

    void recommendCancel(Board board);

    Board test(int boardNum, int memberNum);
}
