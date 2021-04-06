package com.sample.DataDAO;

import java.util.List;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.sample.BoardVO.BoardVO;
import com.sample.BoardVO.CommentVO;
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
	public List<DataVO> dataList(BoardVO boardVO) throws Exception {
		return sqlSession.selectList(namespace+".datalist", boardVO);
	}
	
	//게시글 상세보기
	@Override
	public DataVO detail(String dataUid) throws Exception {
		return sqlSession.selectOne(namespace+".detail", dataUid);
	}
	
	//게시글 총개수
	@Override
	public int listCount(BoardVO boardVO) throws Exception {
		return sqlSession.selectOne(namespace+".listCount", boardVO);
	}
	
	//게시글 댓글 리스트
	@Override
	public List<CommentVO> commentList(String dataUid) throws Exception {
		return sqlSession.selectList(namespace+".commentlist", dataUid);
	}
	
	//게시글 댓글 작성
	@Override
	public void commentwrite(CommentVO commentVO) throws Exception {
		sqlSession.insert(namespace+".commentwrite",commentVO);
	}
	
	//게시글 댓글 수정
	@Override
	public void commentupdate(CommentVO commentVO) throws Exception {
		sqlSession.update(namespace+".commentupdate", commentVO);
	}
	
	//게시글 댓글 삭제
	@Override
	public void commentdelete(String commentUid) throws Exception {
		sqlSession.delete(namespace+".commentdelete", commentUid);
	}
	
	//게시글 댓글 상세보기
	@Override
	public CommentVO commentdetail(String commentUid) throws Exception {
		return sqlSession.selectOne(namespace+".commentdetail", commentUid);
	}
}
