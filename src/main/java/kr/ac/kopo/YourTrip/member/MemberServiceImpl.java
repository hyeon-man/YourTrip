package kr.ac.kopo.YourTrip.member;

import kr.ac.kopo.YourTrip.Vo.Member;
import kr.ac.kopo.YourTrip.Vo.MyBoard;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

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

    @Override
    public boolean checkId(String id) {
        if (dao.checkID(id) == 0) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    public boolean checkNick(String nick) {
        if(dao.checkNick(nick) == 0){
            return true;
        } else {
            return false;
        }
    }

    @Override
    public List<MyBoard> boardList(MyBoard board) {
        return dao.boardList(board);
    }
}