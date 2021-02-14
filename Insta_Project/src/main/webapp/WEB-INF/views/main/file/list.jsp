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
</head>
<body>
<jsp:include page="../../include/navbar.jsp">
	<jsp:param value="file" name="thisPage"/>
</jsp:include>
<div class="container">
	<a href="private/upload_form.do">파일 업로드</a>
	<h1>파일 목록입니다.</h1>
	<table class="table table-striped table-sm">
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
				<td><a href="download.do?num=${tmp.num }">${tmp.orgFileName }</a></td>
				<td><fmt:formatNumber value="${tmp.fileSize }" pattern="#,###"/> byte</td>
				<td>${tmp.regdate }</td>
				<td>
					<c:if test="${tmp.writer eq id }">
						<a href="private/delete.do?num=${tmp.num }">삭제</a>
					</c:if>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="page-display">
		<ul class="pagination pagination-sm">
		<c:if test="${startPageNum ne 1 }">
			<li class="page-item"><a class="page-link" href="list.do?pageNum=${startPageNum-1 }&condition=${condition }&keyword=${encodedK }">Prev</a></li>
		</c:if>
		<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
			<c:choose>
				<c:when test="${i eq pageNum }">
					<li class="page-item active"><a class="page-link" href="list.do?pageNum=${i }&condition=${condition }&keyword=${encodedK }">${i }</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link" href="list.do?pageNum=${i }&condition=${condition }&keyword=${encodedK }">${i }</a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${endPageNum lt totalPageCount }">
			<li class="page-item"><a class="page-link" href="list.do?pageNum=${endPageNum+1 }&condition=${condition }&keyword=${encodedK }">Next</a></li>
		</c:if>
		</ul>
	</div>
	<hr style="clear:left;"/>
	<form action="list.do" method="get">
		<label for="condition">검색조건</label>
		<select name="condition" id="condition">
			<option value="title_filename" ${condition eq 'title_filename' ? 'selected' : '' }>제목+파일명</option>
			<option value="title" ${condition eq 'title' ? 'selected' : '' }>제목</option>
			<option value="writer" ${condition eq 'writer' ? 'selected' : '' }>작성자</option>
		</select>
		<input value="${keyword }" type="text" name="keyword" placeholder="검색어..."/>
		<button type="submit">검색</button>
	</form>
</div>
</body>
</html>