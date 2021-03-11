package com.sample.BoardDAO;

import java.util.List;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.sample.BoardVO.*;

@Repository
public class BoardDAOImple implements BoardDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "boardMapper";
	
	//게시글작성
	@Override
	public void write(BoardVO boardVO) throws Exception {
		sqlSession.insert(namespace+".write", boardVO);		
	}
	
	//게시글 목록 조회
	@Override
	public List<BoardVO> boardList() throws Exception {
		return sqlSession.selectList(namespace+".boardlist");
	}
}
