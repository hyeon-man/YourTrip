package kr.ac.kopo.YourTrip.root;

import kr.ac.kopo.YourTrip.Vo.Member;

public interface RootService {

    void signup(Member member);

    boolean login(Member member);

    Member item(int memberNum);
}
