<%@page import="com.sample.DataVO.DataVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	List<DataVO> dataList = (List<DataVO>)request.getAttribute("dataList");
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
		<hr />
		
		<nav>홈 - 글 작성</nav>
		<hr />
		
		<section id="container">
			<table>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>등록일</th>
				</tr>
				<%
					if(dataList != null && dataList.size() > 0) {
								int number = 1;
								for(DataVO dataVO : dataList) {
				%>
							<tr>
								<td><%=number %></td>
								<td><a href="/board/View?dataUid=<%=dataVO.getDataUid()%>"><%=dataVO.getDataTitle() %></a></td>
								<td><%=dataVO.getUserNickname() %></td>
								<td><%=dataVO.getRegDate() %></td>
							</tr>
						<%
						number++;
						}
					}
				%>
			</table>
		</section>
	</div>
</body>
</html>