package com.sample.BoardService;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.sample.DataDAO.*;
import com.sample.DataVO.*;

@Service
public class BoardServiceImple implements BoardService{

	@Inject
	private DataDAO dao;
	
	//게시글 작성
	@Override
	public void write(DataVO dataVO) throws Exception {
		dao.write(dataVO);		
	}
	
	//게시글 수정
	@Override
	public void update(DataVO dataVO) throws Exception {
		dao.update(dataVO);
	}
	
	//게시글 삭제
	@Override
	public void delete(String dataUid) throws Exception {
		dao.delete(dataUid);
	}
	
	//게시글 목록 조회
	@Override
	public List<DataVO> dataList() throws Exception {
		return dao.dataList();
	}
	
	//게시글 상세보기
	@Override
	public DataVO detail(String dataUid) throws Exception {
		return dao.detail(dataUid);
	}
}
