<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<link rel="stylesheet" type="text/css" href="/resources/css/cafeinfo.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/jquery.rateyo.min.css">
	<script type="text/javascript" src="/resources/js/jquery-1.12.1.min.js"></script>
	<script type="text/javascript" src="/resources/js/common.js"></script>
	<script type="text/javascript" src="/resources/js/jquery.rateyo.min.js"></script>
    <script type="text/javascript" src="/resources/js/ajaxsetup.js"></script>
    <script type="text/javascript" src="/resources/js/MyAppBoard.js"></script>
	<script type="text/javascript">
		$(function () {
			var a = $('.cafe_grade').text();
			console.log(a)

			$(".write_grade").click(function(){
				console.log($(this).val())
				console.log($(this).text())
				var aa = $(this).find('.jq-ry-rated-group').css('width');
				var val = aa.substring(0,2);
				var avg = val/15;
				console.log(aa)
				console.log(val)
				console.log(avg)
				
				$(this).prev('.wgradeScore').text(avg);
			})
			
            var score = $('.gradeScore').text();
			
			$(".cafe_grade").rateYo({
			    rating: score,
			    starWidth: "15px",
			    readOnly: true
			});

			$(".write_grade").rateYo({
			    starWidth: "15px"
			});

			var count = 0;
            
            $("div[class^=comment_view] div[class^=list_grade]").each(function(){
                
                var score = $('.list_grade'+count).prev('.gradeScore').text();
                
                $(".list_grade"+count).rateYo({
                    
                    rating: score,        
                    starWidth: "15px",
                    readOnly: true
                });
                
                count++
                
            })
			
            $("body").on('click','#submitBtn',function(){
             
             var content = $(this).prev('textarea').val().replace(/\n/g, "<br>");
             var cafeno = $(this).parents('div[class^=comment_write]').attr('cafeno')
             var grade = $(this).parents('div[class^=comment_write]').find('.wgradeScore').text();
             console.log("content"+content);
             console.log("cafeno"+cafeno);
             console.log("grade"+grade);
             return commentadd(cafeno,content,grade);
         })
         
         $("body").on('click','.modifyBtn',function(){
        	 
        	 
             
             if($(this).is('.modifyon')){
                
                $(this).removeClass('modifyon');
                var commentno = $(this).parents('div[class^="list_content"]').attr('commentno');
                var content = $(this).parents('div[class^="list_content"]').find('div[class^="content_text"] textarea').val();
                var cafeno = $(".comment_list").attr('cafeno');
                console.log(commentno);
                console.log(content);
                
                return commentupdate(commentno,content,);
                
                
            }
             else if(!$(this).is('.modifyon')){
            	   
            	
                $(this).addClass('modifyon');   
                var content_val = $(this).parents('div[class^="list_content"]').find('div[class^="content_text"]').text();
                console.log(content_val);
                $(this).parents('div[class^="list_content"]').find('div[class^="content_text"]').text("");
                $(this).parents('div[class^="list_content"]').find('div[class^="content_text"]').append('<textarea name="comtent">'+content_val+'</textarea>')
                
                return false;
            }
        
        }) 
         
            
		});
	</script>
</head>
<body>
	<div class="wrap">
		<div class="header"><%@ include file="header.jsp" %></div>
		<div class="content">
			<div class="content_wrap">
				<div class="info_wrap">
					<div class="info_t">
					<div class="cafe_title">${cafe.cafename }</div><em>l</em>
					<div class="cafe_addr">${cafe.cafeaddr }</div><em>|</em>
                    <div class="gradeScore">${cafe.avg_grade }</div>
					<div class="cafe_grade"></div>
					<div class="like_count">${cafe.review_count }개의 리뷰</div>
				</div>
				<div class="info_l">
					<ul class="cafe_category">
						<li class="menu_list"><a href="javascript:void(0)" class="on">메뉴</a></li>
						<li class="infomation"><a href="javascript:void(0)">정보</a></li>
						<li class="review_list"><a href="javascript:void(0)">리뷰</a></li>
					</ul>
					<div class="menu_list_detail on">
                    <c:forEach var="main" items="${menuMain }" varStatus="status">
						<div class="menus">
							<div class="menu_title">${main.menucd }</div>
							<ul>
                            <c:forEach var="sub" items="${menuSub }" varStatus="status">
                                <c:if test="${main.menucd == sub.menucd }">
								<li>
									<span class="food_title">${sub.menu_name }</span>
									<span class="food_price">${sub.price }</span>
									<span class="food_desc">${sub.description }</span>
								</li>
                                </c:if>
                            </c:forEach>
							</ul>
						</div>
                    </c:forEach>
					</div>
                    
					<div class="infomation_detail">
						<div class="cafe_info">
							<div class="info_subtitle">업체정보</div>
							<div class="info_description">
								<div class="description_sub">영업시간</div> <div class="description_text">10:00 - 21:15</div>
								<br>
								<div class="description_sub">전화번호</div> <div class="description_text">${cafe.cafephone }</div>
							</div>
						</div>
						<div class="business_info">
							<div class="info_subtitle">사업자정보</div>
							<div class="info_description">
								<div class="description_sub">상호명</div>
								<div class="description_text">${cafe.cafename }</div>
								<br>
								<div class="description_sub">카페주소</div>
								<div class="description_text">${cafe.cafeaddr }</div>
							</div>
						</div>
						<div class="cafe_description">
							<div class="info_subtitle">업체한마디</div>
							<div class="info_description">
								<div class="description_sub">하고싶은말</div>
								<div class="description_text">오예</div>
							</div>
						</div>
						<div class="cafe_event">
							가입이벤트!
						</div>
					</div>
					
                    <div class="review_list_detail">
                        <c:choose>
                        <c:when test="${not empty user }">
						<div class="comment_write" cafeno="${cafe.cafeno }">
							<div class="write_writer">${user.usernickname }</div>
                            <div class="wgradeScore" style="display:none;"></div>
							<div class="write_grade"></div>
							<div class="write_time"><fmt:formatDate value="${toDay}" pattern="yyyy-MM-dd" /></div>
							<div class="write_content">
								<textarea style="height:65px;"></textarea>
								<button id="submitBtn">댓글쓰기</button>
							</div>
                        </div>
                        </c:when>
                        <c:otherwise>
                        <div class="comment_write redirect">
                            <div class="write_writer">로그인 후에 작성가능합니다.</div>
                            <div class="write_content">
                                <textarea></textarea>
                                <button id="submitBtn">댓글쓰기</button>
                            </div>
                        </div>
                        </c:otherwise>
                        </c:choose>
						<div class="comment_list" cafeno="${cafe.cafeno }">
                        <c:forEach var="list" items="${reviews }" varStatus="status">
							<div class="comment_view" index="${status.index }" commentno="${list.commentno }" cafeno="${list.cafeno }">
                                <c:if test="${user.usernickname == list.usernickname }">
                                <div class="btns">
                                    <button class="modifyBtn" commentno="${list.commentno }">수정</button>
                                    <button class="deleteBtn" commentno="${list.commentno }">삭제</button>
                                </div>
                                </c:if>
								<div class="list_writer">${list.usernickname }</div>
								<div class="list_time"><fmt:formatDate pattern="yyyy-MM-dd" value="${list.regdate }" /></div>
                                <div class="gradeScore">${list.grade }</div>
								<div class="list_grade${status.index }"></div>
								<div class="list_content">
									<div class="content_text">${list.content }</div>
								</div>
							</div>
                        </c:forEach>
						</div>
					</div>
				</div>
				<div class="info_r">
					<div class="cafe_simpleinfo">
						<div class="simple_title">카페 간단 정보</div>
						<div class="simple_simple">
							<ul>
								<li>
									<span class="simple_category">운영시간</span>
									<span class="simple_explain">11 ~ 24</span>
								</li>
								<li>
									<span class="simple_category">전화번호</span>
									<span class="simple_explain">${cafe.cafephone }</span>
								</li>
								<li>
									<span class="simple_category">카페주소</span>
									<span class="simple_explain">${cafe.cafeaddr }</span>
								</li>
							</ul>
						</div>
					</div>
				</div>
				</div>
			</div>
		</div>
		<div class="footer"><%@ include file="footer.jsp" %></div>
	</div>
</body>
</html>