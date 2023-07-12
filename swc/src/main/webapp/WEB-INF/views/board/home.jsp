<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>국정감사 게시판</title>
	<style>
		body {
			font-family: Arial, sans-serif;
			background-color: #f1f1f1;
		}

		h1 {
			text-align: center;
			margin-top: 50px;
		}
		a { border: none; }
		
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
			color: #000;
		}

		button[type="submit"]:last-of-type:hover {
			background-color: #999;
		}

		.actions {
			display: inline;
			margin-top: 10px;
		}

		.btnJoin {
			background-color: #007bff;
			color: #fff;
			border: none;
			border-radius: 4px;
		}
		.head, .body { border: 1px solid }
		.body { height: 800px; }
		.headBtn { text-align: right; margin-right: 10px; }
		span { margin-left:40%; font-size: large; }
	</style>
</head>
<body>

	<div class="head">
		<form>
			<span id="user" name="user">
                <c:choose>
                    <c:when test="${authCode eq '01'}">자료요청자</c:when>
                    <c:when test="${authCode eq '02'}">부서책임자</c:when>
                    <c:when test="${authCode eq '03'}">부서담당자</c:when>
                </c:choose>님 (${userId}) 환영합니다.
            </span>
            <br>
            <br>
            <div class="headBtn">
            	<a href="/myapp/member/modify" class="button">회원정보 수정</a>
            	<a href="/myapp/board/logout" class="button">로그아웃</a>
            </div>
		</form>
	</div>
	<br>
	<div class="body">
        <c:choose>
            <c:when test="${authCode eq '01' or authCode eq '03'}">
                <a href="/myapp/board/list" class="button">국정감사게시판</a>
            </c:when>
            <c:when test="${authCode eq '02'}">
                <a href="/myapp/board/list" class="button">국정감사게시판</a>
                <a href="#" class="button">국정감사 관리게시판</a>
            </c:when>
        </c:choose>
    </div>
</body>

</html>