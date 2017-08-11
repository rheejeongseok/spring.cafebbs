<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<link rel="stylesheet" type="text/css" href="css/cafeinfo.css">
	<link rel="stylesheet" type="text/css" href="css/common.css">
	<link rel="stylesheet" type="text/css" href="css/jquery.rateyo.min.css">
	<script type="text/javascript" src="js/jquery-1.12.1.min.js"></script>
	<script type="text/javascript" src="js/common.js"></script>
	<script type="text/javascript" src="js/jquery.rateyo.min.js"></script>
	<script type="text/javascript">
		$(function () {
			var a = $('.cafe_grade').text();
			console.log(a)

			$(".cafe_grade").rateYo({
			    rating: a,
			    starWidth: "15px"
			});

			$(".write_grade").rateYo({
			    starWidth: "15px"
			});

			$(".list_grade").rateYo({
			    starWidth: "15px"
			});
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
					<div class="cafe_title">스타벅스_노원점</div><em>l</em>
					<div class="cafe_addr">서울특별시 노원구 상계2동</div><em>|</em>
					<div class="cafe_grade">2.5</div>
					<div class="like_count">50명</div>
				</div>
				<div class="info_l">
					<ul class="cafe_category">
						<li class="menu_list"><a href="javascript:void(0)" class="on">메뉴</a></li>
						<li class="infomation"><a href="javascript:void(0)">정보</a></li>
						<li class="review_list"><a href="javascript:void(0)">리뷰</a></li>
					</ul>
					<div class="menu_list_detail">
						<div class="menus">
							<div class="menu_title">오개쩜</div>
							<ul>
								<li>
									<span class="food_title">스윙스</span>
									<span class="food_price">돼지</span>
									<span class="food_desc">문지후이</span>
								</li>
								<li>
									<span class="food_title">스윙스</span>
									<span class="food_price">돼지</span>
									<span class="food_desc">문지후이</span>
								</li>
								<li>
									<span class="food_title">스윙스</span>
									<span class="food_price">돼지</span>
									<span class="food_desc">문지후이</span>
								</li>
								<li>
									<span class="food_title">스윙스</span>
									<span class="food_price">돼지</span>
									<span class="food_desc">문지후이</span>
								</li>
							</ul>
						</div>
						<div class="menus">
							<div class="menu_title">육개쩜</div>
							<ul>
								<li>
									<span class="food_title">넉살</span>
									<span class="food_price">넉언니</span>
									<span class="food_desc">작두 타지 네박자 위에서</span>
								</li>
								<li>
									<span class="food_title">넉살</span>
									<span class="food_price">넉언니</span>
									<span class="food_desc">작두 타지 네박자 위에서</span>
								</li>
								<li>
									<span class="food_title">넉살</span>
									<span class="food_price">넉언니</span>
									<span class="food_desc">작두 타지 네박자 위에서</span>
								</li>
								<li>
									<span class="food_title">넉살</span>
									<span class="food_price">넉언니</span>
									<span class="food_desc">작두 타지 네박자 위에서</span>
								</li>
							</ul>
						</div>
						<div class="menus">
							<div class="menu_title">칠개쩜</div>
							<ul>
								<li>
									<span class="food_title">우앙굳ㅋ</span>
									<span class="food_price">내가미안</span>
									<span class="food_desc">내가더미안</span>
								</li>
								<li>
									<span class="food_title">우앙굳ㅋ</span>
									<span class="food_price">내가미안</span>
									<span class="food_desc">내가더미안</span>
								</li>
								<li>
									<span class="food_title">우앙굳ㅋ</span>
									<span class="food_price">내가미안</span>
									<span class="food_desc">내가더미안</span>
								</li>
								<li>
									<span class="food_title">우앙굳ㅋ</span>
									<span class="food_price">내가미안</span>
									<span class="food_desc">내가더미안</span>
								</li>
							</ul>
						</div>
					</div>
					<div class="infomation_detail">
						<div class="cafe_info">
							<div class="info_subtitle">업체정보</div>
							<div class="info_description">
								<div class="description_sub">영업시간</div> <div class="description_text">10:00 - 21:15</div>
								<br>
								<div class="description_sub">전화번호</div> <div class="description_text">010-3452-4827</div>
							</div>
						</div>
						<div class="business_info">
							<div class="info_subtitle">사업자정보</div>
							<div class="info_description">
								<div class="description_sub">상호명</div>
								<div class="description_text">스타벅스_노원점</div>
								<br>
								<div class="description_sub">사업자등록번호</div>
								<div class="description_text">217-11-67212</div>
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
						<div class="comment_write">
							<div class="write_writer">정석쨩</div>
							<div class="write_grade"></div>
							<div class="write_time">2017-05-05</div>
							<div class="write_content">
								<textarea></textarea>
								<button id="submitBtn">댓글쓰기</button>
							</div>

						</div>
						<div class="comment_list">
							<div class="comment_view">
								<div class="list_writer">후후하하호호</div>
								<div class="list_time">2020-20-20</div>
								<br>
								<div class="list_grade"></div>
								<div class="list_content">${받아올꺼야}</div>
							</div>
							<div class="comment_view">
								<div class="list_writer">후후하하호호</div>
								<div class="list_time">2020-20-20</div>
								<div class="list_grade"></div>
								<div class="list_content">${받아올꺼야}</div>
							</div>
							<div class="comment_view">
								<div class="list_writer">후후하하호호</div>
								<div class="list_time">2020-20-20</div>
								<div class="list_grade"></div>
								<div class="list_content">${받아올꺼야}</div>
							</div>
							<div class="comment_view">
								<div class="list_writer">후후하하호호</div>
								<div class="list_time">2020-20-20</div>
								<div class="list_grade"></div>
								<div class="list_content">${받아올꺼야}</div>
							</div>
							<div class="comment_view">
								<div class="list_writer">후후하하호호</div>
								<div class="list_time">2020-20-20</div>
								<div class="list_grade"></div>
								<div class="list_content">${받아올꺼야}</div>
							</div>
							<div class="comment_view">
								<div class="list_writer">후후하하호호</div>
								<div class="list_time">2020-20-20</div>
								<div class="list_grade"></div>
								<div class="list_content">${받아올꺼야}</div>
							</div>
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
									<span class="simple_explain">050-4826-7125</span>
								</li>
								<li>
									<span class="simple_category">업소소개</span>
									<span class="simple_explain">스벅 노원점입니다.</span>
								</li>
							</ul>
						</div>
					</div>
				</div>
				</div>
			</div>
		</div>
		<div class="footer"></div>
	</div>
</body>
</html>