<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/private/delete.jsp</title>
</head>
<body>
<script>
	alert("삭제 했습니다.");
	location.href="${pageContext.request.contextPath}/main/notice/list.do";
</script>
</body>
</html>