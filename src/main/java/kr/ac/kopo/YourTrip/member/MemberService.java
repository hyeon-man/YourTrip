package kr.ac.kopo.YourTrip.member;

import kr.ac.kopo.YourTrip.Vo.Member;

public interface MemberService {

    void signup(Member member);

    boolean login(Member member);

    Member item(int memberNum);

    boolean checkId(String id);

    boolean checkNick(String nick);
}
