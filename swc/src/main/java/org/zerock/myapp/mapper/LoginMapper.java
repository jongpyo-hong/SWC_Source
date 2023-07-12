package org.zerock.myapp.mapper;

import org.zerock.myapp.domain.JoinMemberVO;

public interface LoginMapper {
	
	public JoinMemberVO authenticate(JoinMemberVO memberVO);
}
