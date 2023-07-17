<%@page import="java.util.List"%>
<%@page import="org.zerock.myapp.domain.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>국정감사 게시판 상세페이지</title>
	<style>
		body {
			font-family: Arial, sans-serif;
			background-color: #f1f1f1;
			width:100%;
		}

		h3 {
			text-align: center;
			margin-top: 50px;
		}

		dl {
			margin-bottom: 10px;
			margin-left: 10px;
			display: flex;
		}

		dt {
			font-weight: bold;
			margin-bottom: 5px;
		}
		.button {
	        display: inline-block;
	        padding: 8px 16px;
	        border-radius: 4px;
	        background-color: #007bff;
	        color: #fff;
	        text-decoration: none;
	        text-align: center;
	        border: none;
	        cursor: pointer;
	    }
	
	    .button:hover {
	        background-color: #0056b3;
	    }
	    .boardBox { position: relative; margin: 0 auto; width:50%;}

	  </style>
</head>
<body>
	<h3>국정감사 게시판 상세페이지</h1>
	<br>
	<div class="boardBox">
		<dl>
			<dt>아이디:</dt>
			<dd>${board.userId}</dd>
		</dl>
		<dl>
			<dt>이름:</dt>
			<dd>${board.userNm}</dd>
		</dl>
		<dl>
			<dt>부서:</dt>
			<dd>
				<c:choose>
					<c:when test="${board.dept eq 'A001'}">운영부서</c:when>
					<c:when test="${board.dept eq 'B001'}">지원부서</c:when>
					<c:when test="${board.dept eq 'C001'}">인사부서</c:when>
				</c:choose>
			</dd>
		</dl>
		<dl>
			<dt>상태:</dt>
			<dd>
				<c:choose>
					<c:when test="${board.statusCode == '0'}">요청중</c:when>
					<c:when test="${board.statusCode == '1'}">담당자지정</c:when>
					<c:when test="${board.statusCode == '2'}">처리완료</c:when>
					<c:when test="${board.statusCode == '3'}">보류</c:when>
				</c:choose>
			</dd>
		</dl>
		<dl>
			<dt>제목:</dt>
			<dd>${board.subject}</dd>
		</dl>
		<dl>
			<dt>내용:</dt>
			<dd>${board.content}</dd>
		</dl>
		
		<a href="/myapp/board/list" class="button">닫기</a>
	</div>
	
	
	
	
</body>
</html>