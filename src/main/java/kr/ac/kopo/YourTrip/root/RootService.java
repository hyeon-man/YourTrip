package kr.ac.kopo.YourTrip.root;

import kr.ac.kopo.YourTrip.VO.Member;

public interface RootService {
    void login(Member member);

    void signup(Member member);
}
