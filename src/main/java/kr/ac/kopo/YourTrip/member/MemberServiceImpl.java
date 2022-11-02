package kr.ac.kopo.YourTrip.member;

import kr.ac.kopo.YourTrip.Vo.Member;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
public class MemberServiceImpl implements MemberService {
    private final MemberDao dao;

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
