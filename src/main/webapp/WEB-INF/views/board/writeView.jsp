<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>

<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%
	SimpleDateFormat format1 = new SimpleDateFormat("yyyyMMddHHmmss"); //dataUid	
	
	Calendar time = Calendar.getInstance();
	String dataUid = format1.format(time.getTime());	
%>
<!DOCTYPE html>
<html>
	<head>
	 	<title>게시판</title>
	</head>
	<body>
	
		<div id="root">
			<header>
				<h1> 게시판</h1>
			</header>
			<hr />
			 
			<nav>
			  홈 - 글 작성
			</nav>
			<hr />
			
			<section id="container">
				<form role="form" method="post" action="/board/write">
					<input type="hidden" id="dataUid" name="dataUid" value="<%=dataUid %>" />
					<table>
						<tbody>
							<tr>
								<td>
									<label for="title">제목</label><input type="text" id="dataTitle" name="dataTitle" />
								</td>
							</tr>	
							<tr>
								<td>
									<label for="content">내용</label><textarea id="dataContent" name="dataContent" ></textarea>
								</td>
							</tr>
							<tr>
								<td>
									<label for="writer">작성자</label><input type="text" id="userNickname" name="userNickname" />
								</td>
							<tr>
								<td>						
									<button type="submit">작성</button>
								</td>
							</tr>			
						</tbody>			
					</table>
				</form>
			</section>
			<hr />
		</div>
	</body>
</html>