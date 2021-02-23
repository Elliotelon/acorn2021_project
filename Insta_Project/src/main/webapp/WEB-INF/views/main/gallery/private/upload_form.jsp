<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/gallery/private/upload_form.jsp</title>
<jsp:include page="../../../include/resource.jsp"></jsp:include>
<jsp:include page="../../../include/blogbasic.jsp"></jsp:include>
<style>
	.form-group{
		width:20rem;
	}
</style>
</head>
<body>
<div class="container">
	<h1>이미지 업로드 폼</h1>
	<form action="upload.do" method="post" enctype="multipart/form-data">
		<div class="form-group">
			<label for="caption">설명</label>
			<input class="form-control" type="text" name="caption" id="caption"/>
		</div>
		<div>
			<label for="image">이미지</label>
			<input type="file" name="image" id="image"
				accept=".jpg, .jpeg, .png, .JPG, .JPEG"/>
		</div>
		<div class="form-inline mb-5 justify-content-start">
			<button class="btn btn-success btn-xs">등록</button>
		</div>
	</form>
</div>
</body>
<jsp:include page="../../../include/blogfooter.jsp"></jsp:include>
</html>