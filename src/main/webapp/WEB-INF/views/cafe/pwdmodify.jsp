<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<link rel="stylesheet" type="text/css" href="/resources/css/pwdmodify.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
	<script type="text/javascript" src="/resources/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="/resources/js/common.js"></script>
</head>
<body>
	<div class="wrap">
		<div class="header"><%@ include file="header.jsp" %></div>
		<div class="content">
			<div class="content_wrap">
				<form action="" method="post" enctype="">
					<div class="modifytitle">비밀번호 수정 <div class="line"></div></div>
					<table class="modifyform">
						<colgroup>
							<col style="width:30%;">
							<col style="width:65%;">
						</colgroup>
						<tr>
							<td>현재 비밀번호</td>
							<td><input type="password" name="pwd" placeholder="현재 비밀번호를 입력해 주세요"></td>
						</tr>
						<tr>
							<td>새로운 비밀번호</td>
							<td><input type="password" name="pwd" placeholder="새로운 비밀번호를 입력해 주세요"></td>
						</tr>
						<tr>
							<td>새로운 비밀번호 확인</td>
							<td><input type="password" name="pwdC" placeholder="새로운 비밀번호를 한번더 입력해 주세요"></td>
						</tr>
						<tr>
							<td colspan="2"><input type="button" id="submitBtn" value="비밀번호수정 완료"></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
		<div class="footer"><%@ include file="footer.jsp" %></div>
	</div>
</body>
</html>