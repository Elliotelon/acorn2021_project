<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/list.jsp</title>
<jsp:include page="../../include/resource.jsp"></jsp:include>
<jsp:include page="../../include/blogbasic2.jsp"></jsp:include>
<style>
	#con{
		margin-top:5rem;
	}
</style>
</head>
<body>
<div class="container" id="con">
	<a href="private/insertform.do">새글 작성</a>
	<h1>카페 글 목록 입니다.</h1>
	<table class="table table-striped">
		<thead class="table-dark">
			<tr>
				<th>글번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>조회수</th>
				<th>등록일</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="tmp" items="${list }">
			<tr>
				<td>${tmp.num }</td>
				<td>${tmp.writer }</td>
				<td><a href="detail.do?num=${tmp.num }">${tmp.title }</a></td>
				<td>${tmp.viewCount }</td>
				<td>${tmp.regdate }</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<nav>
		<ul class="pagination justify-content-center">
			<c:choose>
		  		<c:when test="${startPageNum ne 1 }">
		  			<li class="page-item">
			  			<a class="page-link"href="list.do?pageNum=${startPageNum-1}&condition=${conditon }&keyword=${encodedK}">Prev</a>
			  		</li>	 
		  		</c:when>
		  		<c:otherwise>
		  			<li class="page-item disabled">
			  			<a class="page-link" href="javascript:">Prev</a>
			  		</li>
		  		</c:otherwise>
		  	</c:choose>
	  	  	<c:forEach var="i" begin="${startPageNum}" end="${endPageNum}">
	  	  		<c:choose>
		  	  		<c:when test="${i eq pageNum}">
		  	  			<li class="page-item active">
			    			<a class="page-link" href="list.do?pageNum=${i }&condition=${condition }&keyword=${encodedK}">${i }</a>
			    		</li>
		  	  		</c:when>
		  	  		<c:otherwise>
		  	  			<li class="page-item">
			    			<a class="page-link" href="list.do?pageNum=${i }&condition=${condition }&keyword=${encodedK}">${i }</a>
			    		</li>
		  	  		</c:otherwise>
	  	  		</c:choose>
	  	  	</c:forEach>
	 	  	<c:choose>
		 		<c:when test="${endPageNum lt totalPageCount }">
		 	  		<li class="page-item">
			    		<a class="page-link" href="list.do?pageNum=${endPageNum+1}&condition=${condition}&keyword=${encodedK}">Next</a>
			    	</li>	
		 	  	</c:when>
		 	  	<c:otherwise>
		 	  		<li class="page-item disabled">
			    		<a class="page-link" href="javascript:">Next</a>
			    	</li>
		 		</c:otherwise>
			</c:choose>	
		</ul>
	</nav>
	<form action="list.do" method="get">
		<label for="condition">검색조건</label>
		<select name="condition" id="condition">
			<option value="title_content" ${condition eq 'title_content' ? 'selected' :'' }>제목+내용</option>
			<option value="title" ${condition eq 'title' ? 'selected' :'' }>제목</option>
			<option value="writer" ${condition eq 'writer' ? 'selected' :'' }>작성자</option>
		</select>
		<input type="text" name="keyword" placeholder="검색어..."  value="${keyword }">
		<button type="submit">검색</button>
	</form>
	<%-- 만일 검색 키워드가 존재한다면 몇개의 글이 검색 되었는지 알려준다. --%>
	<c:if test="${not empty keyword }">
		<div class="alert alert-success" style="width:275px">
			<strong>${totalRow }</strong> 개의 자료가 검색 되었습니다.
		</div>	
	</c:if>
</div>
</body>
</html>
