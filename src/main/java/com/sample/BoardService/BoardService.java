package com.sample.BoardService;

import java.util.List;

import com.sample.BoardVO.BoardVO;
import com.sample.DataVO.*;

public interface BoardService {
	
	//게시글작성
	public void write(DataVO dataVO) throws Exception;
	
	//게시글 수정
	public void update(DataVO dataVO) throws Exception;
	
	//게시글 삭제
	public void delete(String dataUid) throws Exception;
	
	//게시글 목록 조회
	public List<DataVO> dataList(BoardVO boardVO) throws Exception;
	
	//게시글 상세보기
	public DataVO detail(String dataUid) throws Exception;
	
	//게시글 개수
	public int listCount() throws Exception;
}
