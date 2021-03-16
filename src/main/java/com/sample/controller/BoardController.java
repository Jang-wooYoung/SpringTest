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
import com.sample.BoardVO.BoardVO;
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
	public String list(Model model, HttpServletRequest req) throws Exception {
		logger.info("list");
		
		int currentPage = 1;
		int rowCount = 5;
		int blockPage = 5;
		String searchType = "";
		String keyword = "";		
		
		if(req.getParameter("currentPage") != null && !"".equals(req.getParameter("currentPage"))) currentPage = Integer.valueOf(req.getParameter("currentPage"));
		if(req.getParameter("rowCount") != null && !"".equals(req.getParameter("rowCount"))) rowCount = Integer.valueOf(req.getParameter("rowCount"));
		if(req.getParameter("blockPage") != null && !"".equals(req.getParameter("blockPage"))) blockPage = Integer.valueOf(req.getParameter("blockPage"));
		if(req.getParameter("searchType") != null && !"".equals(req.getParameter("searchType"))) searchType = (String)req.getParameter("searchType");
		if(req.getParameter("keyword") != null && !"".equals(req.getParameter("keyword"))) keyword = (String)req.getParameter("keyword");
		
		BoardVO boardVO = new BoardVO();
		
		boardVO.setCurrentPage(currentPage);
		boardVO.setBlockPage(blockPage);
		boardVO.setRowCount(rowCount);
		boardVO.setRowStart(currentPage, rowCount);
		boardVO.setRowEnd(currentPage, rowCount);
		boardVO.setSearchType(searchType);
		boardVO.setKeyword(keyword);
		boardVO.setTotalCount(service.listCount(boardVO));		
		
		model.addAttribute("dataList",service.dataList(boardVO));
		model.addAttribute("boardVO", boardVO); 
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
