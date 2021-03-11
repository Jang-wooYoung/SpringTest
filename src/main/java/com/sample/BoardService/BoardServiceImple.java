package com.sample.BoardService;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.sample.BoardDAO.*;
import com.sample.BoardVO.*;

@Service
public class BoardServiceImple implements BoardService{

	@Inject
	private BoardDAO dao;
	
	@Override
	public void write(BoardVO boardVO) throws Exception {
		dao.write(boardVO);		
	}
}
