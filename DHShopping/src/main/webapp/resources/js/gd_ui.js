/**
 * This is commercial software, only users who have purchased a valid license
 * and accept to the terms of the License Agreement can install and use this
 * program.
 *
 * Do not edit or add to this file if you wish to upgrade Godomall5 to newer
 * versions in the future.
 *
 * @copyright �� 2016, NHN godo: Corp.
 * @link http://www.godo.co.kr
 * @history
 *         20150922 瑜섏씤�� | 理쒖큹�묒꽦
 *         20151209 �덉쥌�� | �덉씠��, 泥댄겕諛뺤뒪/�쇰뵒�� 遺�遺� �숈쟻而⑦뀗痢좎뿉 �곸슜�섎룄濡� �섏젙
 *                        | Placeholder�쒓굅, select2 �쒓굅
 */

/**
 * 蹂� �ㅽ겕由쏀듃 �⑥닔�� �대깽�멸� 諛붿씤�� �섏뼱 �덇린�뚮Ц�� 二쇱쓽源딄쾶 �ъ슜�댁빞 �⑸땲��.
 * �숈쟻 而⑦뀗痢좎뿉 �꾩슂�� 遺�遺꾩씠 �덈떎硫� gd_common.js�� AjaxSetting�댁뿉 �⑥닔瑜� �좊떦�섏떆湲� 諛붾엻�덈떎.
 */

// IE9�먯꽌 console 媛앹껜媛� �놁뼱 console 媛앹껜媛� �녿뒗 寃쎌슦 log濡� �ъ슜�섎룄濡� 泥섎━
if (!window.console) console = {log: function() {}};

// �덉씠�대컯�� �쇳꽣�뺣젹 �뚮윭洹몄씤
jQuery.fn.center = function() {
    var top = ($(window).height() - this.outerHeight()) / 2;
    var left = ($(window).width() - this.outerWidth()) / 2;

    // �먮룞�믪씠 �ㅼ젙
    //var contentHeight = this.find('>div').height() + 45;
    //if (this.height() != null) {
    //    this.css({
    //        height: contentHeight + 'px'
    //    });
    //}
    //if (contentHeight > 680) {
    //
    //}

    this.css({
        position:'absolute',
        margin:0,
        top: (top > 0 ? top : 0) + 'px',
        left: (left > 0 ? left : 0) + 'px',
    });

    return this;
}

//理쒖긽�� 留덉씠�섏씠吏� �덉씠��
function mypageLayer(){
    $(document).on('focusin mouseenter','.header .mypage > a',function(){
        $(this).parent().addClass('hover');
    });
    $(document).on('mouseleave','.header .mypage',function(){
        $(this).removeClass('hover');
    });
    $(document).on('focusout','.header .mypage > div a:last-child',function(){
        $(this).parent().parent().removeClass('hover');
    });
}

//�곗륫 �ъ씠�� 理쒓렐蹂몄긽�� �덉씠��
function rightSideLayer(){
    $(document).on('focusin mouseenter','#scroll-right div.list ul li > a',function(){
        $(this).parent().addClass('hover');
    });
    $(document).on('mouseleave','#scroll-right div.list ul li',function(){
        $(this).removeClass('hover');
    });
}

// LNB �덉씠�� 硫붾돱
function lnbLayer(){
    $(document).on('focusin mouseenter','.lnb > .category.type-layer > li > a',function(){
        $(this).parent().siblings().find('> a').removeClass('has-sub');
        $(this).addClass('has-sub');
        $(this).parent().siblings().find('ul').removeClass('db');
        $(this).next().addClass('db');
    });
    $(document).on('focusin mouseenter','.lnb > .category.type-layer > li ul li',function(){
        $(this).siblings().find('ul').removeClass('db');
        $(this).find('> ul').addClass('db');
        $(this).siblings().removeClass('dot-hide');
        $(this).next().addClass('dot-hide');
    });
    $(document).on('focusin mouseleave','.lnb > .category.type-layer > li ul li',function(){
        $(this).next().removeClass('dot-hide');
    });

    // 留덉슦�� �꾩썐�� 硫붾돱 �쇱젙�쒓컙 �좎�
    var setHoldingTime = 500;
    var reset;

    $('.lnb > .category.type-layer > li').on({
        mouseenter: function(){
            var self = this;
            clearTimeout(reset);
            $(self).siblings().find('ul').removeClass('db');
            $(self).siblings().find('> a').removeClass('has-sub');
        },
        mouseleave: function(){
            var self = this;
            reset = setTimeout(function(){
                $(self).find('ul').removeClass('db');
                $(self).find('> a').removeClass('has-sub');
                $(self).find('li').removeClass('dot-hide');
            }, setHoldingTime);
        }
    });
    $('.lnb > .category.type-layer li ul').on({
        mouseenter: function(){
            clearTimeout(reset);
            $(this).addClass('db');
        },
        mouseleave: function(){
            var self = this;
            reset = setTimeout(function(){
                $(self).removeClass('db');
                $(self).find('li').removeClass('dot-hide');
            }, setHoldingTime);
        }
    });
}

// LNB �몃━ 硫붾돱
function lnbLayerTree(){
    $('.lnb > .category.type-tree > li > ul > li > ul > li > ul > li:last-child').addClass('last');
}

// �꾩껜 移댄뀒怨좊━ �덉씠��
function allCategoryLayer(){
    $(document).on('click','.header .top-service .all-category .all-category-layer > div > button',function(){
        $(this).parent().parent().removeClass('db');
    });
    $('html').click(function(e) {
        if($(e.target).closest('.header .top-service .all-category > .all-category-layer').length === 0) {
            $('.header .top-service .all-category > .all-category-layer').removeClass('db');
        }
    });
}

// �ъ씠�쒕컮而⑦듃濡�
function sideSet(){
    // �ъ씠�쒕컮 �묐쾭�� �대┃�� 理쒖긽�� �대룞
    $('#scroll-right div.top a').click(
        function() {
            $('html, body').stop().animate({scrollTop: $('body').offset().top}, 300);
            return false;
        }
    );
}

// 袁몃� ���됲듃
function selectRemodeling(){
    $("select.tune").chosen({
        disable_search_threshold: 10000,
        no_results_text: __('寃��됯껐怨쇨� �놁뒿�덈떎.')
    });

    $("select.multiple-select").chosen({
        disable_search_threshold: 10000,
        no_results_text: __('寃��됯껐怨쇨� �놁뒿�덈떎.')
    });

}

// �뚯씪泥⑤� 袁몃�湲�
function fileAttach(){
    $(document).on('change', '.file-upload .file', function(){
        var i = $(this).val();
        $('label[for='+$(this).attr('id')+']').find('.text').val(i);
    });
}

// �곹뭹�곸꽭 移대뱶蹂닿린 �덉씠��
function cardFavorLayer(){
    var i = 1;
    $('.target-card').click(
        function() {
            if (i === 1) {
                $('.favor-layer').removeClass('dn');
                i = 0;
            }
            else {
                $('.favor-layer').addClass('dn');
                i = 1;
            }
            return false;
        }
    );
    $('.favor-layer .close').click(
        function() {
            $(this).parent().parent().addClass('dn');
            i = 1;
            return false;
        }
    );
}

// �곹뭹�곸꽭 �뺣�蹂닿린 �덉씠��
function zoomLayer(){
    $('.zoom-layer-open').click(
        function() {
            $('#zoom-layer').removeClass('dn');
            $('#layerDim').removeClass('dn');
            $('html').addClass('oh-space');
            $('#scroll-left, #scroll-right').addClass('dim');
            return false;
        }
    );
    $('#zoom-layer .close').click(
        function() {
            $(this).parent().parent().addClass('dn');
            $('#layerDim').addClass('dn');
            $('html').removeClass('oh-space');
            $('#scroll-left, #scroll-right').removeClass('dim');
            return false;
        }
    );
}

// �곹뭹�곸꽭 鍮꾨�湲� �몄쬆 �덉씠��
function citeLayer(){
    $('.protection').click(
        function() {
            $('.cite-layer').removeClass('dn');
            $('#layerDim').removeClass('dn');
            $('html').addClass('oh-space');
            $('#scroll-left, #scroll-right').addClass('dim');
            $('.cite-layer .wrap div .text').focus();
            return false;
        }
    );
    $('.cite-layer .close').click(
        function() {
            $(this).parent().parent().addClass('dn');
			if($('.plusreview_view_layer2').is(':visible') == true){
				$('#layerDim').css('z-index',50);
			}else{
				$('#layerDim').addClass('dn');
			}
            $('html').removeClass('oh-space');
            $('#scroll-left, #scroll-right').removeClass('dim');
            return false;
        }
    );
}

// �덉씠�� 諛뺤뒪 �대깽��
function centerLayer(){
    //$('.btn-open-layer').off('click');
    $(document).on('click', '.btn-open-layer', function() {
        // @qnibus �덉씠�� �덉뿉 �덉씠�닿� �덈뒗 寃쎌슦 醫낆냽�� 蹂댁씠吏� �딅뒗 �덉씠�닿� �대� �좎엳�� �덉씠�� 湲곗��쇰줈 center 泥섎━ �섏뼱 蹂댁뿬�� �덉씠�꾩썐�� 源⑥쭚
        $('.layer-wrap').removeAttr('style');

        var target = $(this).attr('href');
        $(target).removeClass('dn');
        $('#layerDim').removeClass('dn');
        $('html').addClass('oh-space');
        if($('#scroll-left, #scroll-right').hasClass("side-move")) {
            $('#scroll-left, #scroll-right').addClass('dim');
        }
        $(target).find('> div').center();

        return false;
    });

    $(document).on('click', '.layer-wrap .close, .layer-wrap .btn-close', function(){
        $(this).closest('.layer-wrap').addClass('dn');
        // 李쎌씠 2媛� �댁긽 �좎엳�� 寃쎌슦 Dim泥섎━ �덈릺寃�
        if (!$('.layer-wrap').is(':visible')) {
            $('#layerDim').addClass('dn');
            $('html').removeClass('oh-space');
            $('#scroll-left, #scroll-right').removeClass('dim');
        }
        return false;
    });
}

// �덉씠�� 諛뺤뒪 李쎈떕湲� (�꾩옱 �대젮 �덈뒗 李쎈쭔 �ル뒗��)
function closeLayer() {
    if ($('.layer-wrap').is(':visible') || $('#layerDim').is(':visible')) {
        if ($('.layer-wrap .close, .layer-wrap .btn-close').length > 0) {
            $('.layer-wrap .close, .layer-wrap .btn-close').trigger('click');
        } else {
            // �ㅻ쭔 �좎엳�� 寃쎌슦
            $('.layer-wrap').addClass('dn');
            $('#layerDim').addClass('dn');
            $('html').removeClass('oh-space');
            $('#scroll-left, #scroll-right').removeClass('dim');
        }
    }

}

// 怨좎젙 醫뚰몴 �덉씠��
function fixLayer(){
    var target = $('.btn-open-fixlayer');
    $(target).each(function() {
        var i = 1;
        var currentTab = $(this).attr('href');
        $(this).click(function() {
            if (i === 1) {
                $(currentTab).removeClass('dn');
                i = 0;
            }
            else {
                $(currentTab).addClass('dn');
                i = 1;
            }
            return false;
        });
        $(currentTab).find('.close').click(function() {
            $(this).parent().parent().addClass('dn');
            i = 1;
            return false;
        });
    });
}

// 留덉슦�� �ㅻ쾭�� �덉씠��
function hoverLayer(){
    var target = $('.btn-open-hoverlayer');
    $(target).each(function() {
        var currentTab = $(this).attr('href');
        $(this).on('focusin mouseenter',function(){
            $(currentTab).removeClass('dn');
        });
        $(this).on('focusout mouseleave',function(){
            $(currentTab).addClass('dn');
        });
    });
}

// 泥댄겕諛뺤뒪 泥섎━ 濡쒖쭅 珥덇린��
function initCheckboxUi() {
    $(document).on('click', 'input.radio[type=radio]', function(e){
        $(this).parents('form:first').find("input[name='" + $(this).prop("name") + "']").each(function() {
            if ($(this).prop("checked")) {
                $("label[for=" + $(this).attr("id") + "]").addClass("on");
            } else {
                $("label[for=" + $(this).attr("id") + "]").removeClass("on");
            }
        });
    });

    $(document).on('click', 'input.checkbox[type=checkbox]', function(e){
        if($(this).prop('readonly') === false) {
            if($(this).prop("checked")) {
                $("label[for="+$(this).attr("id")+"]").addClass("on");
            } else {
                $("label[for="+$(this).attr("id")+"]").removeClass("on");
            }
        } else {
            e.preventDefault();
        }
    });
}

// �쇰뵒�ㅻ컯��,泥댄겕諛뺤뒪 �대�吏��� �ㅽ겕由쏀듃
function triggerCheckboxUi() {
    var $input = $('input.radio[type=radio], input.checkbox[type=checkbox]');
    // �쒗뵆由우뿉�� check 泥섎━�� 寃쎌슦 �덉쇅泥섎━ 異붽�
    if(!$input.find('label.on')){
        $input.each(function(){
            var $item = $("label[for="+$(this).attr("id")+"]");
            if($(this).prop("checked")) {
                $item.addClass("on");
            } else {
                $item.removeClass("on");
            }
        });
    }
}


// �듦��� �덉씠��
function quickLayer(){
    //�듦��� �곷떒
    var locationTopSize = $('.quick-search.location-top').height();
    $('.quick-search.location-top').css({top:-locationTopSize});
    var locationTopControl = $('.quick-search.location-top > button');
    var locationTopClose = $('.quick-search.location-top .btn-close');
    var locationTopNum = 1;
    $(locationTopControl).click(function() {
        if (locationTopNum === 1) {
            $('.quick-search.location-top').animate({top:'0'},400);
            $(this).addClass('hide');
            locationTopNum = 0;
        }
        else {
            $('.quick-search.location-top').animate({top:-locationTopSize},400);
            $(this).removeClass('hide');
            locationTopNum = 1;
        }
    });
    $(locationTopClose).click(function() {
        $('.quick-search.location-top').animate({top:-locationTopSize},400);
        $(locationTopControl).removeClass('hide');
        locationTopNum = 1;
    });
    //�듦��� �ъ씠��
    var locationSideSize = $('.quick-search.location-side').width();
    $('.quick-search.location-side.left').css({left:-locationSideSize});
    $('.quick-search.location-side.right').css({right:-locationSideSize});
    var locationLeftControl = $('.quick-search.location-side.left > button');
    var locationRightControl = $('.quick-search.location-side.right > button');
    var locationLeftClose = $('.quick-search.location-side.left .btn-close');
    var locationRightClose = $('.quick-search.location-side.right .btn-close');
    var locationSideNum = 1;
    $(locationLeftControl).click(function() {
        if (locationSideNum === 1) {
            $('.quick-search.location-side.left').animate({left:'0'},400);
            $(this).addClass('hide');
            locationSideNum = 0;
        }
        else {
            $('.quick-search.location-side.left').animate({left:-locationSideSize},400);
            $(this).removeClass('hide');
            locationSideNum = 1;
        }
    });
    $(locationLeftClose).click(function() {
        $('.quick-search.location-side.left').animate({left:-locationSideSize},400);
        $(locationLeftControl).removeClass('hide');
        locationSideNum = 1;
    });
    $(locationRightControl).click(function() {
        if (locationSideNum === 1) {
            $('.quick-search.location-side.right').animate({right:'0'},400);
            $(this).addClass('hide');
            locationSideNum = 0;
        }
        else {
            $('.quick-search.location-side.right').animate({right:-locationSideSize},400);
            $(this).removeClass('hide');
            locationSideNum = 1;
        }
    });
    $(locationRightClose).click(function() {
        $('.quick-search.location-side.right').animate({right:-locationSideSize},400);
        $(locationRightControl).removeClass('hide');
        locationSideNum = 1;
    });

    $("#frmQuickSearch").validate({
        submitHandler: function (form) {
            form.submit();
        }
    });

}


// 移댄듃�� �덉씠��
function cartTabLayer(){
    var cartTabShow = $( '.top-service' ).offset();
    var cartTabBox = $('.cart-tab');
    var cartTabBar = $('.cart-tab .bar-bg');
    var cartTabView = $('.cart-tab .view-wrap .view');
    var btnCartTab = $('.cart-tab .btn-wrap .right .btn-carttab');
    var btnLeftTab = $('.cart-tab .btn-wrap .left > a');
    var btnOption = $('.cart-tab .btn-wrap .right .btn-option');
    var btnOptionTarget = $(btnOption).attr('href');

    var tabOpenText = __('移댄듃�� �닿린');
    var tabCloseText = __('移댄듃�� �リ린');

    if ( $(window).scrollTop() > cartTabShow.top ) {
        $(cartTabBox).show();
        $(cartTabView).addClass('dn');
    }
    else {
        $(cartTabView).addClass('dn');
        $([btnLeftTab, btnOption]).each(function() {
            $(this).removeClass('on');
        });
    }
    $(window).scroll(function() {
        if ( $(window).scrollTop() > cartTabShow.top ) {
            $(cartTabBox).fadeIn('slow');
        }
        else {
            $(cartTabView).addClass('dn');
            $(cartTabBar).removeClass('opacity');
            $([btnLeftTab, btnOption]).each(function() {
                $(this).removeClass('on');
            });
            $(btnCartTab).removeClass('on');
            $(btnCartTab).attr('title', tabOpenText);
            $(btnCartTab).text(tabOpenText);
            $(cartTabBox).fadeOut('slow').css({"bottom" : "-280px"});
        }
    });
    $(btnCartTab).click(function() {
        if (!$(this).hasClass("on")) {
            $(cartTabBox).animate({bottom:'0'},200);
            $(this).addClass('on');
            $(this).attr('title', tabCloseText);
            $(this).text(tabCloseText);
            $(cartTabView).addClass('dn');
            $(cartTabBar).addClass('opacity');
            $(btnOptionTarget).removeClass('dn');
            $(btnLeftTab).first("a").addClass('on');
            $(btnOption).removeClass('on');
            cart_tab_action("#cart-tab-today");
        }
        else {
            $(cartTabBox).animate({bottom:'-280px'},200);
            $(this).removeClass('on');
            $(this).attr('title', tabOpenText);
            $(this).text(tabOpenText);
            $(cartTabView).addClass('dn');
            $(cartTabBar).removeClass('opacity');
            $(btnLeftTab).removeClass('on');
            $(btnOption).removeClass('on');
        }
    });
    $(btnLeftTab).each(function() {
        $(this).click(function() {
            var btnLeftTabTarget = $(this).attr('href');
            var btnLeftTabLogin = $(this).attr('class');
            if(btnLeftTabLogin !='btn-alert-login') {
                $(cartTabBox).animate({bottom: '0'}, 200);
                $(this).siblings().removeClass('on');
                $(this).addClass('on');
                $(cartTabView).addClass('dn');
                $(cartTabBar).addClass('opacity');
                $(btnLeftTabTarget).removeClass('dn');
                $(btnOption).removeClass('on');
                $(btnCartTab).addClass('on');
                $(btnCartTab).attr('title', tabCloseText);
                $(btnCartTab).text(tabCloseText);
                cart_tab_action(btnLeftTabTarget);
            }
        });
    });
    $(btnOption).click(function() {
        if (!$(this).hasClass("on")) {
            $(cartTabBox).animate({bottom:'0'},200);
            $(this).addClass('on');
            $(cartTabView).addClass('dn');
            $(cartTabBar).addClass('opacity');
            $(btnOptionTarget).removeClass('dn');
            $(btnLeftTab).removeClass('on');
            $(btnCartTab).addClass('on');
            $(btnCartTab).attr('title', tabCloseText);
            $(btnCartTab).text(tabCloseText);
            cart_tab_action('#option');
        }
    });
}


// �⑥닔 �몄텧
$(document).ready(function() {
    triggerCheckboxUi();
    initCheckboxUi();
    mypageLayer();
    rightSideLayer();
    lnbLayer();
    lnbLayerTree();
    allCategoryLayer();
    sideSet();
    selectRemodeling();
    citeLayer();
    fileAttach();
    cardFavorLayer();
    centerLayer();
    fixLayer();
    hoverLayer();
    quickLayer();
    $(window).scroll(function() {
        sideSet();
    });
    if($('html *').is(".top-service") === true) {
        cartTabLayer();
    }
    $(window).resize(function() {
        // �꾩옱 �대젮吏� �덉씠�대쭔 �쇳꽣 �뺣젹
        $('.layer-wrap:visible').find('>div').center();
    });
});
