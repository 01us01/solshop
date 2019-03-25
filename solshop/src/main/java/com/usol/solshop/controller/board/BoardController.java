package com.usol.solshop.controller.board;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("board/*")
public class BoardController {

	@RequestMapping("boardlist.do")
	public String boardlist() {
		return "board/boardlist";
	}
	
}
