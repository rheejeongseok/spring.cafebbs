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
    	$('.cafediv').click(function(){
    		
    		var link = $(this).attr('link');
    		window.location.href = link;
    		
    	})
    	
    	
    })
    </script>
</head>
<body>
	<div class="wrap">
		<div class="header"><%@ include file="header.jsp" %></div>
		<div class="content">
			<div class="content_wrap">
				<div class="cafe01 cafediv" link="/cafe/coffee">
					<span class="cafe_title">커피</span><br>
					<span class="cafe_sub">Coffee</span>
				</div>
				<div class="cafe02 cafediv" link="/cafe/coffee/hollys">
					<span class="cafe_title">할리스</span><br>
					<span class="cafe_sub">Hollys</span>
				</div>
				<div class="cafe03 cafediv" link="/cafe/coffee/starbucks">
					<span class="cafe_title">스타벅스</span><br>
					<span class="cafe_sub">StarBucks</span>
				</div>
				<div class="cafe04 cafediv" link="/cafe/coffee/ediya">
					<span class="cafe_title">이디야</span><br>
					<span class="cafe_sub">Ediya</span>
				</div>
				<div class="cafe05 cafediv" link="/cafe/bingsoo">
					<span class="cafe_title">빙수</span><br>
					<span class="cafe_sub">BingSoo</span>
				</div>
				<div class="cafe06 cafediv" link="/cafe/bingsoo/homibing">
					<span class="cafe_title">호미빙</span><br>
					<span class="cafe_sub">Homibing</span>
				</div>
				<div class="cafe07 cafediv" link="/cafe/bingsoo/mealtop">
					<span class="cafe_title">밀탑빙수</span><br>
					<span class="cafe_sub">Mealtop</span>
				</div>
                <div class="cafe08 cafediv" link="/cafe/bingsoo/sealbing">
                    <span class="cafe_title">설빙</span><br>
                    <span class="cafe_sub">Sealbing</span>
                </div>
				<div class="cafe09 cafediv" link="/cafe/animal">
					<span class="cafe_title">동물카페</span><br>
					<span class="cafe_sub">Animal Cafe</span>
				</div>
				<div class="cafe10 cafediv" link="/cafe/animal/dog">
					<span class="cafe_title">강아지</span><br>
					<span class="cafe_sub">Dog</span>
				</div>
				<div class="cafe11 cafediv" link="/cafe/animal/cat">
					<span class="cafe_title">고양이</span><br>
					<span class="cafe_sub">Cat</span>
				</div>
				<div class="cafe12 cafediv" link="/cafe/animal/bird">
					<span class="cafe_title">새</span><br>
					<span class="cafe_sub">Bird</span>
				</div>
				<div class="btm_slide">
					<div class="ranking">
						<div class="slidename">카페랭킹</div>
						<div class="slide_list ranking_slide">
							<ul>
								<c:forEach var="list" items="${ranking }" varStatus="status">
                                <li><a href="/cafe1/${list.brand }/${list.cafeno}"><span class="cafename">${list.cafename }</span></a><span class="cafepoint">${status.index+1 }위</span></li>
								</c:forEach>
							</ul>
						</div>
					</div>
					<div class="nowreview">
						<div class="slidename">실시간댓글</div>
						<div class="slide_list reivew_ranking">
							<ul>
								<c:forEach var="list" items="${newR }">
								<li><span class="comment_content">${list.content }</span><span class="comment_writer">${list.usernickname }</span></li>
								</c:forEach>
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