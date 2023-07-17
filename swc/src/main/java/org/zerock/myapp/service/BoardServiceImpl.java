package org.zerock.myapp.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.myapp.domain.BoardVO;
import org.zerock.myapp.mapper.BoardMapper;
import org.zerock.myapp.mapper.JoinMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Setter(onMethod_=@Autowired)
	private BoardMapper mapper;
	
	@Override
	public List<BoardVO> getList() {
		// TODO Auto-generated method stub
		System.out.println("111111111");
		List<BoardVO> lists = mapper.getList();
		System.out.println("222222222");
		System.out.println(lists);

		return lists;
	}
	
	@Override
	public List<BoardVO> getBoardList(BoardVO boardVO) {
		// TODO Auto-generated method stub
		
		List<BoardVO> lists = mapper.getBoardList(boardVO);
		System.out.println(lists);
		return lists;
	}
	
	@Override
	public BoardVO getDetail(BoardVO boardVO) {
		// TODO Auto-generated method stub
		
		int bno = boardVO.getBno();
		BoardVO vo = this.mapper.getDetail(bno);
		return vo;
	}

}
