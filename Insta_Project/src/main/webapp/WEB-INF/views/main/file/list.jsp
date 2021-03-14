<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/file/list.do</title>
<jsp:include page="../../include/resource.jsp"></jsp:include>
<jsp:include page="../../include/blogbasic.jsp"></jsp:include>
<style>
	#con{
		margin-top:10rem;
	}
</style>
</head>
<body>
<div class="container" id="con">
	<%-- 만일 검색 키워드가 존재한다면 몇개의 글이 검색 되었는지 알려준다. --%>
	<c:if test="${not empty keyword}">
		<div class="alert alert-info" style="width:275px">
			<strong>${totalRow}</strong> 개의 자료가 검색 되었습니다.
		</div>
	</c:if>
	<table class="table table-hover table-sm">
		<thead class="thead-dark">
			<tr>
				<th>번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>파일명</th>
				<th>파일크기</th>
				<th>등록일</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="tmp" items="${list }">
			<tr>
				<td>${tmp.num }</td>
				<td>${tmp.writer }</td>
				<td>${tmp.title }</td>
				<td><a style="color:#5991A8"; href="download.do?num=${tmp.num }">${tmp.orgFileName }</a></td>
				<td><fmt:formatNumber value="${tmp.fileSize }" pattern="#,###"/> byte</td>
				<td>${tmp.regdate }</td>
				<td>
					<c:if test="${tmp.writer eq id }">
						<a href="private/delete.do?num=${tmp.num }">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="#070404" class="bi bi-trash2" viewBox="0 0 16 16">
							  <path d="M14 3a.702.702 0 0 1-.037.225l-1.684 10.104A2 2 0 0 1 10.305 15H5.694a2 2 0 0 1-1.973-1.671L2.037 3.225A.703.703 0 0 1 2 3c0-1.105 2.686-2 6-2s6 .895 6 2zM3.215 4.207l1.493 8.957a1 1 0 0 0 .986.836h4.612a1 1 0 0 0 .986-.836l1.493-8.957C11.69 4.689 9.954 5 8 5c-1.954 0-3.69-.311-4.785-.793z"/>
							</svg>
						</a>
					</c:if>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<a href="private/upload_form.do">
		<button class="btn btn-success btn-xs float-right" >업로드</button>
	</a>
	<nav>
		<ul class="pagination justify-content-center">
		<c:choose>
			<c:when test="${startPageNum ne 1 }">
				<li class="page-item">
					<a class="page-link" href="list.do?pageNum=${startPageNum-1 }&condition=${condition }&keyword=${encodedK }"><</a>
				</li>
			</c:when>
			<c:otherwise>
				<li class="page-item disabled">
		  			<a class="page-link" href="javascript:"><</a>
		  		</li>
			</c:otherwise>
		</c:choose>
		
		<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
			<c:choose>
				<c:when test="${i eq pageNum }">
					<li class="page-item active">
						<a class="page-link" href="list.do?pageNum=${i }&condition=${condition }&keyword=${encodedK }"
						style='color:black${i==pageNum ? "; background-color:#EAEAEA; border-color:#EAEAEA":""}'>${i }</a>
					</li>
				</c:when>
				<c:otherwise>
					<li class="page-item">
						<a class="page-link" href="list.do?pageNum=${i }&condition=${condition }&keyword=${encodedK }"
						style='color:black';>${i }</a>
					</li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:choose>
			<c:when test="${endPageNum lt totalPageCount }">
				<li class="page-item">
					<a class="page-link" href="list.do?pageNum=${endPageNum+1 }&condition=${condition }&keyword=${encodedK }"
					style='color:black';>></a>
				</li>
			</c:when>
			<c:otherwise>
				<li class="page-item disabled">
		    		<a class="page-link" href="javascript:">></a>
		    	</li>
			</c:otherwise>
		</c:choose>
		</ul>
	</nav>
	<form class="form-inline mb-5" action="list.do" method="get">
		<label class="input-group-text" for="condition">검색조건</label>
		<select class="custom-select ml-1" name="condition" id="condition">
			<option value="title_filename" ${condition eq 'title_filename' ? 'selected' : '' }>제목+파일명</option>
			<option value="title" ${condition eq 'title' ? 'selected' : '' }>제목</option>
			<option value="writer" ${condition eq 'writer' ? 'selected' : '' }>작성자</option>
		</select>
		<input class="form-control ml-1" value="${keyword }" type="text" name="keyword" placeholder="검색어..."/>
		<button class="form-control btn btn-info btn-xs ml-1" type="submit">검색</button>
	</form>
</div>
</body>
<jsp:include page="../../include/blogfooter.jsp"></jsp:include>
</html>