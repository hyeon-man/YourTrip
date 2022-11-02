package kr.ac.kopo.YourTrip.member;

import kr.ac.kopo.YourTrip.Vo.Member;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class MemberController {
    final MemberService service;

    public MemberController(MemberService service) {
        this.service = service;
    }

    @GetMapping("/")
    public String index() {
        return "redirect:board/list";
    }

    @PostMapping("/login")
    public String login(HttpSession session, Member member, HttpServletRequest request) {
        String referer = request.getHeader("referer");

        System.out.println("이전페이지는" + referer);

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
    public String logout(HttpSession session,HttpServletRequest request){
        session.invalidate();
        String referer = request.getHeader("referer");
        System.out.println("이전페이지는" + referer);

        return "redirect:" + referer;
    }
}