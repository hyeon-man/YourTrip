package kr.ac.kopo.YourTrip.member;

import kr.ac.kopo.YourTrip.Vo.Member;
import kr.ac.kopo.YourTrip.Vo.MyBoard;

import java.util.List;

public interface MemberService {

    void signup(Member member);

    boolean login(Member member);

    Member item(int memberNum);

    boolean checkId(String id);

    boolean checkNick(String nick);

    List<MyBoard> boardList(MyBoard board);
}
