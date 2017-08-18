<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div class="header_t">
	<div class="join">
        <c:choose>
        <c:when test="${empty user }">
        <ul>
			<li><a href="/user/join">회원가입</a></li>
			<li><a href="/user/login">로그인</a></li>
		</ul>
        </c:when>
        <c:otherwise>
        <ul>
            <li><a href="/user/myinfo">내 정보</a></li>
            <li><a href="/user/logout">로그아웃</a></li>
        </ul>
        </c:otherwise>
        </c:choose>
	</div>
	<div class="logo">
		<img src="/resources/img/logo.png">
	</div>
	<div class="searchbox">
		<img src="/resources/img/써치.png" class="search">
		<input type="text" name="" placeholder="한번 잡숴봐~">
		<img src="/resources/img/서치버튼.png" class="search_button">
	</div>
</div>
<div class="header_b"></div>