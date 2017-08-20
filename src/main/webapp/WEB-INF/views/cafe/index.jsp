<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<link rel="stylesheet" type="text/css" href="/resources/css/index.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
	<script type="text/javascript" src="/resources/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="/resources/js/common.js"></script>
    <script>
    $(function(){
    	$('.cafe01').click(function(){
    		window.location.href="/cafe/coffee";
    	})
    })
    </script>
</head>
<body>
	<div class="wrap">
		<div class="header"><%@ include file="header.jsp" %></div>
		<div class="content">
			<div class="content_wrap">
				<div class="cafe01 cafediv">
					<span class="cafe_title">커퓌</span><br>
					<span class="cafe_sub"><a href="/cafe/coffee">Coffee</a></span>
				</div>
				<div class="cafe02 cafediv">
					<span class="cafe_title">할리스</span><br>
					<span class="cafe_sub"><a href="/cafe/coffee/hollys">Hollys</a></span>
				</div>
				<div class="cafe03 cafediv">
					<span class="cafe_title">스타벅스</span><br>
					<span class="cafe_sub"><a href="/cafe/coffee/starbucks">StarBucks</a></span>
				</div>
				<div class="cafe04 cafediv">
					<span class="cafe_title">이디야</span><br>
					<span class="cafe_sub"><a href="/cafe/coffee/ediya">Ediya</a></span>
				</div>
				<div class="cafe05 cafediv">
					<span class="cafe_title">빙수</span><br>
					<span class="cafe_sub"><a href="/cafe/bingsoo">BingSoo</a></span>
				</div>
				<div class="cafe06 cafediv">
					<span class="cafe_title">호미빙</span><br>
					<span class="cafe_sub"><a href="/cafe/bingsoo/homibing">Coffee Bean</a></span>
				</div>
				<div class="cafe07 cafediv">
					<span class="cafe_title">설빙</span><br>
					<span class="cafe_sub"><a href="/cafe/bingsoo/seolbing">Personal Cafe</a></span>
				</div>
				<div class="cafe08 cafediv">
					<span class="cafe_title">밀탑빙수</span><br>
					<span class="cafe_sub"><a href="/cafe/bingsoo/miltop">ice flakes with syrup</a></span>
				</div>
				<div class="cafe05 cafediv">
					<span class="cafe_title">동물카페</span><br>
					<span class="cafe_sub"><a href="/cafe/animal">Animal Cafe</a></span>
				</div>
				<div class="cafe06 cafediv">
					<span class="cafe_title">강아지</span><br>
					<span class="cafe_sub"><a href="/cafe/animal/dog">Coffee Bean</a></span>
				</div>
				<div class="cafe07 cafediv">
					<span class="cafe_title">고양이</span><br>
					<span class="cafe_sub"><a href="/cafe/animal/cat">Personal Cafe</a></span>
				</div>
				<div class="cafe08 cafediv">
					<span class="cafe_title">새</span><br>
					<span class="cafe_sub"><a href="/cafe/animal/bird">ice flakes with syrup</a></span>
				</div>
				<div class="btm_slide">
					<div class="ranking">
						<div class="slidename">카페랭킹</div>
						<div class="slide_list ranking_slide">
							<ul>
								<li><span class="cafename">a</span><span class="cafepoint">a</span></li>
								<li><span class="cafename"></span><span class="cafepoint"></span></li>
								<li><span class="cafename"></span><span class="cafepoint"></span></li>
								<li><span class="cafename"></span><span class="cafepoint"></span></li>
								<li><span class="cafename"></span><span class="cafepoint"></span></li>
							</ul>
						</div>
					</div>
					<div class="nowreview">
						<div class="slidename">실시간댓글</div>
						<div class="slide_list reivew_ranking">
							<ul>
								<li><span class="comment_content"></span><span class="comment_writer"></span></li>
								<li><span class="comment_content"></span><span class="comment_writer"></span></li>
								<li><span class="comment_content"></span><span class="comment_writer"></span></li>
								<li><span class="comment_content"></span><span class="comment_writer"></span></li>
								<li><span class="comment_content"></span><span class="comment_writer"></span></li>
							</ul>
						</div>
					</div>
				</div>

			</div>
		</div>
		<div class="footer"><%@ include file="footer.jsp" %></div>
	</div>
</body>
</html>