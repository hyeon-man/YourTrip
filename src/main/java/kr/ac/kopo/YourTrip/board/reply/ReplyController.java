package kr.ac.kopo.YourTrip.board.reply;

import kr.ac.kopo.YourTrip.VO.Reply;
import kr.ac.kopo.YourTrip.board.BoardService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReplyController {
    final BoardService service;

    public ReplyController(BoardService service) {
        this.service = service;
    }

    @PostMapping("/addReply/{boardNum}")
    public String addReply(@PathVariable int boardNum, Reply reply) {
        reply.setReplyBoardNum(boardNum);
        service.addReply(reply);

        return "redirect:../board/detail/" + boardNum;
    }

    @RequestMapping("board/detail/deleteReply/{replyNum}")
    public String deleteReply(@PathVariable int replyNum) {

        Reply reply = service.getReplyItem(replyNum); // 어디 Board로 돌아가야할지 몰라서 걍 댓글 지우기전에 boardNum 뽑아옴
        int targetBoard = reply.getReplyBoardNum();

        service.deleteReply(replyNum);

        return "redirect:../" + targetBoard;
    }
}
