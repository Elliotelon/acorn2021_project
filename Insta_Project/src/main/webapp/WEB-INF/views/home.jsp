<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Jekyll v4.1.1">
<title>식소담</title>
<link rel="canonical" href="https://getbootstrap.com/docs/4.5/examples/blog/">
<!-- Bootstrap core CSS -->
<jsp:include page="include/resource.jsp"></jsp:include>
<jsp:include page="include/blogcss.jsp"></jsp:include>
<jsp:include page="include/blogbasic.jsp"></jsp:include>
<!-- Custom styles for this template -->
<link href="https://fonts.googleapis.com/css?family=Playfair+Display:700,900" rel="stylesheet">

<style>
	.carousel-inner .carousel-item{
		height:15rem;
	}
	#mid{
		height:72rem;
	}
	.blog-footer{
		
	}
	#con{
		margin-top:10rem;
	}
	.jumbotrom{
		background-color:red;
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
    <div class="col-md-12 mb-3">
    	<div id="carouselExampleFade" class="img-wrapper carousel slide carousel-fade" data-ride="carousel">
		  <div class="carousel-inner img-wrapper ">
		    <div class="carousel-item img-wrapper active">
		      <img src="${pageContext.request.contextPath }/resources/images/main_pic1.png" class="d-block w-100 h-100  " >
		    </div>
		    <div class="carousel-item img-wrapper">
		      <img src="${pageContext.request.contextPath }/resources/images/main_pic2.png" class="d-block w-100 h-100" >
		    </div>
		    <div class="carousel-item img-wrapper">
		      <img src="${pageContext.request.contextPath }/resources/images/main_pic3.png" class="d-block w-100 h-100">
		    </div>
		  </div>
		  <a class="carousel-control-prev" href="#carouselExampleFade" role="button" data-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    <span class="sr-only">Previous</span>
		  </a>
		  <a class="carousel-control-next" href="#carouselExampleFade" role="button" data-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true"></span>
		    <span class="sr-only">Next</span>
		  </a>
		</div>
    </div>

	<div class="row mb-2">
	    <div class="col-md-6">
	      <div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
	        <div class="col p-4 d-flex flex-column position-static">
	          <strong class="d-inline-block mb-2 text-primary">추천</strong>
	          <h3 class="mb-0">칠리새우</h3>
	          <ul class="card-text mt-3">
	          	<li>소개 : 피크닉용 쉬림프박스</li>
	          	<li>맛 : 달콤함, 매콤함</li>
	          	<li>비용 : 6,000원</li> 
	          </ul>
	        </div>
	        <div class="col-md-4 d-none d-lg-block img-wrapper">
	        	<a href="main/gallery/comment.do?num=42">        	
		        	<img class="card-img-top" src="${pageContext.request.contextPath }/resources/images/food_chilly0.png"/>
	        	</a>
	        </div>
	      </div>
	    </div>
		<div class="col-md-6">
			<div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
			  	<div class="col p-4 d-flex flex-column position-static">
			    	<strong class="d-inline-block mb-2 text-danger">인기</strong>
			    	<h3 class="mb-0">소시지 콩나물찜</h3>
			    	<ul class="card-text mt-3">
			        	<li>소개 : 백주부의 소시지 콩나물찜</li>
			          	<li>맛 : 아삭함, 칼칼함</li>
			          	<li>비용 : 7,500원 </li> 
			       	</ul>
			  	</div>
			  	<div class="col-md-4 d-none d-lg-block img-wrapper">
			  		<a href="main/gallery/comment.do?num=44">
		          		<img class="card-img-top" src="${pageContext.request.contextPath }/resources/images/food_socong0.png"/>
			  		</a>
	        	</div>
			</div>
		</div>
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
</script>
</body>

<jsp:include page="include/blogfooter.jsp"></jsp:include>
</html>