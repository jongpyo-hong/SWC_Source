<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<!DOCTYPE html>
<html>
<head>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
	<script>
		$(document).ready(function() {
			// 아이디 필드에 이메일 형식 유효성 검사
			$("#userId").on("input", function() {
				var email = $(this).val();
				var emailRegex = /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/;
				var errorSpan = $("#emailError");

				if (!emailRegex.test(email)) {
					$(this).css("border", "2px solid red");
					errorSpan.text("아이디는 이메일 형식이어야 합니다.").show();
				} else {
					$(this).css("border", "1px solid #ccc");
					errorSpan.hide();
				}
			});
			
			// 중복확인 버튼 클릭 시 아이디 중복 검사
		    $("input[name='btnOverlapped']").click(function() {
		        var email = $("#userId").val();
		        var errorSpan = $("#emailError");

		        // 이메일 형식 유효성 검사
		        var emailRegex = /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/;
		        if (!emailRegex.test(email)) {
		            $("#userId").css("border", "2px solid red");
		            errorSpan.text("아이디는 이메일 형식이어야 합니다.").show();
		            return;
		        }

		        // 중복 검사를 수행하는 Ajax 요청
		        $.ajax({
		            url: "/myapp/member/checkEmailDuplicate",
		            type: "POST",
		            data: { email: email },
		            success: function(response) {
		                if (response.duplicated) {
		                    $("#userId").css("border", "2px solid red");
		                    errorSpan.text("이미 사용 중인 아이디입니다.").show();
		                } else {
		                    $("#userId").css("border", "1px solid #ccc");
		                    errorSpan.hide();
		                }
		            },
		            error: function() {
		                // 오류 처리
		                console.error("아이디 중복 검사 요청 실패");
		            }
		        });
		    });

			// 비밀번호 필드 길이 유효성 검사
			$("#userPw").on("input", function() {
				var password = $(this).val();
				if (password.length < 8) {
					$(this).css("border", "2px solid red");
				} else {
					$(this).css("border", "1px solid #ccc");
				}
			});
			
			// 비밀번호 확인 필드 체크
			$("#userPwRe").on("input", function() {
				var password = $("#userPw").val();
				var confirmPassword = $(this).val();
				var errorSpan = $("#passwordError");

				if (password !== confirmPassword) {
					$(this).css("border", "2px solid red");
					errorSpan.text("비밀번호가 일치하지 않습니다.").show();
				} else {
					$(this).css("border", "1px solid #ccc");
					errorSpan.hide();
				}
			});
			
			
		});
	</script>
</head>
<body>
	<h3>회원가입 페이지</h3>
	<form action="/myapp/member/join" method="post">
		<table>
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" name="userId" id="userId" size="20" />
					<input type="button" name="btnOverlapped" value="중복확인" />
					<span id="emailError" class="error-message">아이디는 이메일 형식이어야 합니다.</span>
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<input type="password" name="userPw" id="userPw" size="20" placeholder="비밀번호를 입력해주세요." />
				</td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td>
					<input type="password" name="userPwRe" id="userPwRe" size="20" placeholder="비밀번호를 확인해주세요." />
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
			<button type="submit">등록</button>
			<button type="reset">취소</button>
		</div>
	</form>
</body>
</html>