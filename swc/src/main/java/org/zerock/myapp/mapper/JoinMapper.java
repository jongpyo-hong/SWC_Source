package org.zerock.myapp.mapper;


import org.zerock.myapp.domain.JoinMemberVO;

public interface JoinMapper {
//	@Insert("	insert into USER_MSTR (userId, userPw, userNm, gender, authCode, dept) 	values (#{userId}, #{userPw}, #{userNm}, #{gender}, #{authCode}, #{dept})"
//			) 
	public void insertUser(JoinMemberVO member);
	
	public void updateUser(JoinMemberVO member);
}
