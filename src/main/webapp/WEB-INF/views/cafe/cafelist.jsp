<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<link rel="stylesheet" type="text/css" href="css/cafelist.css">
	<link rel="stylesheet" type="text/css" href="css/common.css">
	<link rel="stylesheet" type="text/css" href="css/jquery.rateyo.min.css">
	<script type="text/javascript" src="js/jquery-1.12.1.min.js"></script>
	<script type="text/javascript" src="js/common.js"></script>
	<script type="text/javascript" src="js/jquery.rateyo.min.js"></script>
	<script type="text/javascript">
		$(function () {
			$("#grade").rateYo({
			    rating: 3.2,
			    starWidth: "20px"
			});
		});
	</script>
</head>
<body>
	<div class="wrap">
		<div class="header"><%@ include file="header.jsp" %></div>
		<div class="content">
			<div class="content_wrap">
				<div class="cafe_type">
					<ul>
						<li><a href="">커피</a></li>
						<li><a href="">빙수</a></li>
						<li><a href="">룸카페</a></li>
						<li><a href="">동물카페</a></li>
					</ul>
					<div class="line"></div>
				</div>
				<div class="cafelist">
					<div class="list_l">
						<img src="img/hollys.png">
					</div>
					<div class="list_r">
						<div class="list_title">할리스_노원점</div>
						<div id="grade"></div>
						<div class="reviews">20건의 리뷰</div>
						<div class="cafe_info">11:00~22:00 / 12,000원 이상 배달</div>
					</div>
				</div>
				<div class="cafelist">
					<div class="list_l">
						<img src="img/starbucks.png">
					</div>
					<div class="list_r">
						<div class="list_title">스타벅스_노원점</div>
						<div class="reviews">33건의 리뷰</div>
						<div class="cafe_info">11:00~24:00 / 5,000원 이상 배달</div>
					</div>
				</div>
				<div class="cafelist">
					<div class="list_l">
						<img src="img/ediya.png">
					</div>
					<div class="list_r">
						<div class="list_title">이디야_노원점</div>
						<div class="reviews">66건의 리뷰</div>
						<div class="cafe_info">11:00~22:00 / 아메리카노 존맛</div>
					</div>
				</div>
				<div class="cafelist">
					<div class="list_l">
						<img src="img/tomntom.png">
					</div>
					<div class="list_r">
						<div class="list_title">탐탐_노원점</div>
						<div class="reviews">4건의 리뷰</div>
						<div class="cafe_info">11:00~22:00 / 먹지마셈; 노맛</div>
					</div>
				</div>
				<div class="cafelist">
					<div class="list_l">
						<img src="img/coffeebean.png">
					</div>
					<div class="list_r">
						<div class="list_title">커피빈_노원점</div>
						<div class="reviews">222건의 리뷰</div>
						<div class="cafe_info">11:00~22:00 / 인기상품개쩜</div>
					</div>
				</div>
				<div class="cafelist">
					<div class="list_l">
						<img src="img/bingsoo.png">
					</div>
					<div class="list_r">
						<div class="list_title">빙수_노원점</div>
						<div class="reviews">20건의 리뷰</div>
						<div class="cafe_info">11:00~22:00 / 꼬우면 시발 뭐;</div>
					</div>
				</div>
			</div>

		</div>
		<div class="footer"></div>
	</div>
</body>
</html>