package kr.ac.kopo.YourTrip.board.reply;

import kr.ac.kopo.YourTrip.VO.Member;
import kr.ac.kopo.YourTrip.VO.Reply;
import kr.ac.kopo.YourTrip.board.BoardService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class ReplyController {
    final BoardService service;

    public ReplyController(BoardService service) {
        this.service = service;
    }

    @PostMapping("/addReply/{boardNum}")
    public String addReply(@PathVariable int boardNum, Reply reply, @SessionAttribute Member member) {

        reply.setMemberName(member.getMemberId());
        reply.setReplyBoardNum(boardNum);

        service.addReply(reply);

        return "redirect:../board/detail/" + boardNum;
    }

    @RequestMapping("board/detail/deleteReply/{replyNum}")
    public String deleteReply(@PathVariable int replyNum, HttpServletRequest request) {

        String prevPage = request.getHeader("referer");
        System.out.println("이전페이지는" + prevPage);

        service.deleteReply(replyNum);

        return "redirect:" + prevPage;
    }
}
