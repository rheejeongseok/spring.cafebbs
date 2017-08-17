$(function(){
	$('.cafe_category li').click(function(){
		var className = $(this).attr('class');
		$(this).children('a').addClass('on');
		$(this).siblings().children('a').removeClass('on');
		console.log(className);
		$('.info_l>div[class^='+className+']').addClass('on').siblings().removeClass('on')
	})

	$('.menu_title').click(function(){
		var list_ul = $(this).siblings('ul');
		console.log("리스트유엘"+list_ul.css("display"));
		if(list_ul.css('display') == "none"){
			list_ul.css("display","block");
		}
		else{
			list_ul.css("display","none");
		}
	})
})