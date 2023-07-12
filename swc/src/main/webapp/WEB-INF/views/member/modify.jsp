<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원수정</title>
	<style>
			body {
				font-family: Arial, sans-serif;
			}
	
			h3 {
				margin-bottom: 20px;
				text-align: center;
			}
	
			form {
				width: 400px;
				margin: 0 auto;
			}
	
			table {
				width: 100%;
			}
	
			th {
				text-align: left;
				padding-right: 10px;
			}
	
			td {
				padding-bottom: 10px;
			}
	
			input[type="text"],
			input[type="password"],
			select {
				width: 100%;
				padding: 5px;
				border-radius: 4px;
				border: 1px solid #ccc;
			}
	
			.error-message {
				color: red;
				margin-top: 5px;
				font-size: 12px;
			}
	
			.btn-join {
				margin-top: 20px;
				text-align: center;
			}
	
			.btn-join button {
				margin-right: 10px;
				padding: 5px 10px;
				border-radius: 4px;
				border: none;
				background-color: #007bff;
				color: #fff;
				cursor: pointer;
			}
	
			.btn-join button:hover {
				background-color: #0056b3;
			}
	
			.btn-join button[type="reset"] {
				background-color: #ccc;
				color: #000;
			}
	
			.btn-join button[type="reset"]:hover {
				background-color: #999;
			}
		</style>
</head>
<body>



	<h3>회원수정 페이지</h3>
	<form action="/myapp/member/modify" method="post">
		<table>
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" name="userId" id="userId" size="20" readonly value="${userId}" />
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>
					<input type="text" name="userNm" id="userNm" size="20" />
				</td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<select id="gender" name="gender">
						<option value="m">남</option>
						<option value="f">여</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>권한</th>
				<td>
					<select id="authCode" name="authCode">
						<option value="01">자료요청자</option>
						<option value="02">부서책임자</option>
						<option value="03">부서담당자</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>부서</th>
				<td>
					<select id="dept" name="dept">
						<option value="A001">운영부서</option>
						<option value="B001">지원부서</option>
						<option value="C001">인사부서</option>
					</select>
				</td>
			</tr>
		</table>
		<div class="btn-join">
			<button type="submit">수정</button>
			<button type="reset">취소</button>
		</div>
	</form>
</body>
</html>