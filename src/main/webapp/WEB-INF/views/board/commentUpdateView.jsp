<%@page import="com.sample.BoardVO.CommentVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int currentPage = 1;
	int rowCount = 5;
	int blockPage = 5;
	String dataUid = "";
	String searchType = "";
	String keyword = "";
	
	if(request.getParameter("dataUid") != null && !"".equals(request.getParameter("dataUid"))) dataUid = (String)request.getParameter("dataUid");
	if(request.getParameter("currentPage") != null && !"".equals(request.getParameter("currentPage"))) currentPage = Integer.valueOf(request.getParameter("currentPage"));
	if(request.getParameter("rowCount") != null && !"".equals(request.getParameter("rowCount"))) rowCount = Integer.valueOf(request.getParameter("rowCount"));
	if(request.getParameter("blockPage") != null && !"".equals(request.getParameter("blockPage"))) blockPage = Integer.valueOf(request.getParameter("blockPage"));
	if(request.getParameter("searchType") != null && !"".equals(request.getParameter("searchType"))) searchType = (String)request.getParameter("searchType");
	if(request.getParameter("keyword") != null && !"".equals(request.getParameter("keyword"))) keyword = (String)request.getParameter("keyword");
	
	CommentVO commentVO = (CommentVO)request.getAttribute("CommentVO");
%>
<!DOCTYPE html>
<html>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script>
		$(function() {
			$(".btn_cancel").on("click",function(){
				var form = document.CommentupdateForm;
				form.method = "get";
				form.action = "/board/View";
				form.submit();
			});
		});
 	</script>
	
	<head>		
		<title>게시판</title>
	</head>
	<body>
		<div id="root">
			<header>
				<h1>게시판</h1>
			</header>
			<hr />
			
			<div>
				<%@include file="nav.jsp" %>
			</div>
			<hr />
			
			<section id="container">
				<form name="CommentupdateForm" method="post" action="/board/commentupdateAction">
					<input type="hidden" id="dataUid" name="dataUid" value="<%=dataUid%>" />					
					<input type="hidden" id="currentPage" name="currentPage" value="<%=currentPage %>" />
					<input type="hidden" id="rowCount" name="rowCount" value="<%=rowCount %>" />
					<input type="hidden" id="blockPage" name="blockPage" value="<%=blockPage %>" />
					<input type="hidden" id="searchType" name="searchType" value="<%=searchType %>" />
					<input type="hidden" id="keyword" name="keyword" value="<%=keyword %>" />
					
					<input type="hidden" id="commentUid" name="commentUid" value="<%=commentVO.getCommentUid() %>" />					
					
					<table>
						<tbody>
							<tr>
								<td>
									<label for="commentContent">내용</label>
									<input type="text" name="commentContent" value="<%=commentVO.getCommentContent() %>" />
								</td>
							</tr>
						</tbody>
					</table>
					<div>
						<button class="btn_update" type="submit">저장</button>
						<button class="btn_cancel" type="button">취소</button>
					</div>
				</form>
			</section>
		</div>
	</body>
</html>