package kr.ac.kopo.YourTrip.board.hash;

import kr.ac.kopo.YourTrip.Vo.Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HashServiceImpl implements HashService {
    final HashDao dao;

    public HashServiceImpl(HashDao dao) {
        this.dao = dao;
    }

    @Override
    public void addhashes(Hash hash) {
        if (dao.hashCheck(hash) == null) { // 해시 유무 확인 했을 때 없으면
            dao.hashInsert(hash); // 해시에 추가
            dao.connectHash(hash); // 커넥트에 추가
        } else if (dao.hashCheck(hash) != null) {
            hash.setHashNum(dao.hashCheck(hash).getHashNum());
            dao.connectHash(hash);
        }
    }
}
