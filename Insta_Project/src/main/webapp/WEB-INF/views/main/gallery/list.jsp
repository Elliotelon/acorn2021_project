<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/gallery/list.jsp</title>
<jsp:include page="../../include/resource.jsp"></jsp:include>
<!-- 
	jquery 플러그인 imgLiquid.js 로딩하기
	- 반드시 jquery.js 가 먼저 로딩이 되어 있어야지만 동작한다.
	- 사용법은 이미지의 부모 div 크기를 결정하고 이미지를 선택해서  .imgLiquid() 동작을 하면된다.
 -->
<script src="${pageContext.request.contextPath }/resources/js/imgLiquid.js"></script>
<style>
	/* card 이미지 부모요소의 높이 지정 */
	.img-wrapper{
		height: 250px;
		/* transform 을 적용할대 0.3s 동안 순차적으로 적용하기 */
		transition: transform 0.3s ease-out;
	}
	/* .img-wrapper 에 마우스가 hover 되었을때 적용할 css */
	.img-wrapper:hover{
		/* 원본 크기의 1.1 배로 확대 시키기*/
		transform: scale(1.05);
	}
	
	.card .card-text{
		/* 한줄만 text 가 나오고  한줄 넘는 길이에 대해서는 ... 처리 하는 css */
		display:block;
		white-space : nowrap;
		text-overflow: ellipsis;
		overflow: hidden;
	}
	
	/* img  가  가운데 정렬 되도록 */
	.back-drop{
		/* 일단 숨겨 놓는다. */
		display:none;
	
		/* 화면 전체를 투명도가 있는 회색으로 덮기 위한  css*/
		position: fixed;
		top: 0;
		right: 0;
		bottom: 0;
		left: 0;
		background-color: #cecece;
		padding-top: 300px;
		z-index: 10000;
		opacity: 0.5;
		text-align: center;
	}
	
	.back-drop img{
		width: 100px;
		/* rotateAnimation 이라는 키프레임을 2초 동한 일정한 비율로  무한 반복하기 */
		animation: rotateAnimation 2s ease-out infinite;
	}
	/* 회전하는 rotateAnimation 이라는 이름의 키프레임 정의하기 */
	@keyframes rotateAnimation{
		0%{
			transform: rotate(0deg);
		}
		100%{
			transform: rotate(360deg);
		}
	}
	
	
	
</style>
</head>
<body>
<jsp:include page="../../include/navbar.jsp">
	<jsp:param value="gallery" name="thisPage"/>
</jsp:include>
<div class="container">
	<a href="private/upload_form.do">사진 업로드 하러 가기</a><br/>
	<a href="private/ajax_form.do">사진 업로드 하러 가기2</a>
	<h1>겔러리 목록 입니다.</h1>
	<div class="row" id="galleryList">
		<c:forEach var="tmp" items="${list }">
			<div class="col-12 col-md-12 col-lg-12">
				<div class="card mb-3">
					<a href="detail.do?num=${tmp.num }">
						<div class="img-wrapper">
							<img class="card-img-top" src="${pageContext.request.contextPath }${tmp.imagePath}" />
						</div>
					</a>
					<a href="comment.do?number=${tmp.num}">댓글</a>
					<div class="card-body">
						<p class="card-text">${tmp.caption }</p>
						<p class="card-text">by <strong>${tmp.writer }</strong></p>
						<p><small>${tmp.regdate }</small></p>
					</div>
				</div>
			</div>	
		</c:forEach>
		
		
	</div>
</div>

<script>
	
	// card 이미지의 부모 요소를 선택해서 imgLiquid  동작(jquery plugin 동작) 하기 
	$(".img-wrapper").imgLiquid();
	
	//페이지가 처음 로딩될때 1 page 를 보여주기 때문에 초기값을 1 로 지정한다.
	let currentPage=1; //화면상에 로딩된 최신 페이지번호를 저장할 변수 
	//현재 페이지가 로딩중인지 여부를 저장할 변수
	let isLoading=false;
	
	//웹브라우저의 창을 스크롤 할때 마다 호출되는 함수 등록
	$(window).on("scroll", function(){
		console.log("scorll!");
		//최 하단까지 스크롤 되었는지 조사해 본다.
		//위로 스크롤된 길이
		let scrollTop=$(window).scrollTop();
		//웹브라우저 창의 높이
		let windowHeight=$(window).height();
		//문서 전체의 높이
		let documentHeight=$(document).height();
		//바닥까지 스크롤 되었는지 여부를 알아낸다. 
		let isBottom = scrollTop+windowHeight + 10 >= documentHeight;
		if(isBottom){
			console.log("오매~ 바닥이네?");
			//만일 현재 마지막 페이지라면
			if(currentPage == ${totalPageCount} || isLoading){
				return; //함수를 여기서 끝낸다. 
			}
			//현재 로딩 중이라고 표시한다. 
			isLoading=true;
			//로딩바를 띄우고
			$(".back-drop").show();
			//요청할 페이지 번호를 1 증가 시킨다
			currentPage++;
			//추가로 받아올 페이지를 서버에 ajax 요청을 하고
			$.ajax({
				url:"ajax_page.do",
				method:"GET",
				data:"pageNum="+currentPage, // {pageNum:currentPage} 도 가능
				success:function(data){
					console.log(data);
					//응답된 문자열은 html 형식이다 
					//해당 문자열을 #galleryList div 에 html 로 해석하라고 추가한다.
					$("#galleryList").append(data);
					//로딩바를 숨긴다
					$(".back-drop").hide();
					//현재 추가된 img 요소의 부모 div 를 선택해서 imgLiquid() 동작하기
					$(".page-"+currentPage).imgLiquid();
					//로딩중이 아니라고 표시한다.
					isLoading=false;
				}
			});
		}
	});
	
	
</script>
</body>
</html>

