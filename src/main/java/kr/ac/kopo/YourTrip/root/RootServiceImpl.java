package kr.ac.kopo.YourTrip.root;

import kr.ac.kopo.YourTrip.VO.Member;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@RequiredArgsConstructor
@Service
public class RootServiceImpl implements RootService {
    private final RootDao dao;

    @Override
    public void login(Member member) {
        dao.login(member);
    }

    @Override
    public void signup(Member member) {
        dao.signup(member);
    }
}
