<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/signup.jsp</title>
</head>
<body>
<div class="container">
	<h1>알림</h1>
	<p> <strong>${requestScope.dto.id}</strong> 님 회원 가입 되었습니다. <a href="${pageContext.request.contextPath}/users/loginform.do">로그인 하러 가기</a></p>
</div>
</body>
</html>
