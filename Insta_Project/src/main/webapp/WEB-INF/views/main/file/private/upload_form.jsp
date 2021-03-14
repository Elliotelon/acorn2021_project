<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/file/private/upload_form.jsp</title>
<jsp:include page="../../../include/resource.jsp"></jsp:include>
<jsp:include page="../../../include/blogbasic.jsp"></jsp:include>
<style>
	.form-group{
		width:10rem;
	}
	#con{
		margin-top:10rem;
	}
</style>
</head>
<body>
<div class="container" id="con">
	<%--
		[ 파일 업로드 폼 작성법 ]
		1. method="post"
		2. 폼에 enctype="multipart/form-data" 속성 추가
		3. <input type="file" /> 을 이용한다.  
	 --%>
	<form action="upload.do" method="post" enctype="multipart/form-data">
		<div class="form-group">
			<label for="title">제목(설명)</label>
			<input class="form-control" type="text" name="title" id="title"/>
		</div>
		<div class="form-group">
			<label for="myFile">첨부 파일</label>
			<input type="file" name="myFile" id="myFile"/>
		</div>
		<div class="form-inline mb-5 justify-content-start">
			<button class="btn btn-success btn-xs" type="submit">업로드</button>
		</div>
	</form>
</div>
</body>
<jsp:include page="../../../include/blogfooter.jsp"></jsp:include>
</html>