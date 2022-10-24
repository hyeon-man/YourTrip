package kr.ac.kopo.YourTrip.board;

import kr.ac.kopo.YourTrip.VO.Board;
import kr.ac.kopo.YourTrip.VO.Hash;
import kr.ac.kopo.YourTrip.VO.Reply;
import kr.ac.kopo.YourTrip.VO.Search;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;


@Controller
@RequestMapping("/board")
public class BoardController {
    final BoardService service;
    public BoardController(BoardService service) {
        this.service = service;
    }

    @RequestMapping("/list")
    public String list(Model model, Search search) {

        List<Board> list = service.list(search); // 리스트 뽑아오기 이거 쓸 지 안 쓸 지 모르곘는데 아마 안 쓸 듯
        int boardTotal = service.total(); // 전체 게시글수 카운팅
        Board hotTopic = service.hotTopic(); // 핫토픽 한개

        model.addAttribute("list", list);
        model.addAttribute("total", boardTotal);
        model.addAttribute("hotTopic", hotTopic);

        int boardNum = hotTopic.getBoardNum();
        List<Hash> hashList = service.getHash(boardNum);
        model.addAttribute("hash", hashList);

        return "board/list";
    }

    @GetMapping("/add")
    public String add() {

        return "board/add";
    }

    @PostMapping("/add")
    public String add(Board board) {

        service.add(board);

        return "redirect:list";
    }

    @GetMapping("/detail/{boardNum}")
    public String detail(@PathVariable int boardNum, Model model) {

        Board item = service.item(boardNum);
        model.addAttribute("item", item);

        List<Reply> list = service.getReply(boardNum);
        model.addAttribute("ReplyList", list);

        List<Hash> hash = service.getHash(boardNum);
        model.addAttribute("hash", hash);

        return "board/detail";
    }

    @RequestMapping("/detail/delete/{boardNum}")
    public String delete(@PathVariable int boardNum) {

        service.delete(boardNum);

        return "redirect:../../list";
    }

    @GetMapping("detail/update/{boardNum}")
    public String update(@PathVariable int boardNum, Model model) {

        Board item = service.item(boardNum);
        model.addAttribute("item", item);

        return "board/update";
    }

    @PostMapping("detail/update/{boardNum}")
    public String update(@PathVariable int boardNum, Board board) {

        service.update(board);

        return "redirect:../" + boardNum;
    }

    @RequestMapping("/detail/recommend/{boardNum}")
    public String recommend(@PathVariable int boardNum, Model model) {
        if (service.recommendCheck(boardNum) == 0) {
            service.recommendInsert(boardNum);
            service.recommend(boardNum);
            model.addAttribute("msg", "추천 됐습니다");
            return "redirect:../" + boardNum;

        } else {

            return "redirect:../" + boardNum;
        }
    }

    @PostMapping("/replyUpdate/{replyNum}")
    public String replyUpdate(@PathVariable int replyNum,Reply reply,HttpServletRequest request){

        String referer = request.getHeader("referer");
        System.out.println("이전페이지는" + referer);

        reply.setReplyNum(replyNum);
        service.replyUpdate(reply);

        return "redirect:" + referer;
    }
}