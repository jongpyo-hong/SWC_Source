<%@page import="java.util.List"%>
<%@page import="org.zerock.myapp.domain.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>국정감사 게시판 페이지</title>
	<style>
		body {
			font-family: Arial, sans-serif;
			background-color: #f1f1f1;
		}

		h1 {
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
	    #searchForm { display: flex; justify-content: space-between; }
	    .btnBox { text-align: right; }
	    table {
			  border-collapse: collapse;
			  width: 100%;
			}
			
			th, td {
			  border: 1px solid #ddd;
			  padding: 8px;
			  text-align: center;
			}
			
			th {
			  background-color: #f2f2f2;
			}
			
			tr:nth-child(even) {
			  background-color: #f9f9f9;
			}
			
			tr:hover {
			  background-color: #e6e6e6;
			}
			
			td {
			  font-family: Arial, sans-serif;
			  font-size: 14px;
			  color: #333;
			}

	  </style>
</head>
<body>
	<h1>국정감사게시판</h1>
	
	<form action="/myapp/board/list" method="POST">
	    <div style="display:flex;">
	        <dl>
	            <dt>상태 :</dt>
	            <dd>
	                <select id="statusCode" name="statusCode">
	                    <option>선택▽</option>
	                    <option value="0">요청중</option>
	                    <option value="1">담당자지정</option>
	                    <option value="2">처리완료</option>
	                    <option value="3">보류</option>
	                </select>
	            </dd>
	        </dl>
	        <dl>
	            <dt> 제목 :</dt>
	            <dd>
	                <input id="subject" name="subject" type="text" name="title" placeholder="입력">
	            </dd>
	        </dl>
	    </div>
	    <div class="empty">
	    </div>
	    <div class="btnBox">
	        <button type="submit" class="button">조회</button>
	        <a class="button" href="/myapp/board/home">메인페이지</a>
	    </div>    
	</form>
	
	<table class="boardTable">
	    <tr>
	        <th>No.</th>
	        <th>아이디</th>
	        <th>제목</th>
	        <th>내용</th>
	        <th>상태</th>
	    </tr>
	    <% for (BoardVO boardVO :(List<BoardVO>)request.getAttribute("list")){ %>
	    <tr>
	        <td><%= boardVO.getBno() %></td>
	        <td><%= boardVO.getUserId() %></td>
	        <td><%= boardVO.getSubject() %></td>
	        <td><a href="/myapp/board/detail?bno=<%= boardVO.getBno() %>"><%= boardVO.getContent() %></a></td>
	         <td><%= getStatusMessage(boardVO.getStatusCode()) %></td>
	    </tr>
	    <% } %>
	</table>
	    <%!
    private String getStatusMessage(String statusCode) {
        if (statusCode.equals("0")) {
            return "요청중";
        } else if (statusCode.equals("1")) {
            return "담당자지정";
        } else if (statusCode.equals("2")) {
            return "처리완료";
        } else if (statusCode.equals("3")) {
            return "보류";
        }
        return "";
    }
    %>
</body>
</html>
