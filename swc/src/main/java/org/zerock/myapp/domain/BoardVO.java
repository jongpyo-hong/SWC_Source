package org.zerock.myapp.domain;

import lombok.Data;

@Data
public class BoardVO {
	private int Bno;
	private String userId;
	private String subject;
	private String content;
	private String statusCode;
	private String postTypeCode;
	
}
