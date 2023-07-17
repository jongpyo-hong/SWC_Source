package org.zerock.myapp.service;

import java.util.List;

import org.zerock.myapp.domain.BoardVO;

public interface BoardService {
	public List<BoardVO> getList();
	
	public List<BoardVO> getBoardList(BoardVO boardVO);
	
	public BoardVO getDetail(BoardVO boardVO);
}
