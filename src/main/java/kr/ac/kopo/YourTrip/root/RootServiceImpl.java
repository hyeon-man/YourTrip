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
    public void signup(Member member) {
        dao.signup(member);
    }

    @Override
    public boolean login(Member member) {
        Member item = dao.login(member);
        if (item != null) {

            member.setMemberId(item.getMemberId());
            member.setMemberPass(null);
            member.setMemberNick(item.getMemberNick());
            member.setMemberName(item.getMemberName());
            member.setMemberNum(item.getMemberNum());

            return true;
        } else {
            return false;
        }

    }

    @Override
    public Member item(int memberNum) {

        return dao.item(memberNum);
    }
}
