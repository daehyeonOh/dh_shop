/**
 * This is commercial software, only users who have purchased a valid license
 * and accept to the terms of the License Agreement can install and use this
 * program.
 *
 * Do not edit or add to this file if you wish to upgrade Godomall5 to newer
 * versions in the future.
 *
 * 怨듭슜 �ㅽ겕由쏀듃 諛� �꾨줈�좏��� �뺤쓽
 *
 * @copyright �� 2016, NHN godo: Corp.
 * @link http://www.godo.co.kr
 */

/**
 * �먮컮�ㅽ겕由쏀듃 Trim�⑥닔
 *
 * @deprecated �먮컮�ㅽ겕由쏀듃 湲곕낯 �⑥닔 �뱀� $.trim() �ъ슜
 * @return string 醫뚯슦 怨듬갚 �쒓굅�� 臾몄옄��
 */
//String.prototype.trim = function () {
//    return this.replace(/^\s+|\s+$/, '');
//};

/**
 * �먮컮�ㅽ겕由쏀듃 number_format �⑥닔
 *
 * @deprecated numeral濡� ��泥�
 * @return string 臾몄옄�댁쓣 �몄옄由� �⑥쐞濡� �쇳몴 李띻린
 */
//String.prototype.number_format = function()
//{
//    return this.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
//};

// 硫��곗긽�� 蹂��� 湲곕낯泥섎━
if (typeof gdCurrencyDecimalFormat === 'undefined') {
    gdCurrencyDecimal = 0;
    gdCurrencyDecimalFormat = 0;
}

// IE9�먯꽌 console 媛앹껜媛� �놁뼱 console 媛앹껜媛� �녿뒗 寃쎌슦 log濡� �ъ슜�섎룄濡� 泥섎━
if (!window.console) console = {
    log: function () {
    }
};

// IE8 �댄븯�먯꽌 Array.indexOf 吏��먰븯吏� �딅뒗 寃쎌슦�� ���� ����
if (typeof Array.prototype.indexOf !== 'function') {
    Array.prototype.indexOf = function (ele) {
        return $.inArray(ele, this);
    };
}

// IE8 �댄븯�먯꽌 String.trim 吏��먰븯吏� �딅뒗 寃쎌슦�� ���� ����
if (typeof String.prototype.trim !== 'function') {
    String.prototype.trim = function(){
        return $.trim(this);
    };
}

// @qnibus bugfix. toFixed �ъ슜�� 臾댁“嫄� 諛섏삱由� 泥섎━�섎뒗 遺�遺꾩쑝濡� �명빐 怨좊룄紐�5�� �뺤콉怨� 留욎� �딆븘�� toFixed ���� �ъ슜�댁빞 ��
if (typeof Number.prototype.toRealFixed !== 'function') {
    Number.prototype.toRealFixed = function (digits, format) {
        if (typeof digits === 'undefined') {
            digits = gdCurrencyDecimal;
        }
        if (typeof format === 'undefined') {
            format = gdCurrencyDecimalFormat;
        }

        return numeral(Math.floor(this.valueOf() * Math.pow(10, digits)) / Math.pow(10, digits)).format('0,' + format);
    };
}

/**
 * �ㅽ듃留� 移섑솚 硫붿냼��
 * @returns {String}
 */
String.prototype.format = function () {
    var formatted = this;
    for (var i = 0; i < arguments.length; i++) {
        formatted = formatted.replace("{" + i + "}", arguments[i]);
    }
    return formatted;
};

/**
 * DOM 濡쒕뱶
 */
$(document).ready(function () {
    // 硫��� �곸젏�� �꾪븳 �뚯닔�� 泥섎━
    numeral.defaultFormat('0,' + gdCurrencyDecimalFormat);

    // IE 9 �댄븯 placeholder 泥섎━
    if (isIE() < 10) {
        $("input, textarea").placeholder();

        $('form').submit(function(e){
            $(this).find("input, textarea").each(function(){
                var _name = this.name;
                var _placeholder = this.getAttribute('placeholder');

                if (_name && _placeholder) {
                    var _target = document.getElementsByName(_name)[0];
                    if (_target.value == _placeholder) {
                        _target.value = '';
                    }
                }
            });
        });
    }

    // Ajax �먮윭 諛� 泥섎━ 湲곕낯媛� �ㅼ젙
    $.ajaxSetup({
        beforeSend: function (xhr, settings) {
            xhr.url = settings.url;
            xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));
        },
        complete: function () {
            triggerCheckboxUi();
            selectRemodeling();
            gd_checkbox_all();

            //�대�吏� 濡쒕뵫 �μ긽 �ъ슜 �� �몄텧.
            if ($.isFunction($.fn.lazyload) === true) {
                setTimeout(function() {
                    $("img.gd_image_lazy").lazyload({threshold:200});
                }, 1);
            }
        },
        error: function (xhr, textStatus, error) {
            if (xhr.status == '404' && error == 'Not Found') {
                console.log('[404 Not Found]\nThe requested URL was not found.');
            }
            else if (xhr.status == '500' && error == 'Internal Server Error' && xhr.responseText != '') {
                console.log(xhr.responseText);
            }
            closeLayer();
            console.log('Ajax Error URL: ' + xhr.url, xhr.responseText);
        }
    });

    // jQuery Validator 湲곕낯媛� �ㅼ젙
    $.validator.setDefaults({
        onfocusout: false,
        onclick: false,
        onkeyup: false,
        errorPlacement: function (error, element) {
            // do nothing
        },
        invalidHandler: function (form, validator) {
            var errors = validator.numberOfInvalids();
            if (errors) {
                alert(validator.errorList[0].message);
                validator.errorList[0].element.focus();
            }
        },
        submitHandler: function (form) {
            form.submit();
        }
    });

    // jQuery Validator 湲곕낯 硫붿떆吏� �ㅼ젙
    jQuery.extend(jQuery.validator.messages, {
        required: __("�꾩닔��ぉ �낅땲��."),
        remote: __("�� �꾨뱶瑜� �섏젙�댁＜�몄슂."),
        email: __("�대찓�쇱쓣 �뺥솗�섍쾶 �낅젰�댁＜�몄슂."),
        url: __("�좏슚�섏� �딆� URL�� �낅젰�섏뿀�듬땲��."),
        date: __("�좎쭨�뺤떇�� 留욎� �딆뒿�덈떎."),
        dateISO: __("�좏슚�� ISO ���낆쓽 �좎쭨濡� �ㅼ떆 �낅젰�댁＜�몄슂."),
        number: __("�レ옄留� �낅젰�섏떎 �� �덉뒿�덈떎."),
        digits: __("�レ옄留� �낅젰�섏떎 �� �덉뒿�덈떎."),
        creditcard: __("�좏슚�� �좎슜移대뱶 踰덊샇濡� �ㅼ떆 �낅젰�댁＜�몄슂."),
        equalTo: __("�숈씪�� 媛믪쓣 �낅젰�댁＜�몄슂."),
        accept: "Please enter a value with a valid extension.",
        maxlength: jQuery.validator.format(__("理쒕� %i �댄븯 �낅젰�� 二쇱꽭��.", "{0}")),
        minlength: jQuery.validator.format(__("理쒖냼 %i �댁긽 �낅젰�� 二쇱꽭��.", "{0}")),
        rangelength: jQuery.validator.format(__("%1$i�먯뿉�� %2$i源뚯� �낅젰媛��ν빀�덈떎.", ["{0}", "{1}"])),
        range: jQuery.validator.format(__("%1$i�� %2$i�ъ씠�� �レ옄瑜� �낅젰�댁＜�몄슂.", ["{0}", "{1}"])),
        max: jQuery.validator.format(__("理쒕� %i �댁긽 �낅젰�섏떎 �� �놁뒿�덈떎.", "{0}")),
        min: jQuery.validator.format(__("理쒖냼 %i �댄븯 �낅젰�섏떎 �� �놁뒿�덈떎.", "{0}"))
    });

    //寃��됱뼱
    $("#frmSearchTop").validate({
        submitHandler: function (form) {
            if ($("#frmSearchTop input[name='adUrl']").val() && $("#frmSearchTop input[name='keyword']").val() == '') document.location.href = $("#frmSearchTop input[name='adUrl']").val();
            else form.submit();
        },
        rules: {
            keyword: {
                required: function () {

                    if ($("#frmSearchTop input[name='adUrl']").val()) {
                        return false;
                    }
                    else {
                        return true;
                    }
                }
            }
        },
        messages: {
            keyword: {
                required: __('寃��됱뼱瑜� �낅젰�섏꽭��.')
            }
        }
    });


    // 泥댄겕諛뺤뒪 �꾩껜 �좏깮 �대깽��
    gd_checkbox_all();

    // 泥댄겕諛뺤뒪 �좏깮 �� �쇰꺼 �대옒�짞dd/Remove
    if ($(':checkbox.checkbox').length > 0) {
        $(':checkbox.checkbox').click(function (e) {
            var $target = $(e.target);
            var $label = $target.closest('p').find('label');
            if ($target.prop('checked')) {
                $label.addClass('on');
            } else {
                $label.removeClass('on');
            }
        });
    }

    if ($('button.btn-prev').length > 0) {
        $('button.btn-prev').click(function (e) {
            e.preventDefault();
            history.go(-1);
        });
    }

    // Numeral �몄뼱 �뺤쓽
    // ���吏� �대뜑�먯꽌 �ㅽ겕由쏀듃 �몄텧�댁꽌 濡쒕뱶 �쒖폒�� ��
    //numeral.language('fr', {
    //    delimiters: {
    //        thousands: ' ',
    //        decimal: ','
    //    },
    //    abbreviations: {
    //        thousand: 'k',
    //        million: 'm',
    //        billion: 'b',
    //        trillion: 't'
    //    },
    //    ordinal : function (number) {
    //        return number === 1 ? 'er' : '챔me';
    //    },
    //    currency: {
    //        symbol: '��'
    //    }
    //});
    //numeral.language('fr');


    gd_menu_over();

    // 蹂듭궗 湲곕뒫
    // https://github.com/zeroclipboard/zeroclipboard/blob/master/docs/api/ZeroClipboard.md
    if ($('.gd_clipboard').length) {
        if (navigator.userAgent.match(/MSIE 8/) !== null) {
            $('.gd_clipboard').each(function () {
                $(this).click(function () {
                    alert(__("二쇱냼瑜� �쒕옒洹� �댁꽌 蹂듭궗�댁＜�몄슂"));
                    return false;
                });
            });
        } else {
            var clipboard = new Clipboard('.gd_clipboard');
            clipboard.on('success', function (e) {
                var title = $(e.trigger).attr('title') == undefined ? '' : $(e.trigger).attr('title');
                alert('[' + title + '] '+__('�뺣낫瑜� �대┰蹂대뱶�� 蹂듭궗�덉뒿�덈떎.\nCtrl+V瑜� �댁슜�댁꽌 �ъ슜�섏꽭��.'));
                e.clearSelection();
            });
            clipboard.on('error', function (e) {
                console.error('Action:', e.action);
                console.error('Trigger:', e.trigger);
            });
        }
    }

    $(document).on('click', '.btn-alert-login', function (e) {
        var target = $(this).attr('id');
        alert(__('濡쒓렇�명븯�붿빞 蹂� �쒕퉬�ㅻ� �댁슜�섏떎 �� �덉뒿�덈떎.'));
        document.location.href = target == undefined ? "../member/login.php" : "../member/login.php?id=" + target;
        return false;
    });

    $('#ghostDepositorBanner').css('cursor', 'pointer').click(function () {
        var url = '/service/popup_ghost_depositor.php';
        var win = popup({
            url: url
            , target: 'ghostDepositorPopup'
            , width: 570
            , height: 560
            , resizable: 'no'
            , scrollbars: 'no'
        });
        win.focus();
        return win;
    });

    // 留덉씠�섏씠吏� 1:1, �곹뭹 臾몄쓽 諛� �꾧린(iframe) �ъ빱�� �ㅼ젙
    var ifrmScroll = 0;
    $('iframe[name=ifrmMyPage]').load(function () {
        var ifrmURL = $(this).get(0).contentWindow.location.href;

        // 紐⑸줉�먯꽌�� �ъ빱�� �좎�, 紐⑸줉 �� �섏씠吏� �ъ빱�� �곷떒
        if (ifrmURL.indexOf('/board/list.php') == -1) {
            $('html, body').scrollTop(0);
        } else {
            $('html, body').scrollTop(ifrmScroll);
        }

        $(this).contents().find('.board-list td a, .list li a').click(function () {
            ifrmScroll = $(document).scrollTop();
        });

        // 湲� �묒꽦, �섏젙, ��젣 諛� �섏씠吏�, 紐⑸줉 踰꾪듉 �대┃�� �ъ빱�� �곷떒
        $(this).contents().find('ul.pagination li, .boadview-reply, .boardview-list, .boarddwrite-save, .boardview-del').click(function () {
            ifrmScroll = 0;
        });
    });

    // 理쒓렐 寃��됱뼱 �ъ빱��
    $('#frmSearchTop input[name="keyword"]').focus(function(){
        if($("input[name=recentCount]").val() > 0) {
            $('.search-area').removeClass('dn');
        }
    }).blur(function(){
        $('body').click(function(e){
            if (!$('.search-area').has(e.target).length && e.target.name != 'keyword') {
                $('.search-area').addClass('dn');
            }
        });
    });

    // 理쒓렐 寃��됱뼱 ��젣
    $('.js-recent-keyword-delete').click(function(e){
        e.stopPropagation();
        $self = $(this);
        $.post('../goods/goods_ps.php', {
            'mode': 'delete_recent_keyword',
            'keyword': $(this).data('recent-keyword')
        }, function (data, status) {
            // 媛믪씠 �녿뒗 寃쎌슦 �깃났
            if (status == 'success' && data == '') {
                if ($self.closest('ul').find('li').not('.li-tit').length == 1) {
                    $self.closest('li').remove();
                    $('.js-recent-all-delete').remove();
                    $('.recent-list').append('<li class="no-data">' + __('理쒓렐 寃��됱뼱媛� �놁뒿�덈떎.') + '</li>');
                } else {
                    $self.closest('li').remove();
                }
            } else {
                console.log('request fail. ajax status (' + status + ')');
            }
        });
    });

    // 理쒓렐 寃��됱뼱 �꾩껜 ��젣
    $('.js-recent-all-delete').click(function(e){
        e.stopPropagation();
        $self = $(this);
        $.post('../goods/goods_ps.php', {
            'mode': 'delete_recent_all_keyword'
        }, function (data, status) {
            // 媛믪씠 �녿뒗 寃쎌슦 �깃났
            if (status == 'success' && data == '') {
                $self.closest('ul').find('li').not('.li-tit').remove()
                $('.js-recent-all-delete').remove();
                $('.recent-area > .recent-list').append('<li class="no-data">' + __('理쒓렐 寃��됱뼱媛� �놁뒿�덈떎.') + '</li>');
            } else {
                console.log('request fail. ajax status (' + status + ')');
            }
        });
    });
});

/*
 移댄뀒怨좊━/釉뚮옖�� 移댄뀒怨좊━ 留덉슦�� �ㅻ쾭
 */
function gd_menu_over() {

    $(document).on('mouseenter mouseleave', 'img.gd_menu_over', function (event) {
        $(this).attr({
            src: $(this).attr('data-other-src')
            , 'data-other-src': $(this).attr('src')
        });

    });

    $(document).on('mouseenter', 'span.gd_menu_over', function (event) {
        var width = $(this).closest("strong").width();
        var height = $(this).closest("strong").height() - 7;
        $(this).html("<img src='" + $(this).data('other-src') + "' style='max-width:" + width + "px;max-height:" + height + "px'>");

    });

    $(document).on('mouseleave', 'span.gd_menu_over', function (event) {
         $(this).html($(this).data('other-text'));
    });
}


/*
 泥댄겕諛뺤뒪 �꾩껜 �좏깮
 */
function gd_checkbox_all() {

    // 泥댄겕諛뺤뒪 �꾩껜 �좏깮 �대깽��
    if ($(':checkbox.gd_checkbox_all').length > 0) {
        // �대깽�� 以묐났 �ㅽ뻾�� 留됱븘以���.
        $(':checkbox.gd_checkbox_all').off('click');
        $(':checkbox.gd_checkbox_all').click(function (e) {
            var $target = $(e.target);
            var targetName = $target.data('target-name');
            var targetId = $target.data('target-id');
            var targetFormName = $target.data('target-form');
            if (typeof targetFormName == 'undefined') targetFormName = "";
            if (_.isUndefined(targetId)) {
                $(targetFormName + ' :checkbox[name="' + targetName + '"]').prop('checked', !$target.prop('checked')).trigger('click');
            } else {
                $(targetFormName + ' :checkbox[id*="' + targetId + '"]').prop('checked', !$target.prop('checked')).trigger('click');
            }
        });
    }
}

/**
 * �숈쟻 �ㅽ겕由쏀듃 諛붿씤�� (�ㅽ겕由쏀듃 濡쒕뵫 �� 硫붿꽌�� �ㅽ뻾�섎룄濡� 泥섎━)
 *
 * @author Jong-tae Ahn
 * @param number
 * @param places
 * @param symbol
 * @param thousand
 * @param decimal
 * @returns {string}
 */
function add_script(url, callback) {
    var done = false; // �ㅽ겕由쏀듃 濡쒕뵫 �щ�
    var head = document.getElementsByTagName("head")[0] || document.documentElement;
    var script = document.createElement("script");

    //script.charset = 'UTF-8';
    script.src = url;
    script.onload = script.onreadystatechange = function () {
        if (!done && (!this.readyState || this.readyState === "loaded" || this.readyState === "complete")) {
            done = true;
            callback();

            // IE�먯꽌 硫붾え由� �꾩닔 諛⑹�瑜� �꾪븳 泥섎━
            script.onload = script.onreadystatechange = null;
            if (head && script.parentNode) {
                head.removeChild(script);
            }
        }
    };

    // Use insertBefore instead of appendChild  to circumvent an IE6 bug.
    // This arises when a base node is used (#2709 and #4378).
    head.insertBefore(script, head.firstChild);
}


/**
 * �뚯뒪�� 吏꾪뻾以�
 *
 * @author Jong-tae Ahn
 * @param number
 * @param places
 * @param symbol
 * @param thousand
 * @param decimal
 * @returns {string}
 *
 * @dependency
 */
function money_format(number, places, symbol, thousand, decimal) {
    number = number || 0;
    places = !isNaN(places = Math.abs(places)) ? places : 2;
    symbol = symbol !== undefined ? symbol : "$";
    thousand = thousand || ",";
    decimal = decimal || ".";
    var negative = number < 0 ? "-" : "",
        i = parseInt(number = Math.abs(+number || 0).toFixed(places), 10) + "",
        j = (j = i.length) > 3 ? j % 3 : 0;
    return symbol + negative + (j ? i.substr(0, j) + thousand : "") + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + thousand) + (places ? decimal + Math.abs(number - i).toFixed(places).slice(2) : "");
}

/**
 * 硫붿씪 �꾨찓�� �좏깮
 */
function select_email_domain(name,select) {
    if (typeof select === 'undefined') {
        select = 'emailDomain';
    }
    var $email = $(':text[name=' + name + ']');
    var $emailDomain = $('select[id='+select+']');
    $emailDomain.on('change', function (e) {
        var emailValue = $email.val();
        var indexOf = emailValue.indexOf('@');
        if (indexOf == -1) {
            if ($emailDomain.val() === 'self') {
                $email.val(emailValue + '@');
            } else {
                $email.val(emailValue + '@' + $emailDomain.val());
            }
            $email.trigger('focusout');
        } else {
            if ($emailDomain.val() === 'self') {
                $email.val(emailValue.substring(0, indexOf + 1));
                $email.focus();
            } else {
                $email.val(emailValue.substring(0, indexOf + 1) + $emailDomain.val());
                $email.trigger('focusout');
            }
        }
    });
}

/**
 * �앹뾽李� Cookie 而⑦듃濡�
 * @param string name �앹뾽李� �대쫫 (肄붾뱶_李쎌쥌瑜�)
 * @param object elemnt elemnt
 * @return
 */
function popup_cookie(name, elemnt) {
    if (elemnt.checked === true) {
        $.cookie(name, 'true', {path: '/', expires: 1});
        var popupKind = name.split('_');
        if (popupKind[1] == 'window') {
            setTimeout('self.close()');
        } else {
            setTimeout("$('#" + name + "').hide()");
        }
    } else {
        $.cookie(name, null);
    }
    return;
}

/**
 * �덈룄�고뙘�� �몄텧
 * @param array options 李쎌젙蹂�
 * @return object Window 媛쒖껜
 */
function popup(options) {
    if (!options.width) options.width = 500;
    if (!options.height) options.height = 415;
    var status = new Array();
    $.each(options, function (i, v) {
        if ($.inArray(i, ['url', 'target']) == '-1') {
            status.push(i + '=' + v);
        }
    });
    var status = status.join(',');
    var win = window.open(options.url, options.target, status);
    return win;
}

/**
 * �듭떊�먮ℓ�ъ뾽�� �곸꽭議고쉶李�
 * @param string businessNo �ъ뾽�� 踰덊샇
 * @return
 */
function popup_bizInfo(businessNo) {
    var url = 'http://www.ftc.go.kr/info/bizinfo/communicationViewPopup.jsp?wrkr_no=' + businessNo;
    var win = popup({
        url: url
        , target: 'communicationViewPopup'
        , width: 750
        , height: 700
        , resizable: 'no'
        , scrollbars: 'yes'
    });
    win.focus();
    return win;
}

/**
 * 硫붿씪 蹂대궡湲�
 * @param string toMail 硫붿씪���곸옄
 * @param string subject 硫붿씪 �쒕ぉ
 * @return
 */
function popup_email(toMail, subject) {
    if (typeof toMail === 'undefined') {
        return;
    }

    if (typeof subject === 'undefined') {
        subject = __('臾몄쓽�쒕┰�덈떎');
    }

    location.href = 'mailto:' + toMail + '?subject=' + subject;
}

/**
 * �꾨줈紐� 二쇱냼 李얘린 (�앹뾽)
 *
 * @author artherot
 * @param string zoneCodeID zonecode input ID
 * @param string addrID address input ID
 * @param string zipCodeID zipcode input ID
 */
function postcode_search(zoneCodeID, addrID, zipCodeID) {
    var win = popup({
        url: '../share/postcode_search.php?zoneCodeID=' + zoneCodeID + '&addrID=' + addrID + '&zipCodeID=' + zipCodeID,
        target: 'postcode',
        width: 500,
        height: 450,
        resizable: 'yes',
        scrollbars: 'yes'
    });
    win.focus();
    return win;
}

/**
 * PG 愿��� �곸닔利� 蹂닿린
 *
 * @author artherot
 * @param string modeStr 移대뱶, �꾧툑�곸닔利� 醫낅쪟 (card, cash)
 * @param string orderNo 二쇰Ц 踰덊샇
 */
function pg_receipt_view(modeStr, orderNo) {
    // �ъ씠利덈� 誘몃━ �ㅼ젙 - �먮룞�쇰줈 李쎌씠 而ㅼ�吏� �딆븘 誘몃━ �ㅼ젙��
    var preWidth = 430;
    var preHeight = 700;

    // 誘몃━ �앹뾽李쎌쓣 �꾩슦湲�
    var prePopupData = {
        'url': 'about:blank',
        'target': 'show_receipt',
        'width': preWidth,
        'height': preHeight
    };
    var show_receipt = popup(prePopupData);

    // 媛� PG蹂� �곸닔利� �앹뾽李�
    $.post('../share/show_receipt.php', {
        mode: modeStr,
        orderNo: orderNo
    }, function (data) {
        var infoData = data;
        if (typeof infoData['error'] == 'undefined') {
            popup(infoData);
        }
        else {
            alert(infoData['error']);
            show_receipt.close();
        }
    }, 'json');
}

/**
 * 荑쇰━�ㅽ듃留곴컪 李얘린
 * @param query
 * @param variable
 * @returns {string}
 */
function getQueryVariable(query, variable) {
    var vars = query.split('&');
    for (var i = 0; i < vars.length; i++) {
        var pair = vars[i].split('=');
        if (decodeURIComponent(pair[0]) == variable) {
            return decodeURIComponent(pair[1]);
        }
    }
    console.log('Query variable %s not found', variable);
}

function resize_frame(obj) {
    var iframeHeight = (obj).contentWindow.document.body.clientHeight;
    (obj).height = iframeHeight + 80;
}

/**
 * �뚯썝�ㅼ슫濡쒕뱶 荑좏룿 留곹겕 �ㅼ슫 諛쏄린
 *
 * @param couponNo
 */
function couponLinkDown(couponNo) {
    var params = {
        mode: "couponDownLink",
        couponCode: couponNo
    };
    $.ajax({
        method: "POST",
        cache: false,
        url: "/mypage/coupon_link_down.php",
        data: params,
        success: function (data) {
            result = JSON.parse(data);
            alert(result['msg']);
        },
        error: function (data) {
            alert(result['msg']);
        }
    });
}

/**
 * 鍮꾪쉶�� 媛쒖씤�뺣낫 �섏쭛��ぉ �숈쓽 留곹겕
 */
function redirectCollectionAgree() {
    window.open('/service/private.php');
}


var gdAjaxUpload = {
    upload : function(data) {
        var formData = new FormData();
        for (var k in data.params){
            if (data.params.hasOwnProperty(k)) {
                formData.append(k, data.params[k]);
            }
        }
        if(data.onbeforeunload){
            window.onbeforeunload = data.onbeforeunload;
            data.formObj.on("submit", function () {
                window.onbeforeunload = null;
            });
        }

        if(data.formObj.find('[name=uploadType][value=ajax]').length < 1) {
            data.formObj.append('<input type="hidden"  name="uploadType" value="ajax" >');
        }
        var index = data.thisObj.closest('form').find('input:file').index(data.thisObj);
        formData.append('uploadFile', data.thisObj[0].files[0]);

        $.ajax({
            url: data.actionUrl,
            type: 'POST',
            data: formData,
            async: false,
            cache: false,
            contentType: false,
            processData: false,
            dataType: 'json',
            success: function (returnData) {
                returnData['index'] = index;
                if(returnData.result == 'ok') {
                    if ($('input[name="uploadFileNm[' + index + ']"]').length == 0) {
                        data.formObj.append("<input type='hidden' name='uploadFileNm[" + index + "]' value='" + returnData.uploadFileNm + "'>");
                        data.formObj.append("<input type='hidden' name='saveFileNm[" + index + "]' value='" + returnData.saveFileNm + "'>");
                    }
                    else {
                        $("input[name='uploadFileNm[" + index + "]']").val(returnData.uploadFileNm);
                        $("input[name='saveFileNm[" + index + "]']").val(returnData.saveFileNm);
                    }
                    if(typeof data.successAfter == 'function') {
                        data.successAfter(returnData);
                    }
                }
                else if(returnData.result == 'cancel'){
                    if ($("input[name='uploadFileNm[" + index + "]']").length >0) {
                        $("input[name='uploadFileNm[" + index + "]']").remove();
                        $("input[name='saveFileNm[" + index + "]']").remove();
                    }
                }
                else {
                    gdAjaxUpload.isSuccess = false;
                    $('label[for=attach'+(index+1)+'] .text').val('');  //�뚯씪�쒖뒪�� �띿뒪�� 鍮덇컪 泥섎━
                    alert(returnData.errorMsg);
                    if(typeof data.failAfter == 'function') {
                        data.failAfter(returnData);
                    }
                }
            }
        });
    }
}

/**
 * 湲곗��뷀룓 �섏쑉蹂���
 *
 * @param price 湲덉븸
 * @param isFormat �щ㎎�щ�
 * @returns {*}
 */
function gd_money_format(price, isFormat) {
    var convertPrice = fx.convert(price).toRealFixed();
    if (typeof isFormat !== 'undefined') {
        if (isFormat) {
            return numeral().unformat(convertPrice);
        }
    }

    return convertPrice;
}

/**
 * 異붽��뷀룓 �섏쑉蹂���
 *
 * @param price 湲덉븸
 * @param isFormat �щ㎎�щ�
 * @returns {*}
 */
function gd_add_money_format(price, isFormat) {
    var convertPrice = fx.convert(price, {to: gdCurrencyAddCode}).toRealFixed(gdCurrencyAddDecimal, gdCurrencyAddDecimalFormat);
    if (typeof isFormat !== 'undefined') {
        if (isFormat) {
            return numeral().unformat(convertPrice);
        }
    }

    return convertPrice;
}

/*** �ㅽ넗由ъ� 吏��� �щ� ***/
function supports_html5_storage() {
    try {
        return 'localStorage' in window && window['localStorage'] !== null;
    } catch (e) {
        return false;
    }
}

/*** �몄뀡 �ㅽ넗由ъ� ���� ***/
function saveSession(control_key, control_value) {
    if (!supports_html5_storage()) {
        createCookie(control_key, control_value, 7);
    } else {
        sessionStorage[control_key] = control_value;
    }
};

/*** �몄뀡 �ㅽ넗由ъ� 濡쒕뱶 ***/
function loadSession(control_key) {
    var control_value;
    if (!supports_html5_storage()) {
        control_value = readCookie(control_key);
    } else {
        control_value = sessionStorage[control_key];
    }
    return control_value;
};

/*** 濡쒖뺄 �ㅽ넗由ъ� ���� ***/
function saveVal(control_key, control_value) {
    if (!supports_html5_storage()) {
        createCookie(control_key, control_value, 7);
    } else {
        localStorage.setItem(control_key, control_value);
    }
};

/*** 濡쒖뺄 �ㅽ넗由ъ� 濡쒕뱶 ***/
function loadVal(control_key) {
    var control_value;
    if (!supports_html5_storage()) {
        control_value = readCookie(control_key);
    } else {
        control_value = localStorage.getItem(control_key);
    }
    return control_value;
};

/*** IE 踰꾩쟾 泥댄겕 ***/
function isIE () {
    var nav = navigator.userAgent.toLowerCase();
    if (nav.indexOf('msie') != -1) {
        return parseInt(nav.split('msie')[1]);
    } else {
        return false;
    }
}
