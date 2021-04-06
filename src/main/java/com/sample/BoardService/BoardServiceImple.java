package com.sample.BoardService;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.sample.BoardVO.BoardVO;
import com.sample.BoardVO.CommentVO;
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
	public List<DataVO> dataList(BoardVO boardVO) throws Exception {
		return dao.dataList(boardVO);
	}
	
	//게시글 상세보기
	@Override
	public DataVO detail(String dataUid) throws Exception {
		return dao.detail(dataUid);
	}
	
	//개시글 개수
	@Override
	public int listCount(BoardVO boardVO) throws Exception {
		return dao.listCount(boardVO);
	}
	
	//게시글 댓글 리스트
	@Override
	public List<CommentVO> commentList(String dataUid) throws Exception {
		return dao.commentList(dataUid);
	}
	
	//게시글 댓글 작성
	@Override
	public void commentwrite(CommentVO commentVO) throws Exception {
		dao.commentwrite(commentVO);
	}
	
	//게시글 댓글 수정
	@Override
	public void commentupdate(CommentVO commentVO) throws Exception {
		dao.commentupdate(commentVO);
	}
	
	//게시글 댓글 삭제
	@Override
	public void commentdelete(String commentUid) throws Exception {
		dao.commentdelete(commentUid);
	}
	
	//게시글 댓글 상세보기
	@Override
	public CommentVO commentdetail(String commentUid) throws Exception {
		return dao.commentdetail(commentUid);
	}
}
