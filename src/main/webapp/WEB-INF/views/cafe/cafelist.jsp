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
    <script type="text/javascript" src="/resources/js/ajaxsetup.js"></script>
    <script type="text/javascript" src="/resources/js/MyAppBoard.js"></script>
	<script type="text/javascript" src="/resources/js/jquery.rateyo.min.js"></script>
	<script type="text/javascript">
		$(function () {
			
			$('.cafe_type>ul>li').mouseenter(function(){
				$(this).children('ul').show();
			}).mouseleave(function(){
				$(this).children('ul').hide();
			})
			
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
			
			$('body').on("click","div[class^=cafelist]",function(){
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
                }else if(brand == "호미빙"){
                    brand = "homibing";   
                }else if(brand == "설빙"){
                    brand = "sealbing";   
                }else if(brand == "밀탑빙수"){
                    brand = "mealtop";   
                }else if(brand == "눈꽃빙수"){
                    brand = "iceflower";   
                }else if(brand == "옥루몽"){
                    brand = "oclumong";   
                }else if(brand == "개인빙수"){
                    brand = "personbingsoo";   
                }else if(brand == "강아지"){
                    brand = "dog";   
                }else if(brand == "고양이"){
                    brand = "cat";   
                }else if(brand == "새"){
                    brand = "bird";   
                }else if(brand == "기타"){
                    brand = "etc";   
                }
                
                var cafeno = $(this).attr("cafeno");
                window.location.href = "/cafe1/"+brand+"/"+cafeno;
			})
			
			
			$('.moreBtn').click(function(){
				
				var lastcafeno = $('.maxcafe').attr('maxcafe')
				var listlast = $('div[class^=cafelist]').last().attr("cafeno"); 
				console.log("lastcafeno = "+lastcafeno)
				
				var cafebigtype = null;
				var abcd = $('.maxcafe').attr('cafebigtype');
				if(abcd != null || abcd != ""){
					
					if(abcd == "coffee"){
						cafebigtype = "카페"
					}else if(abcd == "bingsoo"){
						cafebigtype = "빙수"
					}else if(abcd == "animal"){
                        cafebigtype = "펫"
                    }
					
				}else{
					cafebigtype = 0;
				};
				
				var brand = null;
				abcd = $('.maxcafe').attr('brand');
				console.log("abcd = "+abcd)
				if(abcd != null || abcd != ""){
					brand = abcd;
				}
				else{
					brand = 0;
				}
				console.log("brand = "+brand)
				
				return morecafelist(lastcafeno,listlast,brand,cafebigtype);
				
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
						<li>
                            <a href="/cafe/coffee">커피</a>
                            <ul class="cafe_subtype">
                                <li><a href="/cafe/coffee/starbucks">스타벅스</a></li>
                                <li><a href="/cafe/coffee/hollys">할리스</a></li>
                                <li><a href="/cafe/coffee/cafebene">카페베네</a></li>
                                <li><a href="/cafe/coffee/ediya">이디야</a></li>
                                <li><a href="/cafe/coffee/tomntom">탐탐</a></li>
                                <li><a href="/cafe/coffee/coffeebean">커피빈</a></li>
                                <li><a href="/cafe/coffee/personcafe">개인카페</a></li>
                            </ul>
                        </li>
						<li>
                            <a href="/cafe/bingsoo">빙수</a>
                            <ul class="cafe_subtype">
                                <li><a href="/cafe/bingsoo/homibing">호미빙</a></li>
                                <li><a href="/cafe/bingsoo/sealbing">설빙</a></li>
                                <li><a href="/cafe/bingsoo/iceflower">눈꽃빙수</a></li>
                                <li><a href="/cafe/bingsoo/mealtop">밀탑빙수</a></li>
                                <li><a href="/cafe/bingsoo/oclumong">옥루몽</a></li>
                                <li><a href="/cafe/bingsoo/personbingsoo">개인빙수</a></li>
                            </ul>
                        </li>
						<li>
                            <a href="/cafe/animal">동물카페</a>
                            <ul class="cafe_subtype">
                                <li><a href="/cafe/animal/dog">강아지</a></li>
                                <li><a href="/cafe/animal/cat">고양이</a></li>
                                <li><a href="/cafe/animal/bird">새</a></li>
                                <li><a href="/cafe/animal/etc">기타</a></li>
                            </ul>
                        </li>
					</ul>
					<div class="line"></div>
				</div>
                <c:choose>
                    <c:when test="${brand != null and brand != '' }">
                    <div class="maxcafe" brand="${brand }" maxcafe="${maxCafe }" cafebigtype="0" style="opacity:0;"></div>
                    </c:when>
                    <c:otherwise>
                    <div class="maxcafe" brand="0" maxcafe="${maxCafe }" cafebigtype="${cafebigtype }" style="opacity:0;"></div>
                    </c:otherwise>
                </c:choose>
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
                                 <c:when test="${list.brand == '호미빙' }">
                                    <img src="/resources/img/homibing.png">
                                </c:when>
                                 <c:when test="${list.brand == '설빙' }">
                                    <img src="/resources/img/sealbing.png">
                                </c:when>
                                 <c:when test="${list.brand == '밀탑빙수' }">
                                    <img src="/resources/img/mealtop.png">
                                </c:when>
                                 <c:when test="${list.brand == '옥루몽' }">
                                    <img src="/resources/img/oclumong.png">
                                </c:when>
                                 <c:when test="${list.brand == '눈꽃빙수' }">
                                    <img src="/resources/img/iceflower.png">
                                </c:when>
                                <c:when test="${list.brand == '강아지' }">
                                    <img src="/resources/img/dog.png">
                                </c:when>
                                <c:when test="${list.brand == '고양이' }">
                                    <img src="/resources/img/cat.png">
                                </c:when>
                                <c:when test="${list.brand == '새' }">
                                    <img src="/resources/img/iceflower.png">
                                </c:when>
                                <c:when test="${list.brand == '기타' }">
                                    <img src="/resources/img/animal.png">
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
                <c:choose>
                <c:when test="${size >= 12 }">
                <div class="moreBtn">더 보기</div>
                </c:when>
                </c:choose>
			</div>
		</div>
		<div class="footer"><%@ include file="footer.jsp" %></div>
	</div>
</body>
</html>