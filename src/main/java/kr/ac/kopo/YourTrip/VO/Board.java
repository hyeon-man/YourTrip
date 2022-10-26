package kr.ac.kopo.YourTrip.VO;

import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import java.util.Date;
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

    private List<MultipartFile> attach;
    private List<Attach> attachs;


    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private String boardDate;


}
