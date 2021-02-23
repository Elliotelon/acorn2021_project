<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/info.jsp</title>
<jsp:include page="../../include/resource.jsp"></jsp:include>
<jsp:include page="../../include/blogbasic.jsp"></jsp:include>
<style>
	/* 프로필 이미지를 작은 원형으로 만든다 */
	#profileImage{
		width: 50px;
		height: 50px;
		border: 1px solid #cecece;
		border-radius: 50%;
	}
	#con{
		margin-top:5rem;
	}
</style>
</head>
<body>
<div class="container" id="con">
	<table class="table table-striped">
		<colgroup >
			<col width="150"/>
			<col />
		</colgroup>
		<tr>
			<th>아이디</th>
			<td>${sessionScope.id}</td>
		</tr>
		<tr>
			<th>프로필 이미지</th>
			<td>
				<c:choose>
					<c:when test="${empty dto.profile }">
						<svg id="profileImage" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
			  				<path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
						</svg>
					</c:when>
					<c:otherwise>
						<img id="profileImage" 
						src="${pageContext.request.contextPath}${dto.profile}" />
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><a style="color:#5991A8"; href="pwd_updateform.do">수정하기</a></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>${dto.email}</td>
		</tr>
		<tr>
			<th>가입일</th>
			<td>${dto.regdate}</td>
		</tr>
	</table>
	<div class="form-inline mb-5 justify-content-start">	
		<a href="updateform.do">
			<button class="btn btn-success btn-xs" >수정</button>
		</a>
		<a href="javascript:deleteConfirm()">
			<button class="btn btn-danger btn-xs ml-1" >탈퇴</button>
		</a>
	</div>
</div>
<script>
	function deleteConfirm(){
		let isDelete=confirm(" 회원님 탈퇴 하시겠습니까?");
		if(isDelete){
			location.href="${pageContext.request.contextPath}/users/private/delete.do";
		}
	}
</script>
</body>
<jsp:include page="../../include/blogfooter.jsp"></jsp:include>
</html>