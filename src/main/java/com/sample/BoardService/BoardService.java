package com.sample.BoardService;

import java.util.List;

import com.sample.BoardVO.*;

public interface BoardService {
	
	//게시글작성
	public void write(BoardVO boardVO) throws Exception;
	
	//게시글 목록 조회
	public List<BoardVO> boardList() throws Exception;
}
