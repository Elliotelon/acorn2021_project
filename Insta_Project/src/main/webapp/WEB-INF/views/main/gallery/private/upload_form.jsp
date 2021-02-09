<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/gallery/private/upload_form.jsp</title>
</head>
<body>
<div class="container">
	<h1>이미지 업로드 폼</h1>
	<form action="upload.do" method="post" enctype="multipart/form-data">
		<div>
			<label for="caption">설명</label>
			<input type="text" name="caption" id="caption"/>
		</div>
		<div>
			<label for="image">이미지</label>
			<input type="file" name="image" id="image"
				accept=".jpg, .jpeg, .png, .JPG, .JPEG"/>
		</div>
		<button type="submit">업로드</button>
	</form>
</div>
</body>
</html>