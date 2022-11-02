package kr.ac.kopo.YourTrip.member;

import kr.ac.kopo.YourTrip.Vo.Member;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDaoImpl implements MemberDao {
    final SqlSession sql;

    public MemberDaoImpl(SqlSession sql) {
        this.sql = sql;
    }


    @Override
    public void signup(Member member) {
        sql.insert("member.signup", member);
    }

    @Override
    public Member login(Member member) {
        return sql.selectOne("member.login", member);
    }

    @Override
    public Member item(int memberNum) {
        return sql.selectOne("member.item", memberNum);
    }

}