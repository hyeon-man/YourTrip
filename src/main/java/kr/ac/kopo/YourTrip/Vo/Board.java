package kr.ac.kopo.YourTrip.Vo;

import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Getter
@Setter

public class Board {
    private int boardNum;
    private String boardTitle;
    private String boardContent;
    private int boardHit;
    private int boardRecommend;
    private String boardWrite;
    private int total;
    private int memberNum;

    private List<MultipartFile> attach;
    private List<Attach> attachs;

    private List<String> hashName;
    private List<Hash> hashes;

    private String boardImage;
    private String recommendMemberCount;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private String boardDate;


}
