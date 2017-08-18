$(function(){
	
		$('#submitBtn').click(function(){
		
		var passwd = $('input[name="passwd"]').val();
		var passwdC = $('input[name="passwdC"]').val();
		var count = 0;
		
		$('table input').each(function(){
			if($(this).val() == "" && $(this).val() != null){
				count ++;
			}
		})
		
			if(count == 0 && passwd == passwdC){
				
				$('form').submit();
				return true;
			}
			else if(count != 0){
				
				alert("모든 사항을 입력해야합니다.")
				return false;
			}
			else if(count == 0 &&pwd != pwdC ){
				alert("비밀번호를 다시 확인해주세요")
				$('input[name="password"]').focus();
				return false;
			}
			else if(pwd != pwdC){
				alert("비밀번호를 다시 확인해주세요")
				$('input[name="password"]').focus();
				return false;
			}
			else{
				return false;
			}
		})
		
		$('#checkEmail').click(function(){
		var email = $('input[name="email"]').val();
			$.ajax({
			    url : '/user/checkemail',
			    data: {"email" : email},        // 사용하는 경우에는 { data1:'test1', data2:'test2' }
			    type: 'post',       // get, post
			    timeout: 30000,    // 30초
			    dataType: 'json',  // text, html, xml, json, jsonp, script
			    beforeSend : function() {
			        // 통신이 시작되기 전에 이 함수를 타게 된다.
			    }
			}).done( function(data, textStatus, xhr ){
			    // 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
			    if(data === 1){
			    	alert("존재하는 이메일입니다.");
			    	$('input[name="email"]').val("");
			    }else{
			    	alert("사용가능한 아이디입니다.");
			    }
			})
		})
		
		$('#checkNick').click(function(){
		var usernickname = $('input[name="usernickname"]').val();
			$.ajax({
			    url : '/user/checknickname',
			    data: {"usernickname" : usernickname},        // 사용하는 경우에는 { data1:'test1', data2:'test2' }
			    type: 'post',       // get, post
			    timeout: 30000,    // 30초
			    dataType: 'json',  // text, html, xml, json, jsonp, script
			    beforeSend : function() {
			        // 통신이 시작되기 전에 이 함수를 타게 된다.
			    }
			}).done( function(data, textStatus, xhr ){
			    // 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
			    if(data === 1){
			    	alert("존재하는 닉네임");
			    	$('input[name="usernickname"]').val("");
			    }else{
			    	alert("사용가능한 닉네임");
			    }
			})
		})
})