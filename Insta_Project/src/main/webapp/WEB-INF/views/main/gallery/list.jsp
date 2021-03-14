<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/gallery/list.jsp</title>
<jsp:include page="../../include/resource.jsp"></jsp:include>
<jsp:include page="../../include/blogbasic2.jsp"></jsp:include>
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
	
	/* 여기서부터 댓글 css 글 내용을 출력할 div 에 적용할 css */
	.contents{
		width: 100%;
		border: 1px dotted #cecece;
	}
	/* 댓글 프로필 이미지를 작은 원형으로 만든다. */
	.profile-image{
		width: 50px;
		height: 50px;
		border: 1px solid #cecece;
		border-radius: 50%;
	}
	/* ul 요소의 기본 스타일 제거 */
	.comments ul{
		padding: 0;
		margin: 0;
		list-style-type: none;
	}
	.comments dt{
		margin-top: 5px;
	}
	.comments dd{
		margin-left: 50px;
	}
	.comment-form textarea, .comment-form button{
		float: left;
	}
	.comments li{
		clear: left;
	}
	.comments ul li{
		border-top: 1px solid #888;
	}
	.comment-form textarea{
		width: 85%;
		height: 100px;
	}
	.comment-form button{
		width: 15%;
		height: 100px;
	}
	/* 댓글에 댓글을 다는 폼과 수정폼은 일단 숨긴다. */
	.comments .comment-form{
		display: none;
	}
	/* .reply_icon 을 li 요소를 기준으로 배치 하기 */
	.comments li{
		position: relative;
	}
	.comments .reply-icon{
		position: absolute;
		top: 1em;
		left: 1em;
		color: red;
	}
	pre {
	  display: block;
	  padding: 9.5px;
	  margin: 0 0 10px;
	  font-size: 13px;
	  line-height: 1.42857143;
	  color: #333333;
	  word-break: break-all;
	  word-wrap: break-word;
	  background-color: #f5f5f5;
	  border: 1px solid #ccc;
	  border-radius: 4px;
	}
	/* 글 내용중에 이미지가 있으면 최대 폭을 100%로 제한하기 */
	.contents img{
		max-width: 100%;
	}
	.loader{
		position: fixed; /* 좌하단 고정된 위치에 배치 하기 위해 */
		width: 100%;
		left: 0;
		bottom: 0;
		text-align: center; /* 이미지를 좌우로 가운데  정렬 */
		z-index: 1000;
		display: none; /* 일단 숨겨 놓기 */
	}	
	
	#con{
		margin-top:10rem;
	}
	a#MOVE_TOP_BTN {
	    position: fixed;
	    right: 2%;
	    bottom: 50px;
	    display: none;
	    z-index: 999;
	}
</style>
</head>
<body>

<div class="container" id="con">
	<div class="row" id="galleryList">
		<c:forEach var="tmp" items="${list }">
			<div class="col-6 col-md-4 col-lg-3">
				<div class="card mb-3">
					<a href="comment.do?num=${tmp.num }">
						<div class="img-wrapper">
							<img class="card-img-top" src="${pageContext.request.contextPath }${tmp.imagePath}" />
						</div>
					</a>
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
 <!-- 맨 위로 가기 버튼 링크 생성, 이미지의 크기와 이미지가 존재하는 경로 설정 -->   
   <a id="MOVE_TOP_BTN" href="#"><img style="width:60px;height:60px" 
               src="${pageContext.request.contextPath }/resources/images/main_up.png"/>
   </a>
<!-- 
   맨 위로 가기 버튼이 부드럽게 동작하기 위한 설정
   스크롤 위치에 따라 화면에서 맨위로 올라가는 버튼이 나타나고, 사라지도록하고
   animation을 걸어서 화면 맨위로 이동하도록 설정
 -->
<div class="back-drop">
	<img src="${pageContext.request.contextPath }/svg/spinner-solid.svg"/>
</div>
<script src="${pageContext.request.contextPath }/resources/js/jquery.form.min.js"></script>
<script>
	$(function() {
	    $(window).scroll(function() {
	        if ($(this).scrollTop() > 50) {
	            $('#MOVE_TOP_BTN').fadeIn();
	        } else {
	            $('#MOVE_TOP_BTN').fadeOut();
	        }
	    });
	     
	    $("#MOVE_TOP_BTN").click(function() {
	        $('html, body').animate({
	            scrollTop : 0
	        }, 400);
	        return false;
	    });
	});
	//댓글 스크립트
	
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
<jsp:include page="../../include/blogfooter.jsp"></jsp:include>
</html>

