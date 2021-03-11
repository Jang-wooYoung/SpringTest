package com.sample.DataDAO;

import java.util.List;

import com.sample.DataVO.*;;

public interface DataDAO {
	
	//게시글 작성
	public void write(DataVO dataVO) throws Exception;
	
	//게시글 목록 조회
	public List<DataVO> dataList() throws Exception;
	
	//게시글 상세보기
	public DataVO detail(String dataUid) throws Exception;
}
