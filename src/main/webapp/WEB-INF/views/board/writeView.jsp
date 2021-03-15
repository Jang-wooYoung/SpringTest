<%@page import="com.sample.DataVO.DataVO"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>

<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%
	SimpleDateFormat format1 = new SimpleDateFormat("yyyyMMddHHmmss"); //dataUid	
	
	Calendar time = Calendar.getInstance();
	String mode = "";	
	String dataUid = format1.format(time.getTime());
	
	if(request.getParameter("mode") != null && !"".equals(request.getParameter("mode"))) mode = (String)request.getParameter("mode");
	
	DataVO dataVO = (DataVO)request.getAttribute("dataVO");
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
				<h1> 게시판</h1>
			</header>
			<hr />
			 
			<div>
				<%@include file="nav.jsp" %>
			</div>
			<hr />
			
			<section id="container">
				<form name="writeform" role="form" method="post" action="/board/write">
					<%
						if(mode.equals("update")) {%>
							<input type="hidden" id="dataUid" name="dataUid" value="<%=dataVO.getDataUid() %>" />
							<input type="hidden" id="userNickname" name="UserNickname" value="<%=dataVO.getUserNickname() %>" />
						<%}else {%>
							<input type="hidden" id="dataUid" name="dataUid" value="<%=dataUid %>" />	
						<%}
					%>					
					<table>
						<tbody>
							<%if(mode.equals("update")) {%>
								<tr>
									<td>
										<label for="title">제목</label><input type="text" id="dataTitle" name="dataTitle" value="<%=dataVO.getDataTitle() %>" />
									</td>
								</tr>
								<tr>
									<td>
										<label>작성자</label> <span><%=dataVO.getUserNickname() %></span>
									</td>
								</tr>	
								<tr>
									<td>
										<label for="content">내용</label><textarea id="dataContent" name="dataContent" ><%=dataVO.getDataContent() %></textarea>
									</td>
								</tr>								
							<%}else{ %>
								<tr>
									<td>
										<label for="title">제목</label><input type="text" id="dataTitle" name="dataTitle" />
									</td>
								</tr>
								<tr>
									<td>
										<label for="writer">작성자</label><input type="text" id="userNickname" name="userNickname" />
									</td>
								</tr>	
								<tr>
									<td>
										<label for="content">내용</label><textarea id="dataContent" name="dataContent" ></textarea>
									</td>
								</tr>								
							<%} %>
						</tbody>			
					</table>
					
					<div>
						<%if(mode.equals("update")) {%>
							<button type="button" class="btn_update">수정</button>
						<%}else{ %>
							<button type="submit">작성</button>
						<%} %>
						<button type="button" class="btn_cancel">취소</button>						
					</div>
				</form>
			</section>
			<hr />
		</div>
	</body>
	
	<script>
		$(function() {
			$(".btn_update").on("click", function() {
				var form = document.writeform;
				form.method = "post";
				form.action = "/board/update";
				form.submit();
			});
			
			$(".btn_cancel").on("click", function() {
				location.href = "/board/list";
			});
		});
	</script>
</html>