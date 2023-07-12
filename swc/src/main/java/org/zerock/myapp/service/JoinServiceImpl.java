package org.zerock.myapp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.myapp.domain.JoinMemberVO;
import org.zerock.myapp.mapper.JoinMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Service
@AllArgsConstructor
public class JoinServiceImpl implements JoinService{
	
	@Setter(onMethod_=@Autowired)
	private JoinMapper joinMapper;
	
	@Override
	public void insert(JoinMemberVO joinMember) {
		// TODO Auto-generated method stub
		joinMapper.insertUser(joinMember);
	}
	
	@Override
	public void update(JoinMemberVO joinMember) {
		// TODO Auto-generated method stub
		joinMapper.updateUser(joinMember);
	}
	
}
