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

		.form {
			width: 300px;
			margin: 0 auto;
			background-color: #fff;
			border: 1px solid #ccc;
			padding: 20px;
			border-radius: 4px;
			box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
		}

		dl {
			margin-bottom: 10px;
		}

		dt {
			font-weight: bold;
			margin-bottom: 5px;
		}


		input[type="text"],
		input[type="password"] {
			width: 100%;
			padding: 5px;
			border-radius: 4px;
			border: 1px solid #ccc;
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

		button[type="submit"]:last-of-type {
			background-color: #ccc;
			color: white;
		}

		button[type="submit"]:last-of-type:hover {
			background-color: #999;
		}

		.actions {
			display: inline;
			margin-top: 10px;
		}
		.actions button { color: #ddd; }

		.btnJoin {
			background-color: #007bff;
			color: #fff;
			border: none;
			border-radius: 4px;
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
	</style>
</head>
<body>
	<h1>국정감사 게시판 로그인 페이지</h1>

	<div class="form">
		<form method="post" action="/myapp/member/login">
			<dl>
				<dt>아이디:</dt>
				<dd><input type="text" id="userId" name="userId" placeholder="아이디를 입력하세요."></dd>
			</dl>
			<dl>
				<dt>비밀번호:</dt>
				<dd><input type="password" id="userPw" name="userPw" placeholder="비밀번호를 입력하세요."></dd>
			</dl>
			<div class="actions">
				<button type="submit">로그인</button>
				<a href="/myapp/member/join" class="button">회원가입</a>
			</div>
		</form>
	
	</div>
</body>
</html>