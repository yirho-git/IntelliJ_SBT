package kr.or.ddit.controller.member;

import kr.or.ddit.vo.MemberAuth;
import org.apache.ibatis.jdbc.Null;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import kr.or.ddit.controller.member.service.IMemberService;
import kr.or.ddit.vo.Member;
import lombok.extern.slf4j.Slf4j;

import java.util.List;

@Slf4j
@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	IMemberService service;
	
	@GetMapping("/register")
	public String memberRegisterForm() {
		log.info("registerForm()...");
		return "memberView/register";
	}
	
	@PostMapping("/register")
	public String memberRegister(Model model, Member member){
		log.info("register()...");
		
		int cnt = 0;
		cnt = service.insert(member);
		if(cnt > 0){
			model.addAttribute("msg", "등록성공");
		}else {
			model.addAttribute("msg", "등록실패");
		}
		return "memberView/success";
	}
	
	@GetMapping("/list")
	public String memberList(Model model) {
		log.info("list()...");
		
		List<Member> memberList = service.list();
		model.addAttribute("memberList", memberList);
		return "memberView/list";
	}

	@GetMapping("/read")
	public String memberDetail(Model model, int userNo){
		log.info("read()...");

		Member member = service.read(userNo);
		model.addAttribute("member", member);

		return "memberView/read";
	}

	@PostMapping("/delete")
	public String memberDelete(Model model, int userNo){
		log.info("delete()...");

		int rslt = service.delete(userNo);

		if(rslt > 0) model.addAttribute("msg","삭제 성공");
		else model.addAttribute("msg","삭제 실패");

		return "memberView/success";
	}

	@PostMapping("/modify")
	public String memberModify(Model model, Member member){
		log.info("memberModify()...");


		int rslt = service.modify(member);

		if(rslt > 0) model.addAttribute("msg","수정 성공");
		else model.addAttribute("msg","수정 실패");

		return "memberView/success";
	}

	@GetMapping("/searchList")
	@ResponseBody
	public List<Member> searchList(@RequestParam String keyword){
		log.info("searchList()...");

		List<Member> memberList = service.searchList(keyword);

		return memberList;
	}
}
