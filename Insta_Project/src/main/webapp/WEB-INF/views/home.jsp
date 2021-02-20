<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/home.jsp</title>
<jsp:include page="include/resource.jsp"></jsp:include>
</head>
<body>
<jsp:include page="include/navbar.jsp"></jsp:include>
<div class="container">
	<h1>인덱스 페이지 입니다.</h1>
	<ul>
		<li><a href="users/signup_form.do">회원가입</a></li>
		<li><a href="cafe/private/insertform.do">카페 글쓰러 가기</a></li>
		<li><a href="file/private/uploadform.do">파일 업로드 하러 가기</a></li>
	</ul>
</div>
</body>
</html>