<%@page import="com.sample.BoardVO.BoardVO"%>
<%@page import="com.sample.DataVO.DataVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	int currentPage = 1;
	int rowCount = 5;
	int blockPage = 5;
		
	if(request.getParameter("currentPage") != null && !"".equals(request.getParameter("currentPage"))) currentPage = Integer.valueOf(request.getParameter("currentPage"));
	if(request.getParameter("rowCount") != null && !"".equals(request.getParameter("rowCount"))) rowCount = Integer.valueOf(request.getParameter("rowCount"));
	if(request.getParameter("blockPage") != null && !"".equals(request.getParameter("blockPage"))) blockPage = Integer.valueOf(request.getParameter("blockPage"));
	
	List<DataVO> dataList = (List<DataVO>)request.getAttribute("dataList");
	BoardVO boardVO = (BoardVO)request.getAttribute("boardVO");
	
	int totalCount = boardVO.getTotalCount();
	
	String pagemoveOption = "&rowCount="+rowCount+"&blockPage="+blockPage;
%>
<!DOCTYPE html>
<html>
	<head>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<title>게시판</title>
		
		<style type="text/css">
			li {list-style: none; float: left; padding: 6px;}
		</style>
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
				<table>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>등록일</th>
					</tr>
					<%
						if(dataList != null && dataList.size() > 0) {
							int numCount = 1;
							for(DataVO dataVO : dataList) {
								int number = (int)totalCount - (currentPage - 1) * rowCount - numCount+1; 
					%>
								<tr>
									<td><%=number %></td>
									<td><a href="/board/View?dataUid=<%=dataVO.getDataUid()%>&currentPage=<%=currentPage%><%=pagemoveOption%>"><%=dataVO.getDataTitle() %></a></td>
									<td><%=dataVO.getUserNickname() %></td>
									<td><%=dataVO.getRegDate() %></td>
								</tr>
							<%
							numCount++;
							}
						}
					%>
				</table>
				
				<div>
					<button type="button" class="btn_write">글등록</button>
				</div>
				<div>
					<!-- 페이징 -->
					<%
						blockPage = boardVO.getBlockPage();
						int startBlockPage = boardVO.getStartPage();
						int endBlockPage = boardVO.getEndPage();
						int totalPage = boardVO.getTotalPage();
						int tempstartPage = 0;
						
						if(totalPage > blockPage) {
							tempstartPage = (int)Math.floor( (double)(currentPage - 1)/blockPage ) * blockPage + 1;
						}else {
							tempstartPage = 1;
						}
						
					%>
					<ul>
						<%if(currentPage - 1 > 0 && currentPage > 0) {%>
							<li><a href="/board/list?currentPage=1&rowCount=<%=rowCount%>&blockPage=<%=blockPage%>">처음</a>
							<li><a href="/board/list?currentPage=<%=currentPage-1%>&rowCount=<%=rowCount %>&blockPage=<%=blockPage%>">이전</a></li>	
						<%}%>
						<%
							int p, q;
							for(p=0,q=0; q<totalPage && p < blockPage; p++) {
								q = tempstartPage + p;
							%>
							<li><a href="/board/list?currentPage=<%=q%><%=pagemoveOption%>"><%=q %></a></li>
							<%
							}
						%>
						<%if(currentPage<totalPage) {%>
							<li><a href="/board/list?currentPage=<%=currentPage+1%><%=pagemoveOption%>">다음</a></li>
							<li><a href="/board/list?currentPage=<%=totalPage%><%=pagemoveOption%>">끝</a></li>
						<%}%>
					</ul>
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