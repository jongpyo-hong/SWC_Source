package org.zerock.myapp.service;

import org.zerock.myapp.domain.JoinMemberVO;

public interface JoinService {
	public void insert(JoinMemberVO joinMember);
	
	public void update(JoinMemberVO joinMember);
}
