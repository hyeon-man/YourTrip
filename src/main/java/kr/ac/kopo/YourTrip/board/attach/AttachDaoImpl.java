package kr.ac.kopo.YourTrip.board.attach;

import kr.ac.kopo.YourTrip.Vo.Attach;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class AttachDaoImpl implements AttachDao{
    final SqlSession sql;
    public AttachDaoImpl(SqlSession sql) {
        this.sql = sql;
    }

    @Override
    public void add(Attach attach) {
        sql.insert("attach.add", attach);
    }
}
