<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>국정감사 게시판 로그인 페이지</title>
	<style>
		body {
			font-family: Arial, sans-serif;
			background-color: #f1f1f1;
		}

		h1 {
			text-align: center;
			margin-top: 50px;
		}

		.container {
			width: 300px;
			margin: 0 auto;
			background-color: #fff;
			border: 1px solid #ccc;
			padding: 20px;
			border-radius: 4px;
			box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
		}

		button[type="submit"] {
			padding: 8px 16px;
			border-radius: 4px;
			border: none;
			background-color: #007bff;
			color: #fff;
			cursor: pointer;
		}

		button[type="submit"]:hover {
			background-color: #0056b3;
		}

		.actions {
			display: flex;
			justify-content: space-between;
			margin-top: 10px;
		}
	</style>
</head>
<body>
	<h1>국정감사 게시판 페이지</h1>

	<div class="container">
		<div class="actions">
			<form method="get" action="/myapp/member/login">
				<button type="submit">로그인</button>
			</form>
			<form method="get" action="/myapp/member/join">
				<button type="submit">회원가입</button>
			</form>
		</div>
	</div>
</body>
</html>