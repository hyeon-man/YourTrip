package kr.ac.kopo.YourTrip.Vo;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class Hash {

    private int hashNum;
    private int hashBoardNum;
    private String hashName;

    private List<Hash> hashes;

}
