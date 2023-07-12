package org.zerock.myapp.domain;

import lombok.Data;

@Data
public class JoinMemberVO {
	private String userId;
	private String userPw;
//	private String userPwRe;
	private String userNm;
	private String gender;
	private String authCode;
	private String dept;
}
