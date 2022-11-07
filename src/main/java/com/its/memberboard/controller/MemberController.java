package com.its.memberboard.controller;

import com.its.memberboard.DTO.MemberDTO;
import com.its.memberboard.Service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
public class MemberController {
    @Autowired
    private MemberService memberService;

    @GetMapping("/member/save")
    public String memberSave() {
        return "memberSave";
    }

    @PostMapping("/member/save")
    public String postSave(@ModelAttribute MemberDTO memberDTO) throws IOException {
        memberService.save(memberDTO);
        return "index";
    }

    @PostMapping("/member/duplicateCheck")
    public @ResponseBody String duplicateCheck(@RequestParam("inputEmail") String memberEmail) {
        String checkResult = memberService.duplicate(memberEmail);
        return checkResult;
    }

    @GetMapping("/member/login")
    public String login() {
        return "memberLogin";
    }

    @PostMapping("/member/login")
    public String postLogin(@ModelAttribute MemberDTO memberDTO, Model model, HttpSession session) {
        boolean result = memberService.login(memberDTO);

        if (result) {
            model.addAttribute("login", memberDTO.getMemberEmail());
            session.setAttribute("loginEmail", memberDTO.getMemberEmail());
            return "boardList";
        } else {
            return "memberLogin";
        }
    }

    @GetMapping("/member/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "index";
    }


}
