package kr.ac.kopo.YourTrip.root;

import kr.ac.kopo.YourTrip.VO.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
public class RootController {
    final RootService service;

    public RootController(RootService service) {
        this.service = service;
    }

    @GetMapping("/")
    public String index() {
        return "index";
    }

    @GetMapping("/login")
    public String login() {
        return "member/login";
    }

    @GetMapping("member/signup")
    public String signup() {
        return "member/signup";
    }

    @GetMapping("member/passfind")
    public String passfind() {
        return "member/passfind";
    }


    @PostMapping("/login")
    public String login(HttpSession session, Member member) {
        if(service.login(member)){
            session.setAttribute("member", member);
            return "board/list";
        } else {
            return "redirect:/index2";
        }
    }

    @PostMapping("member/signup")
    public String signup(Member member) {

        service.signup(member);
        return "member/login";
    }

    @RequestMapping("/index2")
    public String index2() {
        return "index2";
    }

}
