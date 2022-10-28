package kr.ac.kopo.YourTrip.Vo;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class Member {
    private int memberNum;
    private String memberId;
    private String memberPass;
    private String memberName;
    private String memberNick;
    private Date memberRegDate;
    private String memberPhone;
    private String memberMail;
}
