package org.zerock.myapp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.myapp.domain.JoinMemberVO;
import org.zerock.myapp.mapper.LoginMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Service
@AllArgsConstructor
public class LoginServiceImpl implements LoginService {
	
		@Setter(onMethod_=@Autowired)
		private LoginMapper mapper;
	
		@Override
		public JoinMemberVO authenticate(JoinMemberVO memberVO) {
		// TODO Auto-generated method stub
			String getUserId = memberVO.getUserId();
			String getUserPw = memberVO.getUserPw();
			
			JoinMemberVO vo = this.mapper.authenticate(memberVO);
			String getDbId = vo.getUserId();
			String getDbPw = vo.getUserPw();
			if (getUserId.equals(getDbId) && getUserPw.equals(getDbPw)) {
				return vo;
			} 
			return null;
		}
}
