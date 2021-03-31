<%@page import="com.sample.BoardVO.CommentVO"%>
<%@page import="java.util.List"%>
<%@page import="com.sample.DataVO.DataVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int currentPage = 1;
	int rowCount = 5;
	int blockPage = 5;
	String searchType = "";
	String keyword = "";
	
	if(request.getParameter("currentPage") != null && !"".equals(request.getParameter("currentPage"))) currentPage = Integer.valueOf(request.getParameter("currentPage"));
	if(request.getParameter("rowCount") != null && !"".equals(request.getParameter("rowCount"))) rowCount = Integer.valueOf(request.getParameter("rowCount"));
	if(request.getParameter("blockPage") != null && !"".equals(request.getParameter("blockPage"))) blockPage = Integer.valueOf(request.getParameter("blockPage"));
	if(request.getParameter("searchType") != null && !"".equals(request.getParameter("searchType"))) searchType = (String)request.getParameter("searchType");
	if(request.getParameter("keyword") != null && !"".equals(request.getParameter("keyword"))) keyword = (String)request.getParameter("keyword");
	
	DataVO dataVO = (DataVO)request.getAttribute("detail");
	List<CommentVO> commentList = (List<CommentVO>)request.getAttribute("commentlist");
	
	String pagemoveOption = "rowCount="+rowCount+"&blockPage="+blockPage+"&searchType="+searchType+"&keyword="+keyword;
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
			
			<div id="comment">
				<ol class="commentList">
					<%
						if(commentList != null && commentList.size() > 0) {
							for(CommentVO commentVO : commentList) {%>
								<li>
									<p>
										작성자 : <%=commentVO.getUserNickname() %><br />
										작성일자 : <%=commentVO.getRegDate() %>										
									</p>
									<p><%=commentVO.getCommentContent() %></p>
								</li>
							<%}
						}
					%>
				</ol>
			</div>
			
			<form name="commentForm" method="post">
				<input type="hidden" id="dataUid" name="dataUid" value="<%=dataVO.getDataUid() %>" />
				<input type="hidden" id="currentPage" name="currentPage" value="<%=currentPage %>"/>
				<input type="hidden" id="rowCount" name="rowCount" value="<%=rowCount %>" />
				<input type="hidden" id="blockPage" name="blockPage" value="<%=blockPage %>" />
				<input type="hidden" id="searchType" name="searchType" value="<%=searchType %>" />
				<input type="hidden" id="keyword" name="keyword" value="<%=keyword %>" />
				
				<div>
					<label for="userNickname">댓글작성자</label>
					<input type="text" id="userNickname" name="userNickname" />
					<br />
					<label for="commentContent">댓글내용</label>
					<input type="text" id="commentContent" name="commentContent" />
				</div>
				
				<div>
					<button type="button" class="commentWrite">작성</button>
				</div>
			</form>
			
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
			
			$(".commentWrite").on("click", function() {
				var form = document.commentForm;
				form.action = "/board/commentWrite";
				form.submit();
			});
		});
	</script>
</html>