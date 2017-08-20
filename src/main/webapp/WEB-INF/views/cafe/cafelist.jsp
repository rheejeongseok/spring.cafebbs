<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<link rel="stylesheet" type="text/css" href="/resources/css/cafelist.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/jquery.rateyo.min.css">
	<script type="text/javascript" src="/resources/js/jquery-1.12.1.min.js"></script>
	<script type="text/javascript" src="/resources/js/common.js"></script>
	<script type="text/javascript" src="/resources/js/jquery.rateyo.min.js"></script>
	<script type="text/javascript">
		$(function () {
			
			var count = 0;
			
			$("div[id^=grade]").each(function(){
				
				var score = $('#grade'+count).prev('.gradeScore').text();
				
				$("#grade"+count).rateYo({
					
					rating: score,        
	                starWidth: "20px",
	                readOnly: true
	            });
				
				count++
				
			})
			
			
			$('.cafelist').click(function(){
				
				var brand = $(this).attr("brand");
				if(brand == "스타벅스"){
					brand = "starbucks";
				}else if(brand == "할리스"){
				    brand = "hollys";	
				}else if(brand == "탐탐"){
                    brand = "tomntom";   
                }else if(brand == "이디야"){
                    brand = "ediya";   
                }else if(brand == "커피빈"){
                    brand = "coffeebean";   
                }else if(brand == "카페베네"){
                    brand = "cafebene";   
                }else if(brand == "개인카페"){
                    brand = "personcafe";   
                }
				
				var cafeno = $(this).attr("cafeno");
				window.location.href = "/cafe1/"+brand+"/"+cafeno;
				
			})
			
			$('.moreBtn').click(function(){
				
				var lastcafeno = $('div[class^=cafelist]').last().attr('cafeno')
				console.log(lastcafeno)
				var brand = null;
				var abcd = $('.maxcafe').attr('brand');
				console.log("abcd"+abcd)
				if(abcd != null || abcd != ""){
					brand = abcd;
				}
				else{
					brand = null;
				}
				console.log(brand)
				
				return morecafelist(lastcafeno,brand);
				
			})
			
		});
	</script>
    <style>
    .cafelist {cursor:pointer}
    
    </style>
</head>
<body>
	<div class="wrap">
		<div class="header"><%@ include file="header.jsp" %></div>
		<div class="content">
			<div class="content_wrap">
				<div class="cafe_type">
					<ul>
						<li><a href="/cafe/coffee">커피</a></li>
						<li><a href="/cafe/bingsoo">빙수</a></li>
						<li><a href="/cafe/animal">동물카페</a></li>
					</ul>
					<div class="line"></div>
				</div>
				<div class="maxcafe" brand="${brand }" maxcafe="${maxCafe }" style="display:hidden;"></div>
                <c:forEach var="list" items="${cafelist }"  end="11" varStatus="status">
    				<div class="cafelist" index="${status.index }" cafeno="${list.cafeno }" brand="${list.brand }">
    					<div class="list_l">
                            <c:choose>
                                <c:when test="${list.brand == '스타벅스' }">
                                    <img src="/resources/img/starbucks.png">
                                </c:when>
                                <c:when test="${list.brand == '할리스' }">
                                    <img src="/resources/img/hollys.png">
                                </c:when>
                                <c:when test="${list.brand == '카페베네'}">
                                    <img src="/resources/img/hollys.png">
                                </c:when>
                                <c:when test="${list.brand == '이디야' }">
                                    <img src="/resources/img/ediya.png">
                                </c:when>
                                <c:when test="${list.brand == '탐탐' }">
                                    <img src="/resources/img/tomntom.png">
                                </c:when>
                                <c:when test="${list.brand == '커피빈' }">
                                    <img src="/resources/img/coffeebean.png">
                                </c:when>
                                <c:when test="${list.brand == '개인카페' }">
                                    <img src="/resources/img/personcafe.png">
                                </c:when>
                            </c:choose>
    					</div>
    					<div class="list_r">
    						<div class="list_title">${list.cafename }</div>
                            <div class="gradeScore">${list.avg_grade }</div>
    						<div id="grade${status.index }"></div>
    						<div class="reviews">${list.review_count }건의 리뷰</div>
    						<div class="cafe_info">${list.cafeaddr },${list.like_count }</div>
    					</div>
    				</div>
                </c:forEach>
				<div class="moreBtn">더 보기</div>
			</div>
		</div>
		<div class="footer"><%@ include file="footer.jsp" %></div>
	</div>
</body>
</html>