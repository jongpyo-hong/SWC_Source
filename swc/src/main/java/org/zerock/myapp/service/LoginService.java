package org.zerock.myapp.service;

import org.zerock.myapp.domain.JoinMemberVO;

public interface LoginService {
	public JoinMemberVO authenticate(JoinMemberVO memberVO);
}
