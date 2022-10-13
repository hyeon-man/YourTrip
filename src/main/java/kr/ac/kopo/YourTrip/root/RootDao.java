package kr.ac.kopo.YourTrip.root;

import kr.ac.kopo.YourTrip.VO.Member;

public interface RootDao {

    void signup(Member member);

    Member login(Member member);
}
