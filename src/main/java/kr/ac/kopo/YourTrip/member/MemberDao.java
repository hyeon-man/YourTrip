package kr.ac.kopo.YourTrip.member;

import kr.ac.kopo.YourTrip.Vo.Member;

public interface MemberDao {

    void signup(Member member);

    Member login(Member member);

    Member item(int memberNum);

    int checkID(String id);

    int checkNick(String nick);
}
