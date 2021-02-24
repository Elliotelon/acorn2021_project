<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<c:forEach var="tmp" items="${commentList }">
	<c:choose>
		<c:when test="${tmp.deleted eq 'yes' }">
			<li>삭제된 댓글 입니다.</li>
		</c:when>
		<c:otherwise>
			<li id="comment${tmp.num }" <c:if test="${tmp.num ne tmp.comment_group }">style="padding-left:50px;"</c:if>>
				<c:if test="${tmp.num ne tmp.comment_group }"><svg class="reply-icon" width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-arrow-return-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
 						<path fill-rule="evenodd" d="M10.146 5.646a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708-.708L12.793 9l-2.647-2.646a.5.5 0 0 1 0-.708z"/>
 						<path fill-rule="evenodd" d="M3 2.5a.5.5 0 0 0-.5.5v4A2.5 2.5 0 0 0 5 9.5h8.5a.5.5 0 0 0 0-1H5A1.5 1.5 0 0 1 3.5 7V3a.5.5 0 0 0-.5-.5z"/></svg>
				</c:if>
				<dl>
					<dt>
						<c:choose>
							<c:when test="${empty tmp.profile }">
								<svg class="profile-image"  width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-person-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
		  							<path fill-rule="evenodd" d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
								</svg>
							</c:when>
							<c:otherwise>
								<img class="profile-image" 
									src="${pageContext.request.contextPath }${tmp.profile }"/>
							</c:otherwise>
						</c:choose>
						<span>${tmp.writer }</span>
						<c:if test="${tmp.num ne tmp.comment_group }">
							@<i>${tmp.target_id }</i>
						</c:if>
						<span>${tmp.regdate }</span>
						<a data-num="${tmp.num }" href="javascript:" class="reply-link">
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="#070404" class="bi bi-chat-text" viewBox="0 0 16 16">
										  <path d="M2.678 11.894a1 1 0 0 1 .287.801 10.97 10.97 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8.06 8.06 0 0 0 8 14c3.996 0 7-2.807 7-6 0-3.192-3.004-6-7-6S1 4.808 1 8c0 1.468.617 2.83 1.678 3.894zm-.493 3.905a21.682 21.682 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a9.68 9.68 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105z"/>
										  <path d="M4 5.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zM4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8zm0 2.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5z"/>
										</svg>
									</a>
									<c:if test="${tmp.writer eq id }">
										| <a data-num="${tmp.num }" href="javascript:" class="comment-update-link">
											<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="#070404" class="bi bi-pen" viewBox="0 0 16 16">
											  <path d="M13.498.795l.149-.149a1.207 1.207 0 1 1 1.707 1.708l-.149.148a1.5 1.5 0 0 1-.059 2.059L4.854 14.854a.5.5 0 0 1-.233.131l-4 1a.5.5 0 0 1-.606-.606l1-4a.5.5 0 0 1 .131-.232l9.642-9.642a.5.5 0 0 0-.642.056L6.854 4.854a.5.5 0 1 1-.708-.708L9.44.854A1.5 1.5 0 0 1 11.5.796a1.5 1.5 0 0 1 1.998-.001zm-.644.766a.5.5 0 0 0-.707 0L1.95 11.756l-.764 3.057 3.057-.764L14.44 3.854a.5.5 0 0 0 0-.708l-1.585-1.585z"/>
											</svg>
										</a>
										| <a data-num="${tmp.num }" href="javascript:" class="comment-delete-link">
											<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="#070404" class="bi bi-trash2" viewBox="0 0 16 16">
											  <path d="M14 3a.702.702 0 0 1-.037.225l-1.684 10.104A2 2 0 0 1 10.305 15H5.694a2 2 0 0 1-1.973-1.671L2.037 3.225A.703.703 0 0 1 2 3c0-1.105 2.686-2 6-2s6 .895 6 2zM3.215 4.207l1.493 8.957a1 1 0 0 0 .986.836h4.612a1 1 0 0 0 .986-.836l1.493-8.957C11.69 4.689 9.954 5 8 5c-1.954 0-3.69-.311-4.785-.793z"/>
											</svg>
										</a>
									</c:if>
					</dt>
					<dd>
						<pre>${tmp.content }</pre>
					</dd>
				</dl>
				<form class="comment-form re-insert-form" 
					action="private/comment_insert.do" method="post">
					<input type="hidden" name="ref_group"
						value="${dto.num }"/>
					<input type="hidden" name="target_id"
						value="${tmp.writer }"/>
					<input type="hidden" name="comment_group"
						value="${tmp.comment_group }"/>
					<textarea name="content"></textarea>
					<button type="submit">등록</button>
				</form>
				<!-- 로그인된 아이디와 댓글의 작성자가 같으면 수정 폼 출력 -->
				<c:if test="${tmp.writer eq id }">
					<form class="comment-form update-form" 
						action="private/comment_update.do" method="post">
						<input type="hidden" name="num" value="${tmp.num }"/>
						<textarea name="content">${tmp.content }</textarea>
						<button type="submit">수정</button>
					</form>
				</c:if>
			</li>						
		</c:otherwise>
	</c:choose>
</c:forEach> 