package com.sample.BoardDAO;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.sample.BoardVO.*;

@Repository
public class BoardDAOImple implements BoardDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "boardMapper";
	
	@Override
	public void write(BoardVO boardVO) throws Exception {
		sqlSession.insert(namespace+".write", boardVO);		
	}
}
