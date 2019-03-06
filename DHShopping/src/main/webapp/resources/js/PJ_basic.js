$(document).ready(function(){
    point_ballon_down();
    PJ_allCategoryLayer();
		//getInstagramImages(12);
});
$(window).load(function(){
    goods_img_height();
});

// �곸꽭�섏씠吏� - ���쒖씠誘몄� �믪씠議곗젙
function goods_img_height(){
    if($(".goods-view .goods #mainImage img").height()){
      var temp = $(".goods-view .goods #mainImage img").height();
      $(".goods-view .goods .image .thumbnail").css('height',temp);
    }
}

// �섎떒 - �명꽣�룸콉�� 諛붾줈媛�湲�
function select_URL(url) {
    if(url == "first") {
        return false;
    }else{
        window.open(url);
    }
}

// �곷떒 - �곷┰湲� �꾩씠肄�
function point_ballon_up(){
    $('.top_point').animate({top:20}, 400, null, point_ballon_down);
}
function point_ballon_down(){
    $('.top_point').animate({top:22}, 400, null, point_ballon_up);
}

// �곷떒 - �꾩껜 移댄뀒怨좊━ �덉씠��
function PJ_allCategoryLayer(){
    $(document).on('click','.PJ_head_3 .all-category .all-category-layer > div > button',function(){
        $(this).parent().parent().removeClass('db');
    });
    $('html').click(function(e) {
        if($(e.target).closest('.PJ_head_3 .all-category > .all-category-layer').length === 0) {
            $('.PJ_head_3 .all-category > .all-category-layer').removeClass('db');
        }
    });
}

// 荑좏궎 - CHECK
function checkCookie(cname) {
   var user=getCookie(cname);
   if (user != "" && user != null ) {
   } else {
	   clearCookie(cname);
	   setCookie( cname, '1', 0, '/' );
   }
}

// 荑좏궎 - SET
function setCookie( name, value, expires, path, domain, secure ){
	var curCookie = name + "=" + escape( value ) +
		( ( expires ) ? "; expires=" + expires.toGMTString() : "" ) +
		( ( path ) ? "; path=" + path : "" ) +
		( ( domain ) ? "; domain=" + domain : "" ) +
		( ( secure ) ? "; secure" : "" );
	document.cookie = curCookie;
}

// 荑좏궎 - CLEAR
function clearCookie( name ){
    var today = new Date();
    var expire_date = new Date(today.getTime() - 60*60*24*1000);
    document.cookie = name + "= " + "; expires=" + expire_date.toGMTString();
}

// 荑좏궎 - GET
function getCookie( name ){
	var dc = document.cookie;
	var prefix = name + "="
	var begin = dc.indexOf("; " + prefix);
	if ( begin == -1 ){
		begin = dc.indexOf(prefix);
		if (begin != 0) return null;
	}
	else begin += 2
	var end = document.cookie.indexOf(";", begin);
	if (end == -1) end = dc.length;
	return unescape(dc.substring(begin + prefix.length, end));
}

/* instagram 怨꾩젙�� 理쒓렐 寃뚯떆臾� 媛��몄삤湲� */
function getInstagramImages(count) {
		$.ajax({
					method: "GET",
					cache: false,
					dataType : 'json',
					url: "https://api.instagram.com/v1/users/self/media/recent/?access_token=3832280723.9dfe9ca.b1152856cd2f470ca9828d8140a195a4&callback=?",
					data: "count="+count,	/* 寃뚯떆�� �ъ쭊 �� */
					success: function(data) {
						if (data.data == null || data.data == 'undefined') {
               $('.PJ_instagram .widget_title').html('');
							 $('.PJ_instagram .widget_list').html('');
            } else {
							var instaTitle = '@'+data.data[0]['user']['username'];
							var instaList = '<ul>';
							$.each(data.data, function (instaKey, instaVal) {
									 instaList += '<li><a href="'+instaVal['link']+'" target="_blank"> <img src="'+instaVal['images']['low_resolution'].url+'"></a></li>';
							});
							instaList += '</ul>';

							$('.PJ_instagram .widget_title').html(instaTitle);
							$('.PJ_instagram .widget_list').html(instaList);
						}
					},
					error: function (data) {
							alert(data.message);
					}
			});
}
