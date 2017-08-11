<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<link rel="stylesheet" type="text/css" href="css/login.css">
	<link rel="stylesheet" type="text/css" href="css/common.css">
	<script type="text/javascript" src="js/jquery-1.12.1.min.js"></script>
	<script type="text/javascript" src="js/common.js"></script>
</head>
<body>
	<div class="wrap">
		<div class="header"><%@ include file="header.jsp" %></div>
		<div class="content">
			<div class="content_wrap">
				<form action="" method="post" enctype="">

						<table class="loginform">
						<colgroup>
							<col style="width:30%;">
							<col style="width:65%;">
						</colgroup>
						<tr>
							<td>이메일</td>
							<td>
								<input type="text" name="usernickname" placeholder="이메일을 입력해 주세요">
							</td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><input type="password" name="pwd" placeholder="비밀번호를 입력해 주세요"></td>
						</tr>
						<tr>
							<td colspan="2">
								<div class="find_member"><a href="">아이디 찾기 / 비밀번호 찾기</a></div>
							</td>
						</tr>
						<tr>
							<td></td>
							<td><input type="button" id="submitBtn" value="로그인 완료"></td>
						</tr>
						<tr>
							<td></td>
							<td><input type="button" id="joinBtn" value="아직회원이 아니라면? 회원가입"></td>
						</tr>
					</table>

				</form>
			</div>
		</div>
		<div class="footer"><%@ include file="footer.jsp" %></div>
	</div>
</body>
</html>