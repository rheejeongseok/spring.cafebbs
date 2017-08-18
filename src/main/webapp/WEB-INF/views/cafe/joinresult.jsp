<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<link rel="stylesheet" type="text/css" href="/resources/css/joinresult.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
	<script type="text/javascript" src="/resources/js/jquery-1.12.1.min.js"></script>
	<script type="text/javascript" src="/resources/js/common.js"></script>
    <script>
    $(function(){
    	$('#submitBtn').click(function(){
    		$('form').submit();
    		/* window.location.href="/"; */
    	})
    })
    </script>
</head>
<body>
	<div class="wrap">
		<div class="header"><%@ include file="header.jsp" %></div>
		<div class="content">
			<div class="content_wrap">
				<div class="result_wrap">
                    <div class="text">
                    회원가입을 축하드립니다. <br />
                    <a href="/user/login">여기를 누르면 로그인창으로 넘어갑니다.</a>
                    </div>
                </div>
			</div>
		</div>
		<div class="footer"><%@ include file="footer.jsp" %></div>
	</div>
</body>
</html>