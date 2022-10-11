package kr.ac.kopo.YourTrip.root;

import kr.ac.kopo.YourTrip.VO.Member;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RootDaoImpl implements RootDao{
    final SqlSession sql;

    public RootDaoImpl(SqlSession sql) {
        this.sql = sql;
    }

    @Override
    public void login(Member member) {
        sql.selectOne("member.login", member);
    }

    @Override
    public void signup(Member member) {
        sql.insert("member.signup", member);
    }
}
