package com.project.dd.mypage.attraction.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.dd.login.domain.CustomUser;
import com.project.dd.mypage.attraction.domain.AttractionDTO;
import com.project.dd.mypage.attraction.service.MypageAttractionService;

@Controller
@RequestMapping("/member/mypage/attraction")
public class MemberMypageAttractionController {

	@Autowired
	private MypageAttractionService service;

	@GetMapping(value = "/view.do")
	public String view(Model model, Authentication auth, @RequestParam(defaultValue = "1") int page) {

		Map<String, String> map = service.paging(page);  //페이징
		
		String email = ((CustomUser) auth.getPrincipal()).getDto().getEmail();
		
		map.put("email", email);
		
		List<AttractionDTO> list = service.list(map);
		List<AttractionDTO> plist = service.plist(map);

		model.addAttribute("list", list);
		model.addAttribute("plist", plist);
		model.addAttribute("email", email);
		model.addAttribute("currentPage", page);  //페이징
	    model.addAttribute("map", map);  //페이징

		return "mypage/attraction/view";
	}
	
	@PostMapping(value = "/delete.do")
	public String delete(Model model, String selectedAttraction) {

		int result = service.delete(selectedAttraction);

		if (result == 1) {

			return "redirect:/member/mypage/attraction/view.do";

		} else {
			
			System.out.println("attraction delete error");
			
		}

		return "redirect:/member/mypage/attraction/view.do";
	}

}
