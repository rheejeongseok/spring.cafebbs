<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<link rel="stylesheet" type="text/css" href="/resources/css/join.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
	<script type="text/javascript" src="/resources/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="/resources/js/common.js"></script>
    <script type="text/javascript" src="/resources/js/join.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function Postcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('roadAddress').value = fullRoadAddr;
                document.getElementById('jibunAddress').value = data.jibunAddress;

                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();
    }
    
</script>
</head>
<body>
	<div class="wrap">
		<div class="header"><%@ include file="header.jsp" %></div>
		<div class="content">
			<div class="content_wrap">
				<form action="/user/join" method="post" enctype="">
					<div class="jointitle">카페로 회원가입 <div class="line"></div></div>
					<table class="joinform">
						<colgroup>
							<col style="width:30%;">
							<col style="width:65%;">
						</colgroup>
						<tr>
							<td>이메일</td>
							<td>
								<input type="text" name="email"  placeholder="이메일을 입력해 주세요">
								<input type="button" id="checkEmail" value="중복확인"> <br>
								<span class="description">
									* 실제 사용중이신 이메일 주소를 등록하셔야 각종 정보를 수신하실 수 있습니다. <br>
									* 회원정보 및 구매정보, 서비스 주요정책은 수신동의 여부와 관계없이 발송됩니다.
								</span>
							</td>
						</tr>
						<tr>
							<td>닉네임 설정</td>
							<td>
								<input type="text" name="usernickname" placeholder="닉네임을 입력해 주세요">
								<input type="button" id="checkNick" value="중복확인">
							</td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><input type="password" name="passwd" placeholder="비밀번호를 입력해 주세요"></td>
						</tr>
						<tr>
							<td>비밀번호 확인</td>
							<td><input type="password" name="passwdC" placeholder="비밀번호를 한번더 입력해 주세요"></td>
						</tr>
						<tr>
							<td>전화번호</td>
							<td><input type="text" name="userphone" placeholder="전화번호를 입력해 주세요"></td>
						</tr>
						<tr>
							<td>주소</td>
							<td>
								<input type="text" id="postcode" name="postcode" placeholder="우편번호">
								<input type="button" onclick="Postcode()" value="우편번호 찾기" id="findaddr"><br><br>
								<input type="text" id="roadAddress" name="roadAddress" class="addrtext" placeholder="도로명주소">
								<input type="text" id="jibunAddress" name="jibunAddress" class="addrtext" placeholder="지번주소">
							</td>
						</tr>
						<tr>
							<td>성별</td>
							<td>
								<select name="sex">
									<option value="남자">남자</option>
									<option value="여자">여자</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>이메일 수신동의</td>
							<td><input type="checkbox" name="emailselect"></td>
						</tr>
						<tr>
							<td colspan="2"><input type="button" id="submitBtn" value="회원가입 완료"></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
		<div class="footer"><%@ include file="footer.jsp" %></div>
	</div>
</body>
</html>