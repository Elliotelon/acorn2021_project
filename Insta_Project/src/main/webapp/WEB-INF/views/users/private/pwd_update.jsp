<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/private/pwd_update.jsp</title>
</head>
<body>
<div class="container">
	<c:choose>
		<c:when test="${isSuccess}"> <!-- ModelAndView에 담긴건 requestScope에 담김 -->
			<script>
				alert("비밀번호가 변경되었습니다.");
				location.href="../loginform.do";
			</script>
			
		</c:when>
		<c:otherwise>
			<script>
				alert("이전 비밀번호가 일치하지 않습니다.")
				location.href="pwd_updateform.do";
			</script>
		</c:otherwise>
	</c:choose>
</div>
</body>
</html>