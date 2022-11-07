package kr.ac.kopo.YourTrip.board;

import kr.ac.kopo.YourTrip.Util.SysoutTester;
import kr.ac.kopo.YourTrip.Vo.*;
import kr.ac.kopo.YourTrip.Util.PageUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.ArrayList;
import java.util.List;


@Controller
@RequestMapping("/board")
public class BoardController {
    final BoardService service;
    public BoardController(BoardService service) {
        this.service = service;
    }
    final String uploadPath = "d://upload/";
    final SysoutTester sout = new SysoutTester();

    @RequestMapping("/list")
    public String list(Model model, Search search) {

        List<Board> list = service.list(search); // 리스트 뽑아오기 이거 쓸 지 안 쓸 지 모르곘는데 아마 안 쓸 듯
        int boardTotal = service.total(); // 전체 게시글수 카운팅

        Board hotTopic = service.hotTopic(); // 핫토픽 한개
        List<Attach> hotTopicPicture = service.hotTopicPicture(hotTopic.getBoardNum());
        List<Hash> hashOption = service.hashOption();

        model.addAttribute("list", list);
        model.addAttribute("total", boardTotal);
        model.addAttribute("hotTopic", hotTopic);
        model.addAttribute("hotTopicPicture", hotTopicPicture);
        model.addAttribute("hashOption", hashOption);
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
    public String add(Board board, @SessionAttribute Member member) {

        board.setBoardWrite(member.getMemberId());

        try {
            List<Attach> list = new ArrayList<Attach>(); // 이미지를 담을 list
            for (MultipartFile attach : board.getAttach()) { // 멀티파트파일 attach의 크기만큼 반복
                if (attach != null && !attach.isEmpty()) { // if 어태치가 null이 아니고, 어태치가 비어있지 않을때 == 정상적인 파일 업로드를 실행했으면
                    String filename = attach.getOriginalFilename(); // 파일네임 == 사용자가 올린 파일의 이름을 filename에 저장
                    attach.transferTo(new File(uploadPath + filename)); //  파일 데이터를 저장함
                    Attach attachItem = new Attach();
                    attachItem.setAttachFileName(filename);
                    list.add(attachItem); // game클래스 list에 추가
                }
            }
            board.setAttachs(list); // 보드에 attachs에 list를 추가함
            service.add(board); //그 보드를 추가
        } catch (Exception e) { // 오류나면
            e.printStackTrace(); // 로그찍어
        }

        int boardNum = board.getBoardNum();

        return "redirect:detail/" + boardNum;
    }


    @GetMapping("/detail/{boardNum}")
    public String detail(@PathVariable int boardNum, Model model, HttpServletRequest httpServletRequest) {
        HttpSession session = httpServletRequest.getSession();
        Member member = (Member) session.getAttribute("member");

        sout.test(member.getMemberId(), getClass().getSimpleName());

        int memberNum = member.getMemberNum();

        //게시글 정보
        Board item = service.test(boardNum, memberNum);
        sout.test(item.getRecommendMemberCount(), getClass().getSimpleName());

        model.addAttribute("item", item);
        // 댓글
        List<Reply> list = service.getReply(boardNum);
        model.addAttribute("ReplyList", list);

        // 해시
        List<Hash> hash = service.getHash(boardNum);
        model.addAttribute("hash", hash);

        // 사진
        List<Attach> attachs = service.getAttach(boardNum);
        model.addAttribute("attach", attachs);

        return "board/detail";
    }

    @RequestMapping("/detail/delete/{boardNum}")
    public String delete(@PathVariable int boardNum) {

        service.delete(boardNum);

        return "redirect:/board/list";
    }

    @GetMapping("/update/{boardNum}")
    public String update(@PathVariable int boardNum, Model model) {

        Board item = service.item(boardNum);
        model.addAttribute("item", item);

        return "board/update";
    }

    @PostMapping("/update/{boardNum}")
    public String update(@PathVariable int boardNum, Board board) {

        service.update(board);

        return "redirect:/board/detail/" + boardNum;
    }

    @RequestMapping("/recommend/{boardNum}")
    public String recommend(@PathVariable int boardNum, PageUtil pageUtil, HttpServletRequest request, @SessionAttribute Member member, Board board) {
        String prevPage = pageUtil.prevPage(request);

        board.setMemberNum(member.getMemberNum());
        board.setBoardWrite(member.getMemberId());
        board.setBoardNum(boardNum);

        service.recommend(board);

        return "redirect:" + prevPage;
    }

    @PostMapping("/recommendCancel/{boardNum}")
    public String recommendCancel(@PathVariable int boardNum, PageUtil pageUtil, HttpServletRequest request, Board board, @SessionAttribute Member member) {

        String prevPage = pageUtil.prevPage(request);

        board.setBoardNum(boardNum);
        board.setMemberNum(member.getMemberNum());

        service.recommendCancel(board);

        return "redirect:" + prevPage;
    }


    @PostMapping("/replyUpdate/{replyNum}")
    public String replyUpdate(@PathVariable int replyNum, Reply reply, PageUtil pageUtil, HttpServletRequest request) {
        String prevPage = pageUtil.prevPage(request);

        reply.setReplyNum(replyNum);
        service.replyUpdate(reply);

        return "redirect:" + prevPage;
    }

    @RequestMapping("/search/{HashName}")
    public String search(@PathVariable String HashName, Model model) {

        List<Board> list = service.hashSearchList(HashName);
        model.addAttribute("list", list);
        int total = service.hashSearchListTotal(HashName);
        model.addAttribute("total", total);
        model.addAttribute("HashName", HashName);

        return "board/search";
    }

    @RequestMapping("/search")
    public String search(Search search, Model model) {
        List<Board> list = service.search(search);
        model.addAttribute("list", list);
        int total = service.keyworldTotalList(search.getKeyword());
        model.addAttribute("total", total);
        String hashName = search.getKeyword();
        model.addAttribute("HashName", hashName);
        return "board/search";
    }
}
