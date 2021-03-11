package com.sample.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sample.BoardService.*;
import com.sample.DataVO.*;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	BoardService service;
	
	//게시판 작성 화면
	@RequestMapping(value="/board/writeView", method = RequestMethod.GET)
	public void writeView() throws Exception {
		logger.info("writeView");		
	}
	
	//게시판 글작성
	@RequestMapping(value = "/board/write", method = RequestMethod.POST)	
	public String write(DataVO dataVO) throws Exception {		
		logger.info("write");
		service.write(dataVO);		
		return "redirect:/board/list";
	}
	
	//게시판 목록 조회
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model) throws Exception {
		logger.info("list");
		model.addAttribute("dataList",service.dataList());
		return "board/list";
	}
	
	//게시판 상세보기
	@RequestMapping(value = "/View", method = RequestMethod.GET)
	public String detail(DataVO dataVO, Model model) throws Exception {
		logger.info("View");
		model.addAttribute("detail", service.detail(dataVO.getDataUid()));
		return "board/View";
	}
}
