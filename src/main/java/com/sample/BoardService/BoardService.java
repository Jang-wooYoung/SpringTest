package com.sample.BoardService;

import java.util.List;

import com.sample.DataVO.*;

public interface BoardService {
	
	//게시글작성
	public void write(DataVO dataVO) throws Exception;
	
	//게시글 목록 조회
	public List<DataVO> dataList() throws Exception;
	
	//게시글 상세보기
	public DataVO detail(String dataUid) throws Exception;
}
