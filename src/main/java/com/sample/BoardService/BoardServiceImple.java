package com.sample.BoardService;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.sample.BoardDAO.*;
import com.sample.BoardVO.*;

@Service
public class BoardServiceImple implements BoardService{

	@Inject
	private BoardDAO dao;
	
	//게시글 작성
	@Override
	public void write(BoardVO boardVO) throws Exception {
		dao.write(boardVO);		
	}
	
	//게시글 목록 조회
	@Override
	public List<BoardVO> boardList() throws Exception {
		return dao.boardList();
	}
}
