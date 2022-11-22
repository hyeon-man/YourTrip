package kr.ac.kopo.YourTrip.board.hash;

import kr.ac.kopo.YourTrip.Vo.Hash;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class HashDaoImpl implements HashDao {
    final SqlSession sql;

    public HashDaoImpl(SqlSession sql) {
        this.sql = sql;
    }

    @Override
    public Hash hashCheck(Hash hash) {
        return sql.selectOne("hash.hashCheck", hash);
    }

    @Override
    public void hashInsert(Hash hash) {
        sql.insert("hash.hashInsert", hash);
    }

    @Override
    public void connectHash(Hash hash) {
        sql.insert("hash.connectInsert", hash);
    }
}
