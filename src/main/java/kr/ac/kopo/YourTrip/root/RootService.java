package kr.ac.kopo.YourTrip.root;

import kr.ac.kopo.YourTrip.VO.Member;

public interface RootService {

    void signup(Member member);

    boolean login(Member member);
}
