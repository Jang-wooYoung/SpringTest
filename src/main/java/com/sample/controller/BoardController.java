package com.sample.controller;

import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

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
	public void writeView(HttpServletRequest req, Model model) throws Exception {
		String dataUid = "";
		if(req.getParameter("dataUid") != null && !"".equals(req.getParameter("dataUid"))) dataUid = (String)req.getParameter("dataUid");
		model.addAttribute("dataVO", service.detail(dataUid));		
		logger.info("writeView");		
	}
	
	//게시판 글작성
	@RequestMapping(value = "/board/write", method = RequestMethod.POST)	
	public String write(DataVO dataVO) throws Exception {		
		logger.info("write");
		service.write(dataVO);		
		return "redirect:/board/list";
	}		
	
	//게시글 수정
	@RequestMapping(value = "/board/update", method = RequestMethod.POST)
	public String update(DataVO dataVO) throws Exception {
		logger.info("update");
		service.update(dataVO);
		return "redirect:/board/list";
	}
	
	//게시글 삭제
	@RequestMapping(value = "/board/delete", method = RequestMethod.GET)
	public String delete(String dataUid, HttpServletRequest req) throws Exception {
		logger.info("delte");
		if(req.getParameter("dataUid") != null && !"".equals(req.getParameter("dataUid"))) dataUid = (String)req.getParameter("dataUid");
		service.delete(dataUid);
		return "redirect:/board/list";
	}
	
	//게시판 목록 조회
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model) throws Exception {
		logger.info("list");
		model.addAttribute("dataList",service.dataList());
		return "/board/list";
	}
	
	//게시판 상세보기
	@RequestMapping(value = "/View", method = RequestMethod.GET)
	public String detail(DataVO dataVO, Model model) throws Exception {
		logger.info("View");
		model.addAttribute("detail", service.detail(dataVO.getDataUid()));
		return "/board/View";
	}
}
