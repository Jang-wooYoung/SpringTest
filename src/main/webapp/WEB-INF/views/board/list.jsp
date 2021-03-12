<%@page import="com.sample.DataVO.DataVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	List<DataVO> dataList = (List<DataVO>)request.getAttribute("dataList");
%>
<!DOCTYPE html>
<html>
	<head>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
				
				<div>
					<button type="button" class="btn_write">글등록</button>
				</div>
			</section>
		</div>
	</body>
	<script type="text/javascript">
		$(function() {
			$(".btn_write").on("click", function() {
				location.href = "/board/writeView";
			});
		});
	</script>
</html>