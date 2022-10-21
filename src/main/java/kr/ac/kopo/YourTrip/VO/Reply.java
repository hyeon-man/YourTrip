package kr.ac.kopo.YourTrip.VO;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
//댓글 모델
public class Reply {

    private int replyNum; // 댓글 pk
    private String replyWrite;  // 댓글 작성자
    private String replyContent; // 댓글 내용
    private int replyBoardNum; // 댓글이 달린 게시글
    private Date replyDate; // 댓글 시간간
}
