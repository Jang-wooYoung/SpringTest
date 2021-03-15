<%@page import="com.sample.DataVO.DataVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int currentPage = 1;
	int rowCount = 5;
	int blockPage = 5;
	
	if(request.getParameter("currentPage") != null && !"".equals(request.getParameter("currentPage"))) currentPage = Integer.valueOf(request.getParameter("currentPage"));
	if(request.getParameter("rowCount") != null && !"".equals(request.getParameter("rowCount"))) rowCount = Integer.valueOf(request.getParameter("rowCount"));
	if(request.getParameter("blockPage") != null && !"".equals(request.getParameter("blockPage"))) blockPage = Integer.valueOf(request.getParameter("blockPage"));
	
	DataVO dataVO = (DataVO)request.getAttribute("detail");
	
	String pagemoveOption = "currentPage="+currentPage+"&rowCount="+rowCount+"&blockPage="+blockPage;
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
		</div>
		<hr />
		
		<div>
			<%@include file="nav.jsp" %>
		</div>
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
			
			<div>
				<button type="button" class="btn_update">수정</button>
				<button type="button" class="btn_delete">삭제</button>
				<button type="button" class="btn_list">목록</button>
			</div>
		</section>
	</body>
		
	<script>
		$(function() {
			$(".btn_update").on("click", function(){
				location.href = "/board/writeView?dataUid=<%=dataVO.getDataUid()%>&mode=update";
			});
			
			$(".btn_delete").on("click", function(){
				var deletecheck = confirm("삭제를 하시겠습니까?");
				if(deletecheck == true) {
					location.href = "/board/delete?dataUid=<%=dataVO.getDataUid()%>";	
				}else {
					return false;
				}
			});
			
			$(".btn_list").on("click", function(){
				location.href = "/board/list?<%=pagemoveOption%>";
			});
		});
	</script>
</html>