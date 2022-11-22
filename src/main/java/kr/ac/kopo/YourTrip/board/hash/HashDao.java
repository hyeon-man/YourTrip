package kr.ac.kopo.YourTrip.board.hash;

import kr.ac.kopo.YourTrip.Vo.Hash;

public interface HashDao {
    Hash hashCheck(Hash hash);

    void hashInsert(Hash hash);

    void connectHash(Hash hash);
}
