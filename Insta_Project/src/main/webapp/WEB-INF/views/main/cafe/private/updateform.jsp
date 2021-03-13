<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/private/updateform.jsp</title>
<jsp:include page="../../../include/resource.jsp"></jsp:include>
<jsp:include page="../../../include/blogbasic2.jsp"></jsp:include>
</head>
<body>
<div class="container">
	<h1>글 수정 폼 입니다.</h1>
	<form action="update.do" method="post">
		<input type="hidden" name="num" value="${dto.num }" />
		<div class="form-group">
			<label>작성자</label>
			<input class="form-control"type="text" value="${dto.writer }" disabled />
		</div>
		<div class="form-group">
			<label for="title">제목</label>
			<input class="form-control" type="text" name="title" id="title" value="${dto.title }" />
		</div>
		<div class="form-group">
			<label for="content">내용</label>
			<!-- textarea의 아이디는 반드시 content가 되어야 smarteditor 적용가능 -->
			<textarea class="form-control" name="content" id="content">${dto.content }</textarea>
		</div>
		<!-- 클릭했을때 smarteditor의 submitContents(this)함수 실행되도록 설정 -->
		<button type="submit" onclick="submitContents(this);">수정확인</button>
		<button type="reset">취소</button>
	</form>
</div>
<jsp:include page="../../../include/smarteditor.jsp"></jsp:include>
</body>
</html>