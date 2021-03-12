<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<title>메인</title>
	</head>
	<body>
	<h1>mainPage</h1>
	<button type="button" class="btn_notice_move">게시판</button><br />	
	</body>
	<script>
		$(function() {
			$(".btn_notice_move").on("click", function() {
				location.href="/board/list";
			});
		});
	</script>
</html>