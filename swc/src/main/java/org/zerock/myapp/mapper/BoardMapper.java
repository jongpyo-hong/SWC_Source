package org.zerock.myapp.mapper;

import java.util.List;

import org.zerock.myapp.domain.BoardVO;

public interface BoardMapper {
	
	public List<BoardVO> getList();
	
	public List<BoardVO> getBoardList(BoardVO boardVO);
	
	public BoardVO getDetail(int bno);
}
