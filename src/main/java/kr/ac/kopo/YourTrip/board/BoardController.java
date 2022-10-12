package kr.ac.kopo.YourTrip.board;

import kr.ac.kopo.YourTrip.VO.Board;
import kr.ac.kopo.YourTrip.VO.Search;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.PrintWriter;
import java.util.List;

import static java.lang.System.out;

@Controller

/*의존성 주입*/
@RequestMapping("/board")
public class BoardController {
    final BoardService service;

    public BoardController(BoardService service) {
        this.service = service;
    }

    /*리스트 페이지*/
    @RequestMapping("/list")
    public String list(Model model, Search search) {

        List<Board> list = service.list(search);
        model.addAttribute("list", list);

        return "board/list";
    }

    /*게시물 등록 페이지*/
    @GetMapping("/add")
    public String add() {

        return "board/add";
    }

    /*게시물 등록 적용*/
    @PostMapping("/add")
    public String add(Board board) {

        service.add(board);

        return "redirect:list";
    }

    /*게시물 상세보기*/
    @GetMapping("/detail/{boardNum}")
    public String detail(@PathVariable int boardNum, Model model) {

        Board item = service.item(boardNum);
        model.addAttribute("item", item);

        return "board/detail";
    }

    /*게시물 삭제*/
    @RequestMapping("/detail/delete/{boardNum}")
    public String delete(@PathVariable int boardNum) {

        service.delete(boardNum);

        return "redirect:../../list";
    }

    /*게시물 수정 페이지*/
    @GetMapping("detail/update/{boardNum}")
    public String update(@PathVariable int boardNum, Model model) {

        Board item = service.item(boardNum);
        model.addAttribute("item", item);

        return "board/update";
    }

    /*게시물 수정 적용*/
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
}