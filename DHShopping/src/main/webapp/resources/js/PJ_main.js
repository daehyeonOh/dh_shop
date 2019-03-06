$(document).ready(function(){
    // �앹뾽 - �곷떒怨좎젙�앹뾽 荑좏궎泥섎━
  	checkCookie('fpop');
    if(getCookie('fpop')=='1'){
        $('.PJ_popup_head').slideDown(300);
    }else{
        $('.PJ_popup_head').css('display','none');
    }
    $('.PJ_popup_head_btn').click(function(e) {
        if($('#PJ_popup_head_chk').prop('checked')){
            clearCookie('fpop');
            setCookie('fpop', '0', 0, '/');
            $('.PJ_popup_head').slideUp(300);
        }else{
            clearCookie('fpop');
            setCookie('fpop', '1', 0, '/');
            $('.PJ_popup_head').slideUp(300);
        }
    });
});
