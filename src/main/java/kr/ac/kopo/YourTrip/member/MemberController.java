package kr.ac.kopo.YourTrip.member;

import kr.ac.kopo.YourTrip.Util.SysoutTester;
import kr.ac.kopo.YourTrip.Vo.Member;
import kr.ac.kopo.YourTrip.Vo.MyBoard;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class MemberController {
    final MemberService service;
    final SysoutTester sout = new SysoutTester();

    public MemberController(MemberService service) {
        this.service = service;
    }

    @GetMapping("/")
    public String index() {
        return "redirect:board/list";
    }

    @PostMapping("/login")
    public String login(HttpSession session, Member member, HttpServletRequest request, Model model) {
        String referer = request.getHeader("referer");

        if (service.login(member)) {
            session.setAttribute("member", member);
            return "redirect:" + referer;
        } else {
            return "redirect:/";
        }
    }

    @PostMapping("/signup")
    public String signup(Member member) {

        service.signup(member);

        return "redirect:board/list";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session, HttpServletRequest request) {
        session.invalidate();
        String referer = request.getHeader("referer");


        return "redirect:" + referer;
    }

    @ResponseBody
    @PostMapping("/checkId/{id}")
    public String checkId(@PathVariable String id) {
        sout.test(id, getClass().getSimpleName());

        if (service.checkId(id) == true) {
            return "OK";
        } else {
            return "FAIL";

        }
    }

    @ResponseBody
    @PostMapping("/checkNick/{nick}")
    public String checkNick(@PathVariable String nick) {
        sout.test(nick, getClass().getSimpleName());

        if (service.checkNick(nick) == true) {
            return "OK";
        } else {
            return "FAIL";
        }
    }

    @RequestMapping("/board/myPage")
    public String myPage(MyBoard board, Model model){
//        List<MyBoard> list = service.boardList(board);
//
//        model.addAttribute("list", list);


        return "board/myPage";
    }
}
