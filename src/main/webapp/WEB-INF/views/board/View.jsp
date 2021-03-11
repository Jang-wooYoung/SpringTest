<%@page import="com.sample.DataVO.DataVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	DataVO dataVO = (DataVO)request.getAttribute("detail");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
</head>
<body>
	<div id="root">
		<header>
			<h1>게시판</h1>
		</header>
	</div>
	<hr />
	
	<nav>홈 - 글작성</nav>
	<hr />
	
	<section id="container">
		<table>
			<tbody>
				<tr>
					<td><label>제목</label> <span><%=dataVO.getDataTitle() %></span></td>
				</tr>
				<tr>
					<td><label>작성자</label> <span><%=dataVO.getUserNickname() %></span></td>
				</tr>
				<tr>
					<td><label>작성일</label> <span><%=dataVO.getRegDate() %></span></td>
				</tr>
				<tr>
					<td><label>내용</label> <span><%=dataVO.getDataContent() %></span></td>
				</tr>
			</tbody>
		</table>
	</section>
</body>
</html>