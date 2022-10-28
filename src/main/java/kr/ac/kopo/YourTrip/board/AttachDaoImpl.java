package kr.ac.kopo.YourTrip.board;

import kr.ac.kopo.YourTrip.Vo.Attach;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AttachDaoImpl implements AttachDao{
    @Autowired
    SqlSession sql;

    @Override
    public void add(Attach attach) {
        sql.insert("attach.add", attach);
    }
}
