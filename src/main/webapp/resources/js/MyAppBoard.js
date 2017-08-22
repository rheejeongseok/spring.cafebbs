/**
 * 
 */

var MyApp = {};


var download = function download(tempfilename,filename) {
	var f = document.createElement('form');
	f.setAttribute('method','post');
	f.setAttribute('action','/download');
	f.setAttribute('enctype','application/x-www-form-urlencoded');
	document.body.appendChild(f);

	var i = document.createElement('input'); //input element, hidden
	i.type = 'text';
	i.name = 'tempfilename';
	i.value = tempfilename;
	f.appendChild(i);
	
	var i = document.createElement('input'); //input element, hidden
	i.type = 'text';
	i.name = 'filename';
	i.value = filename;
	f.appendChild(i);
	
	f.submit();
};
 
var sendPost = function sendPost(url,params) {
	
	var f = document.createElement('form');
	f.setAttribute('method','post');
	f.setAttribute('action',url);
	f.setAttribute('enctype','application/x-www-form-urlencoded');
	document.body.appendChild(f);

	for(var element in params){
		if(typeof params[element] != 'function'){
			
			var i = document.createElement('input');
			i.type = 'text';
			i.name = element;
			i.value = params[element];
			f.appendChild(i);
			
		}
	}
	f.submit();
};


var deleteAttachFile = function deleteAttachFile(attachfileno) {
	var chk = confirm("정말로 삭제하시겠습니까?");
	if (chk==true) {

	    $.ajax({
	        url : '/board/attachfiledelete',
	        data: { 'attachfileno': attachfileno },   // 사용하는 경우에는 { data1:'test1', data2:'test2' }
	        type: 'post',       // get, post
	        timeout: 30000,     // 30초
	        dataType: 'html',   // text, html, xml, json, jsonp, script
	    }).done( function(data, textStatus, xhr ){
	        // 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
	        if(data == 1 ){
	            $('#attachfilelist a[attachfileno="'+attachfileno+'"]').parents().remove();
	        }
	        else {
	            alert( '댓글 삭제 실패');
	        }
	    });
	    
	    return false;
	}
};

var commentadd = function commentadd(cafeno, content,grade) {

    $.ajax({
        url : '/commentadd',
        data: { 'cafeno': cafeno, 'content': content,'grade':grade },   // 사용하는 경우에는 { data1:'test1', data2:'test2' }
        type: 'post',       // get, post
        timeout: 30000,     // 30초
        dataType: 'json',   // text, html, xml, json, jsonp, script
    }).done( function(data, textStatus, xhr ){
        // 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.    	
    	if(data != null ){
        	
    			$('.comment_list').prepend('<div class="comment_view'+data.num+'" commentno='+data.num+'></div>');
    			$('.comment_view'+data.num+'').append('<div class="btns'+data.num+'"></div>');
    			$('.btns'+data.num+'').append('<button class="modifyBtn" commetno="'+data.num+'">수정</button> <button class="deleteBtn" commetno="'+data.num+'">삭제</button>');
                $('.comment_view'+data.num+'').append('<div class="list_writer'+data.num+'">'+data.usernickname+'</div><div class="list_time'+data.num+'">'+data.time+'</div><div class="gradeScore'+data.num+'" style="display:none;">'+data.grade+'</div><div class="list_grade'+data.num+'"></div><div class="modifyBtns'+data.num+'"></div>');
                $('.comment_view'+data.num+'').append('<div class="list_content'+data.num+'"></div>');
                $('.list_content'+data.num+'').append('<div class="content_text'+data.num+'">'+data.content+'</div>');
                $('.write_content textarea').val("");
                
                var score = $(".gradeScore"+data.num).text();
                $('.list_grade'+data.num).rateYo({
                	
                	rating:score,
                	starWidth:"15px",
                	readOnly:true
                	
                })
                
                $('.write_grade .jq-ry-rated-group').css('width',0);
                
                /*location.reload();*/
        }
    	
        else {
            alert( '댓글 삭제 실패');
        }

    });
    
    return false;
}

var commentupdate = function commentupdate(commentno,content,cafeno) {
    var textarea = $('div[commentno^="' + commentno + '"]').find('div[class^="content_text"] textarea').val().replace(/\n/g, "<br>");
    
    $.ajax({
        url : '/commentupdate',
        data: { 'commentnoo': commentno, 'content' : content, 'cafeno':cafeno },   // 사용하는 경우에는 { data1:'test1', data2:'test2' }
        type: 'post',       // get, post
        timeout: 30000,     // 30초
        dataType: 'html',   // text, html, xml, json, jsonp, script
    }).done( function(data, textStatus, xhr ){
        // 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
        if(data == 1 || data == 0){
        	var repT = $('div[commentno^="' + commentno + '"]').find('div[class^="content_text"] textarea').val().replace(/\n/g, "<br>");
            $('div[commentno^="' + commentno + '"]').find('div[class^="content_text"]').children('textarea').remove();
            $('div[commentno^="' + commentno + '"]').find('div[class^="content_text"]').html(repT);
        }
        else {
            alert( '댓글 수정 실패');
        }
    });
    
    return false;
}

var commentdelete = function commentdelete(commentno) {
    var chk = confirm("정말로 삭제하시겠습니까?");
    if (chk==true) {

        $.ajax({
            url : '/commentdelete',
            data: { 'commentnoo': commentno },   // 사용하는 경우에는 { data1:'test1', data2:'test2' }
            type: 'post',       // get, post
            timeout: 30000,    // 30초
            dataType: 'json',  // text, html, xml, json, jsonp, script
        }).done( function(data, textStatus, xhr ){
            // 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
            if(data > 0){
                $('div[commentno="' + commentno +'"]').remove();
            }
            else {
                alert( '댓글 삭제 실패');
            }
        });
        
        return false;
    }
}

var morecafelist = function morecafelist(lastcafeno,listlast,brand,cafebigtype) {
    
    $.ajax({
        url : '/morecafelist',
        data: { 'lastcafeno': lastcafeno,'listlast':listlast, 'brand':brand,'cafebigtype':cafebigtype},   // 사용하는 경우에는 { data1:'test1', data2:'test2' }
        type: 'post',       // get, post
        timeout: 30000,     // 30초
        dataType: 'json',   // text, html, xml, json, jsonp, script
        
    }).done( function(data, textStatus, xhr ){
        // 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
    	var last = 0;
    	var lastcafeno = $('.maxcafe').attr('maxcafe');
    	
    	console.log(data.brand)
    	
    	if(data.brand == 0){
    		
    			for(var i=0; i<=11; i++){
        		
        		if(i%3 == 0){
        			$('div[class^=cafelist]').last().after('<div class="cafelist" cafeno='+data.bigcafelist[i].cafeno+' brand='+data.bigcafelist[i].brand+'></div>');
        		}else{
        			$('div[class^=cafelist]').last().after('<div class="cafelist" cafeno='+data.bigcafelist[i].cafeno+' brand='+data.bigcafelist[i].brand+' style="margin-left:6px;"></div>');
        		}
        		
        		$('div[cafeno='+data.bigcafelist[i].cafeno+']').append('<div class="list_l"></div><div class="list_r"></div>');
        		
        		var list_l = $('div[cafeno='+data.bigcafelist[i].cafeno+'] .list_l');
        		
        		if(data.bigcafelist[i].brand == "스타벅스"){
        			list_l.append('<img src="/resources/img/starbucks.png">')
        		}else if(data.bigcafelist[i].brand == "할리스"){
        			list_l.append('<img src="/resources/img/hollys.png">')
        		}else if(data.bigcafelist[i].brand == "카페베네"){
        			list_l.append('<img src="/resources/img/hollys.png">')
        		}else if(data.bigcafelist[i].brand == "이디야"){
        			list_l.append('<img src="/resources/img/ediya.png">')
        		}else if(data.bigcafelist[i].brand == "탐탐"){
        			list_l.append('<img src="/resources/img/tomntom.png">')
        		}else if(data.bigcafelist[i].brand == "커피빈"){
        			list_l.append('<img src="/resources/img/coffeebean.png">')
        		}else if(data.bigcafelist[i].brand == "개인카페"){
        			list_l.append('<img src="/resources/img/personcafe.png">')
        		}
        		
        		var list_r = $('div[cafeno='+data.bigcafelist[i].cafeno+'] .list_r') 
        		list_r.append('<div class="list_title">'+data.bigcafelist[i].cafename+'</div><div class="gradeScore">'+data.bigcafelist[i].avg_grade+'</div><div id="grade'+data.bigcafelist[i].cafeno+'"></div><div class="reviews">'+data.bigcafelist[i].review_count+'건의 리뷰</div><div class="cafe_info">'+data.bigcafelist[i].cafeaddr+data.bigcafelist[i].like_count+'</div>')
        		
        		var score = $('#grade'+data.bigcafelist[i].cafeno).prev('div[class^=gradeScore]').text();
        		
        		$('#grade'+data.bigcafelist[i].cafeno).rateYo({
        			rating:score,
        			starWidth:"20px",
        			readOnly:true
        		})
        		
        		last = $('div[class^=cafelist]').last().attr('cafeno');
        		
        		if(lastcafeno == last){
        			$('.moreBtn').remove();
        		}else{
        			console.log("lastcafeno = "+lastcafeno+"last = "+last)
        		}
        	}
    	}
    	
    	else if(data.brand != 0){
    		
    		for(var i=0; i<11; i++){
        		
        		if(i%3 == 0){
        			$('div[class^=cafelist]').last().after('<div class="cafelist" cafeno='+data.cafelist[i].cafeno+' brand='+data.cafelist[i].brand+'></div>');
        		}else{
        			$('div[class^=cafelist]').last().after('<div class="cafelist" cafeno='+data.cafelist[i].cafeno+' brand='+data.cafelist[i].brand+' style="margin-left:6px;"></div>');
        		}
        		
        		$('div[cafeno='+data.cafelist[i].cafeno+']').append('<div class="list_l"></div><div class="list_r"></div>');
        		
        		var list_l = $('div[cafeno='+data.cafelist[i].cafeno+'] .list_l');
        		
        		if(brand == "스타벅스"){
        			list_l.append('<img src="/resources/img/starbucks.png">')
        		}else if(brand == "할리스"){
        			list_l.append('<img src="/resources/img/hollys.png">')
        		}else if(brand == "카페베네"){
        			list_l.append('<img src="/resources/img/hollys.png">')
        		}else if(brand == "이디야"){
        			list_l.append('<img src="/resources/img/ediya.png">')
        		}else if(brand == "탐탐"){
        			list_l.append('<img src="/resources/img/tomntom.png">')
        		}else if(brand == "커피빈"){
        			list_l.append('<img src="/resources/img/coffeebean.png">')
        		}else if(brand == "개인카페"){
        			list_l.append('<img src="/resources/img/personcafe.png">')
        		}else if(brand == "호미빙"){
        			list_l.append('<img src="/resources/img/homibing.png">')
        		}else if(brand == "설빙"){
        			list_l.append('<img src="/resources/img/sealbing.png">')
        		}else if(brand == "밀탑빙수"){
        			list_l.append('<img src="/resources/img/mealtop.png">')
        		}else if(brand == "눈꽃빙수"){
        			list_l.append('<img src="/resources/img/iceflower.png">')
        		}else if(brand == "옥루몽"){
        			list_l.append('<img src="/resources/img/oclumong.png">')
        		}else if(brand == "개인빙수"){
        			list_l.append('<img src="/resources/img/personbingsoo.png">')
        		}else if(brand == "강아지"){
        			list_l.append('<img src="/resources/img/dog.png">')
        		}else if(brand == "고양이"){
        			list_l.append('<img src="/resources/img/cat.png">')
        		}else if(brand == "새"){
        			list_l.append('<img src="/resources/img/bird.png">')
        		}else if(brand == "기타"){
        			list_l.append('<img src="/resources/img/animal.png">')
        		}
        		
        		var list_r = $('div[cafeno='+data.cafelist[i].cafeno+'] .list_r') 
        		list_r.append('<div class="list_title">'+data.cafelist[i].cafename+'</div><div class="gradeScore">'+data.cafelist[i].avg_grade+'</div><div id="grade'+data.cafelist[i].cafeno+'"></div><div class="reviews">'+data.cafelist[i].review_count+'건의 리뷰</div><div class="cafe_info">'+data.cafelist[i].cafeaddr+data.cafelist[i].like_count+'</div>')
        		
        		var score = $('#grade'+data.cafelist[i].cafeno).prev('div[class^=gradeScore]').text();
        		
        		$('#grade'+data.cafelist[i].cafeno).rateYo({
        			rating:score,
        			starWidth:"20px",
        			readOnly:true
        		})
        		
        		last = $('div[class^=cafelist]').last().attr('cafeno');
        		
        		if(lastcafeno == last){
        			$('.moreBtn').remove();
        		}else{
        			console.log("lastcafeno = "+lastcafeno+"last = "+last)
        		}
        	}
    	}
    	
    	
    	
        
    });
    
    return false;
}


var clickLike = function clickLike(userno,cafeno) {
    
    $.ajax({
        url : '/clickLike',
        data: { 'userno': userno, 'cafeno' : cafeno},   // 사용하는 경우에는 { data1:'test1', data2:'test2' }
        type: 'post',       // get, post
        timeout: 30000,     // 30초
        dataType: 'html',   // text, html, xml, json, jsonp, script
    }).done( function(data, textStatus, xhr ){
        // 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
        if(data == 1){
        	$('.like_count').children('img').remove();
        	$('.like_count').append('<img src="/resources/img/like.png" class="ok_bookmark" userno="'+userno+'">')
        }
    });
    
    return false;
}

var deleteLike = function deleteLike(userno,cafeno) {
    
    $.ajax({
        url : '/deleteLike',
        data: { 'userno': userno, 'cafeno' : cafeno},   // 사용하는 경우에는 { data1:'test1', data2:'test2' }
        type: 'post',       // get, post
        timeout: 30000,     // 30초
        dataType: 'html',   // text, html, xml, json, jsonp, script
    }).done( function(data, textStatus, xhr ){
        // 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
        if(data == 1){
        	$('.like_count').children('img').remove();
        	$('.like_count').append('<img src="/resources/img/not_like.png" class="bookmark" userno="'+userno+'">')
        }
    });
    
    return false;
}

var login = function login(email,passwd) {
    
    $.ajax({
        url : '/user/login',
        data: { 'email': email, 'passwd' : passwd},   // 사용하는 경우에는 { data1:'test1', data2:'test2' }
        type: 'post',       // get, post
        timeout: 30000,     // 30초
        dataType: 'html',   // text, html, xml, json, jsonp, script
    }).done( function(data, textStatus, xhr ){
        // 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
        if(data == 1){
        	alert("로그인이 되었습니다.")
        	window.location.href = "/";
        }else if(data != 1){
        	alert("아이디,비밀번호 확인 부탁드립니다.")
        }
    });
    
    return false;
}

var findpwd = function findpwd(email,userphone) {
    
    $.ajax({
        url : '/user/findpwd',
        data: { 'email': email, 'userphone' : userphone},   // 사용하는 경우에는 { data1:'test1', data2:'test2' }
        type: 'post',       // get, post
        timeout: 30000,     // 30초
        dataType: 'text',   // text, html, xml, json, jsonp, script
    }).done( function(data, textStatus, xhr ){
        // 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
        if(data != ""){
        	alert("귀하의 비밀번호는"+data)
        }else if(data == ""){
        	alert("이메일, 전화번호를 확인해 주세요")
        }
    });
    
    return false;
}

