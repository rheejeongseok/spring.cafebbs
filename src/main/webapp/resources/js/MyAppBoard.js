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
    var textarea = $('div[commentno^="' + commentno + '"]').find('div[class^="content_text"] textarea').val();
    
    $.ajax({
        url : '/commentupdate',
        data: { 'commentnoo': commentno, 'content' : content, 'cafeno':cafeno },   // 사용하는 경우에는 { data1:'test1', data2:'test2' }
        type: 'post',       // get, post
        timeout: 30000,     // 30초
        dataType: 'html',   // text, html, xml, json, jsonp, script
    }).done( function(data, textStatus, xhr ){
        // 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
        if(data == 1 || data == 0){
            $('div[commentno^="' + commentno + '"]').find('div[class^="content_text"]').children('textarea').remove();
            $('div[commentno^="' + commentno + '"]').find('div[class^="content_text"]').text(textarea).replace(/\n/g, "<br>");
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
            data: { 'commentno': commentno },   // 사용하는 경우에는 { data1:'test1', data2:'test2' }
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