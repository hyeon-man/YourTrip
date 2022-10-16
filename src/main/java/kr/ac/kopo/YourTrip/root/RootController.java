package kr.ac.kopo.YourTrip.root;

import kr.ac.kopo.YourTrip.VO.Member;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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

    @PostMapping("/login")
    public String login(HttpSession session, Member member) {
        if (service.login(member)) {
            session.setAttribute("member", member);
            return "redirect:board/list";
        } else {
            return "index";
        }
    }

    @PostMapping("/signup")
    public String signup(Member member) {

        service.signup(member);

        return "index";
    }

    @GetMapping("/detail/{memberNum}")
    public String memberDetail(@PathVariable int memberNum, Model model){
        Member member = service.item(memberNum);
        member.setMemberPass(null);
        model.addAttribute("item", member);

        return "member/memberDetail";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session){
        session.invalidate();

        return "redirect:/board/list";
    }
}
