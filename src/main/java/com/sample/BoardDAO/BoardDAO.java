package com.sample.BoardDAO;

import java.util.List;

import com.sample.BoardVO.*;;

public interface BoardDAO {
	
	//게시글 작성
	public void write(BoardVO boardVO) throws Exception;
	
	//게시글 목록 조회
	public List<BoardVO> boardList() throws Exception;
}
