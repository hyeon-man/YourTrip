package kr.ac.kopo.YourTrip.member;

import kr.ac.kopo.YourTrip.Vo.Member;
import kr.ac.kopo.YourTrip.Vo.MyBoard;

import java.util.List;

public interface MemberDao {

    void signup(Member member);

    Member login(Member member);

    Member item(int memberNum);

    int checkID(String id);

    int checkNick(String nick);

    List<MyBoard> boardList(MyBoard board);
}
