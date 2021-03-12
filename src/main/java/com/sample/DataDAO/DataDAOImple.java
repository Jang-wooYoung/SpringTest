package com.sample.DataDAO;

import java.util.List;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.sample.DataVO.*;

@Repository
public class DataDAOImple implements DataDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "boardMapper";
	
	//게시글작성
	@Override
	public void write(DataVO dataVO) throws Exception {
		sqlSession.insert(namespace+".write", dataVO);		
	}
	
	//게시글수정
	@Override
	public void update(DataVO dataVO) throws Exception {
		sqlSession.update(namespace+".update", dataVO);
	}
	
	//게시글삭제
	@Override
	public void delete(String dataUid) throws Exception {
		sqlSession.delete(namespace+".delete", dataUid);
	}
	
	//게시글 목록 조회
	@Override
	public List<DataVO> dataList() throws Exception {
		return sqlSession.selectList(namespace+".datalist");
	}
	
	//게시글 상세보기
	@Override
	public DataVO detail(String dataUid) throws Exception {
		return sqlSession.selectOne(namespace+".detail", dataUid);
	}
}
