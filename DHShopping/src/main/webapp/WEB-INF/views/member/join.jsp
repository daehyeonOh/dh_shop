<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/page.jspf" %>
<!doctype html>
<html lang="ko">
<head>
	<title>${defaultTitle} - Home</title>
	<%@ include file="/WEB-INF/views/include/common.jspf" %>
	<style type="text/css">
    body {
    }

    /* body > #wrap > #top : 상단 영역 */
    #top {
    }

    /* body > #wrap > #container : 메인 영역 */
    #container {
    }

    /* body > #wrap > #footer : 하단 영역 */
    #footer {
    }
    </style>
	<script type="text/javascript" src="${path}/resources/js/PJ_basic.js?ts=1510716764"></script>
    <link type="text/css" rel="stylesheet" href="${path}/resources/css/PJ_basic.css?ts=1539570207" />
</head>
<body class="body-main body-index pc"  >
<div id="wrap">
	<%@ include file="/WEB-INF/views/include/top_global.jsp" %>
	<div id="container">
		<%@ include file="/WEB-INF/views/include/left_side.jsp" %>
		<!-- 본문 시작 : start -->
		<div id="content">
<div class="join">
    <div class="top">
        <h2>회원가입</h2>
        <div>
            <span>
                <strong>01</strong>
                약관동의
            </span>
            <span class="this">
                <strong>02</strong>
                정보입력
            </span>
            <span class="end">
                <strong>03</strong>
                가입완료
            </span>
        </div>
    </div>
    <div class="join-form">
        <form id="formJoin" name="formJoin" action="http://samplejinana33.godomall.com/member/member_ps.php" method="post" novalidate="novalidate">
            <input type="hidden" name="rncheck" value="none" kl_vkbd_parsed="true">
            <input type="hidden" name="dupeinfo" value="" kl_vkbd_parsed="true">
            <input type="hidden" name="pakey" value="" kl_vkbd_parsed="true">
            <input type="hidden" name="foreigner" value="" kl_vkbd_parsed="true">
            <input type="hidden" name="adultFl" value="" kl_vkbd_parsed="true">
            <input type="hidden" name="mode" value="join" kl_vkbd_parsed="true">
            <fieldset>
                <legend>회원가입폼</legend>
                <div class="tit">
                    <h3>기본정보</h3>

                    <p>표시는 반드시 입력하셔야 하는 항목입니다.</p>
                </div>
                <!-- 회원가입/정보 기본정보 --><div class="table1">
    <table>
        <colgroup>
            <col style="width:163px;">
            <col>
        </colgroup>
        <tbody>
        <tr>
            <th class="ta-l required" aria-required="true">아이디</th>
            <td>
                <div class="txt-field">
                    <input type="text" class="text" data-pattern="gdMemberId" name="memId" id="memId" kl_vkbd_parsed="true">
                </div>
            </td>
        </tr>
        <tr class="">
            <th class="ta-l required" aria-required="true">비밀번호</th>
            <td>
                <div class="txt-field">
                    <input type="password" class="text" id="newPassword" name="memPw" autocomplete="off" placeholder="" kl_vkbd_parsed="true">
                </div>
            </td>
        </tr>
        <tr class="">
            <th class="ta-l required" aria-required="true">비밀번호 확인</th>
            <td>
                <div class="txt-field">
                    <input type="password" class="text check-id" name="memPwRe" autocomplete="off" kl_vkbd_parsed="true">
                </div>
            </td>
        </tr>
        <tr>
            <th class="ta-l required" aria-required="true">이름</th>
            <td>
                <div class="txt-field">
                    <input type="text" class="text" name="memNm" data-pattern="gdMemberNmGlobal" value="" maxlength="30" kl_vkbd_parsed="true">
                </div>
            </td>
        </tr>
        <tr>
            <th class="ta-l">이메일</th>
            <td>
                <div class="email">
                    <div class="txt-field">
                        <input type="text" class="text" name="email" id="email" value="" kl_vkbd_parsed="true">
                    </div>
                    <div class="choice-select">
                        <select name="emailDomain" id="emailDomain" class="tune" style="width: 120px; display: none;" tabindex="-1">
                            <option value="self">직접입력</option>
                            <option value="naver.com">naver.com</option>
                            <option value="hanmail.net">hanmail.net</option>
                            <option value="daum.net">daum.net</option>
                            <option value="nate.com">nate.com</option>
                            <option value="hotmail.com">hotmail.com</option>
                            <option value="gmail.com">gmail.com</option>
                            <option value="icloud.com">icloud.com</option>
                        </select><div class="chosen-container chosen-container-single chosen-container-single-nosearch" style="width: 120px;" title="" id="emailDomain_chosen"><a class="chosen-single chosen-sch" tabindex="-1"><span>직접입력</span><div><b></b></div></a><div class="chosen-drop"><div class="chosen-search"><input type="text" autocomplete="off" readonly="" tabindex="-1" kl_vkbd_parsed="true"></div><ul class="chosen-results"></ul></div></div>
                    </div>
                </div>
                <div class="form-element">
                    <input type="checkbox" class="checkbox" id="maillingFl" name="maillingFl" value="y" kl_vkbd_parsed="true">
                    <label for="maillingFl" class="">정보/이벤트 메일 수신에 동의합니다.</label>
                </div>
            </td>
        </tr>
        <tr>
            <th class="ta-l">휴대폰번호</th>
            <td>
                <div class="txt-field" style="display: inline-block;width:160px;">
                    <input type="text" id="cellPhone" name="cellPhone" class="text" maxlength="12" placeholder="- 없이 입력하세요." data-pattern="gdNum" value="" kl_vkbd_parsed="true">
                </div>
                <div class="form-element">
                    <input type="checkbox" class="checkbox" id="smsFl" name="smsFl" value="y" kl_vkbd_parsed="true">
                    <label for="smsFl" class="">정보/이벤트 SMS 수신에 동의합니다.</label>
                </div>
            </td>
        </tr>
        <tr>
            <th class="ta-l">전화번호</th>
            <td>
                <div class="txt-field" style="display: inline-block;width:160px;">
                    <input type="text" id="phone" name="phone" class="text" maxlength="12" placeholder="- 없이 입력하세요." data-pattern="gdNum" value="" kl_vkbd_parsed="true">
                </div>
            </td>
        </tr>
        <tr>
            <th class="ta-l">주소</th>
            <td>
                <div class="post">
                    <div class="txt-field" style="width:133px;">
                        <input type="text" class="text" name="zonecode" readonly="readonly" value="" kl_vkbd_parsed="true">
                        <input type="hidden" name="zipcode" value="" kl_vkbd_parsed="true">
                    </div>
                    <button class="normal-btn small3 post-search" type="button" id="btnPostcode">
                        <em>우편번호검색</em>
                    </button>
                </div>
                <div class="txt-field address">
                    <input type="text" class="text" name="address" readonly="readonly" value="" kl_vkbd_parsed="true">
                </div>
                <div class="txt-field">
                    <input type="text" class="text" name="addressSub" value="" kl_vkbd_parsed="true">
                </div>
            </td>
        </tr>
        </tbody>
    </table>
</div><!-- 회원가입/정보 기본정보 -->
                <!-- 회원가입/정보 사업자정보 --><!-- 회원가입/정보 사업자정보 -->
                <!-- 회원가입/정보 부가정보 --><!-- 회원가입/정보 부가정보 -->
            </fieldset>
            <div class="btn">
                <button type="button" class="skinbtn point1 j-cancel" id="btnCancel"><em>취소</em></button>
                <button type="button" class="skinbtn point2 j-join btn-join" value="회원가입"><em>회원가입</em>
                </button>
            </div>
        </form>
    </div>
</div>
<script type="text/javascript">
    var paycoProfile = [];
    var naverProfile = [];
    var thirdPartyProfile = Array;
    var kakaoProfile = [];

    $(document).ready(function () {
        var $formJoin = $('#formJoin');

        $(':text:first', $formJoin).focus();

        $('#btnCancel', $formJoin).click(function (e) {
            e.preventDefault();
            top.location.href = '/';
        });

        if ($('.js-datepicker').length) {
            $('.js-datepicker').datetimepicker({
                locale: 'ko',
                format: 'YYYY-MM-DD',
                dayViewHeaderFormat: 'YYYY MM',
                viewMode: 'days',
                ignoreReadonly: true,
                debug: false,
                keepOpen: false
            });
            $('.check-cal img').click(function (e) {
                $(this).prev('.js-datepicker').data('DateTimePicker').show();
            });
        }

        $('#btnPostcode').click(function (e) {
            e.preventDefault();
            $('#address-error, #addressSub-error').remove();
            $(':text[name=address], :text[name=addressSub]').removeClass('error c-red');
            postcode_search('zonecode', 'address', 'zipcode');
        });

        $('#btnCompanyPostcode').click(function (e) {
            e.preventDefault();
            $('#comAddress-error, #comAddressSub-error').remove();
            $(':text[name=comAddress], :text[name=comAddressSub]').removeClass('error c-red');
            postcode_search('comZonecode', 'comAddress', 'comZipcode');
        });



        select_email_domain('email');

        gd_member2.init($formJoin);

        $('.btn-join').click({form: $formJoin}, gd_member2.save);
    });
</script>
</div>
		<!-- 본문 끝 : end -->
	</div>
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</div>

<%@ include file="/WEB-INF/views/include/etc.jsp" %>
<div class="kl_keyboard ui-draggable ui-draggable-handle" style="top: 5555px; left: 5555px;"><div class="kl_hook"><div class="kl_kb_close_button"></div></div><div class="kl_layout"><div class="kl_set" id="kl_current_set"><div class="kl_button kl_all" onselectstart="return false;" focus="return false;"><canvas class="button_canvas" width="32" height="32">`</canvas></div><div class="kl_button kl_all" onselectstart="return false;" focus="return false;"><canvas class="button_canvas" width="32" height="32">1</canvas></div><div class="kl_button kl_all" onselectstart="return false;" focus="return false;"><canvas class="button_canvas" width="32" height="32">2</canvas></div><div class="kl_button kl_all" onselectstart="return false;" focus="return false;"><canvas class="button_canvas" width="32" height="32">3</canvas></div><div class="kl_button kl_all" onselectstart="return false;" focus="return false;"><canvas class="button_canvas" width="32" height="32">4</canvas></div><div class="kl_button kl_all" onselectstart="return false;" focus="return false;"><canvas class="button_canvas" width="32" height="32">5</canvas></div><div class="kl_button kl_all" onselectstart="return false;" focus="return false;"><canvas class="button_canvas" width="32" height="32">6</canvas></div><div class="kl_button kl_all" onselectstart="return false;" focus="return false;"><canvas class="button_canvas" width="32" height="32">7</canvas></div><div class="kl_button kl_all" onselectstart="return false;" focus="return false;"><canvas class="button_canvas" width="32" height="32">8</canvas></div><div class="kl_button kl_all" onselectstart="return false;" focus="return false;"><canvas class="button_canvas" width="32" height="32">9</canvas></div><div class="kl_button kl_all" onselectstart="return false;" focus="return false;"><canvas class="button_canvas" width="32" height="32">0</canvas></div><div class="kl_button kl_all" onselectstart="return false;" focus="return false;"><canvas class="button_canvas" width="32" height="32">-</canvas></div><div class="kl_button kl_all" onselectstart="return false;" focus="return false;"><canvas class="button_canvas" width="32" height="32">=</canvas></div><div class="kl_button kl_system kl_system_backspace" onselectstart="return false;" focus="return false;"><canvas class="system_button_canvas" width="64" height="32">Backspace</canvas></div><div class="kl_spacer"></div><div class="kl_button kl_system" onselectstart="return false;" focus="return false;"><canvas class="system_button_canvas" width="32" height="32">Tab</canvas></div><div class="kl_button kl_all" onselectstart="return false;" focus="return false;"><canvas class="button_canvas" width="32" height="32">q</canvas></div><div class="kl_button kl_all" onselectstart="return false;" focus="return false;"><canvas class="button_canvas" width="32" height="32">w</canvas></div><div class="kl_button kl_all" onselectstart="return false;" focus="return false;"><canvas class="button_canvas" width="32" height="32">e</canvas></div><div class="kl_button kl_all" onselectstart="return false;" focus="return false;"><canvas class="button_canvas" width="32" height="32">r</canvas></div><div class="kl_button kl_all" onselectstart="return false;" focus="return false;"><canvas class="button_canvas" width="32" height="32">t</canvas></div><div class="kl_button kl_all" onselectstart="return false;" focus="return false;"><canvas class="button_canvas" width="32" height="32">y</canvas></div><div class="kl_button kl_all" onselectstart="return false;" focus="return false;"><canvas class="button_canvas" width="32" height="32">u</canvas></div><div class="kl_button kl_all" onselectstart="return false;" focus="return false;"><canvas class="button_canvas" width="32" height="32">i</canvas></div><div class="kl_button kl_all" onselectstart="return false;" focus="return false;"><canvas class="button_canvas" width="32" height="32">o</canvas></div><div class="kl_button kl_all" onselectstart="return false;" focus="return false;"><canvas class="button_canvas" width="32" height="32">p</canvas></div><div class="kl_button kl_all" onselectstart="return false;" focus="return false;"><canvas class="button_canvas" width="32" height="32">[</canvas></div><div class="kl_button kl_all" onselectstart="return false;" focus="return false;"><canvas class="button_canvas" width="32" height="32">]</canvas></div><div class="kl_button kl_all" onselectstart="return false;" focus="return false;"><canvas class="button_canvas" width="32" height="32">\</canvas></div><div class="kl_spacer"></div><div class="kl_button kl_system kl_system_capslock" onselectstart="return false;" focus="return false;"><canvas class="system_button_canvas" width="32" height="32">capslock</canvas></div><div class="kl_button kl_all" onselectstart="return false;" focus="return false;"><canvas class="button_canvas" width="32" height="32">a</canvas></div><div class="kl_button kl_all" onselectstart="return false;" focus="return false;"><canvas class="button_canvas" width="32" height="32">s</canvas></div><div class="kl_button kl_all" onselectstart="return false;" focus="return false;"><canvas class="button_canvas" width="32" height="32">d</canvas></div><div class="kl_button kl_all" onselectstart="return false;" focus="return false;"><canvas class="button_canvas" width="32" height="32">f</canvas></div><div class="kl_button kl_all" onselectstart="return false;" focus="return false;"><canvas class="button_canvas" width="32" height="32">g</canvas></div><div class="kl_button kl_all" onselectstart="return false;" focus="return false;"><canvas class="button_canvas" width="32" height="32">h</canvas></div><div class="kl_button kl_all" onselectstart="return false;" focus="return false;"><canvas class="button_canvas" width="32" height="32">j</canvas></div><div class="kl_button kl_all" onselectstart="return false;" focus="return false;"><canvas class="button_canvas" width="32" height="32">k</canvas></div><div class="kl_button kl_all" onselectstart="return false;" focus="return false;"><canvas class="button_canvas" width="32" height="32">l</canvas></div><div class="kl_button kl_all" onselectstart="return false;" focus="return false;"><canvas class="button_canvas" width="32" height="32">;</canvas></div><div class="kl_button kl_all" onselectstart="return false;" focus="return false;"><canvas class="button_canvas" width="32" height="32">'</canvas></div><div class="kl_button kl_system kl_system_returnUS" onselectstart="return false;" focus="return false;"><div class="kl_system_shift"><canvas class="system_button_canvas" width="64" height="32">Return</canvas></div></div><div class="kl_spacer"></div><div class="kl_button kl_system kl_system_shiftUS" onselectstart="return false;" focus="return false;"><canvas class="system_button_canvas" width="32" height="32">shift</canvas></div><div class="kl_button kl_all" onselectstart="return false;" focus="return false;"><canvas class="button_canvas" width="32" height="32">z</canvas></div><div class="kl_button kl_all" onselectstart="return false;" focus="return false;"><canvas class="button_canvas" width="32" height="32">x</canvas></div><div class="kl_button kl_all" onselectstart="return false;" focus="return false;"><canvas class="button_canvas" width="32" height="32">c</canvas></div><div class="kl_button kl_all" onselectstart="return false;" focus="return false;"><canvas class="button_canvas" width="32" height="32">v</canvas></div><div class="kl_button kl_all" onselectstart="return false;" focus="return false;"><canvas class="button_canvas" width="32" height="32">b</canvas></div><div class="kl_button kl_all" onselectstart="return false;" focus="return false;"><canvas class="button_canvas" width="32" height="32">n</canvas></div><div class="kl_button kl_all" onselectstart="return false;" focus="return false;"><canvas class="button_canvas" width="32" height="32">m</canvas></div><div class="kl_button kl_all" onselectstart="return false;" focus="return false;"><canvas class="button_canvas" width="32" height="32">,</canvas></div><div class="kl_button kl_all" onselectstart="return false;" focus="return false;"><canvas class="button_canvas" width="32" height="32">.</canvas></div><div class="kl_button kl_all" onselectstart="return false;" focus="return false;"><canvas class="button_canvas" width="32" height="32">/</canvas></div><div class="kl_button kl_system kl_system_shift_right" onselectstart="return false;" focus="return false;"><canvas class="system_button_canvas" width="32" height="32">shift</canvas></div><div class="kl_spacer"></div><div class="kl_layout_selector kl_top_round_corners kl_bottom_round_corners"><div class="kl_layout_selector_icon_button" style="background-image: url(&quot;data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAcCAYAAAAAwr0iAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2RpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMC1jMDYwIDYxLjEzNDc3NywgMjAxMC8wMi8xMi0xNzozMjowMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDpDRTUxMjNGN0Q5RDJFMDExQkI3QkRGOUNFMzAzQThBQSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDozRUYwNDlGNzVGREQxMUUyQkM2MDk5QzBCRTQyNjExQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDozRUYwNDlGNjVGREQxMUUyQkM2MDk5QzBCRTQyNjExQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ1M1IFdpbmRvd3MiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo1OUVDNTc3RkQzNUZFMjExQjZCMkMzMkRFRjFGMDVEQSIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDpDRTUxMjNGN0Q5RDJFMDExQkI3QkRGOUNFMzAzQThBQSIvPiA8L3JkZjpEZXNjcmlwdGlv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&quot;);"></div><div class="kl_layout_selector_label_button">English</div><div class="kl_layout_list_container"><div class="kl_layout_selector_option_top"></div><div class="kl_layout_selector_option kl_layout_selector_option_middle" locale="de" style="display: none;"><div class="kl_layout_selector_icon" style="background-image: url(&quot;data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAcCAYAAAAAwr0iAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2RpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMC1jMDYwIDYxLjEzNDc3NywgMjAxMC8wMi8xMi0xNzozMjowMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDpDRTUxMjNGN0Q5RDJFMDExQkI3QkRGOUNFMzAzQThBQSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDozRUM2QzdFMjVGREQxMUUyQkM2MDk5QzBCRTQyNjExQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDozRUM2QzdFMTVGREQxMUUyQkM2MDk5QzBCRTQyNjExQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ1M1IFdpbmRvd3MiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo1OUVDNTc3RkQzNUZFMjExQjZCMkMzMkRFRjFGMDVEQSIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDpDRTUxMjNGN0Q5RDJFMDExQkI3QkRGOUNFMzAzQThBQSIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PvPidRkAAAIZSURBVHjaxJfJjuIwEIZ/h2QCLXVGQoK+cBpxbdFnHnneYp5hJK5IwA2JQxKyObanChKC09DqOWAs2ZaXpL5yVXkRxhg8M3l4cvKXy+VgNpuFk8lkEIYhPO+xTFprlGWJ/X6vdrtd6cdxHM3n88N0OsVoNIIQ4qEAbPI8zzEej7Farcb+er3+SSRYLBYYDodOAIqiwHa7Bcv2sywLGWCz2aCqKhAB+gjspoIKQ0U7eupr6sss04yKtqfpE90UTQBhGIBlsmy/tcvhcACZw4njRVF0VpadkAsp5ckunF2kIAhsgLqukaYpjsejm9inSGOZFkCSJBcA05nRbtkD/+N6nz60VuB3/QNhLCEy5WQFjJKQhYdfLQBkDU0mEHl5h7yvQT8GxB1Nb39vtIIhv7usADd0nECU5Y0f9ndG3dvFbwnp99m1kRVMdQ1APmCSlMPBjQmqAGYw6ABYsDpm8BwBaApDRK8dgKYV8Gqyi9JuVkAo6Kq2TSD4XqDdALAsjgQLAA4BWJYVBW9/FF6GAt7lJPl81NjRgRtj+CI07bamAyorSNmP1gdOmg+ayeYLAeYbO969uXZbqSsf0FpdAbhJ2uhuN1Hs/Q++iNiWEtBNxPlnAAOKwtOlw00YNkq3AJXUyAt2zhdXC4BSdgCqoCMgzVK4eiIwgH/eiRUb/o3yO+WJ4yfBnvJfBggpvza1y8RHbyKe/TT7J8AAdWw5OED9CTEAAAAASUVORK5CYII=&quot;);"></div><div class="kl_layout_selector_label">Deutsch</div></div><div class="kl_layout_selector_option kl_layout_selector_option_middle" locale="es" style="display: none;"><div class="kl_layout_selector_icon" style="background-image: url(&quot;data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAcCAYAAAAAwr0iAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2RpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMC1jMDYwIDYxLjEzNDc3NywgMjAxMC8wMi8xMi0xNzozMjowMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDpDRTUxMjNGN0Q5RDJFMDExQkI3QkRGOUNFMzAzQThBQSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDozRUM2QzdFNjVGREQxMUUyQkM2MDk5QzBCRTQyNjExQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDozRUM2QzdFNTVGREQxMUUyQkM2MDk5QzBCRTQyNjExQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ1M1IFdpbmRvd3MiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo1OUVDNTc3RkQzNUZFMjExQjZCMkMzMkRFRjFGMDVEQSIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDpDRTUxMjNGN0Q5RDJFMDExQkI3QkRGOUNFMzAzQThBQSIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/Plh1LYUAAANASURBVHjaxFfLahRBFD1VXZ2evCYT4+RlUAwRI6LRha9AluJG3Lly4cala5f+hrgQxF/wBW4UFy6igiJGwUdIHKMyYzSdzGS6p7qut6ZnMm1A0MR0Cm5Xd1Hddeqc+6gWRITtbBLb3NTk5KQzMjLi5fN5x/M8SLm1mIwxCIIAxWIxKhQKgfJ9P3t9bP+i7O+HbG8HhNjaLbPkZnUVZkc/pmZmdqjZ2dkeXVhAx8QERCaTCgBZrSL4VIBdW1UqFS8sfEbb/CdQGCYANHtqdaI5Tok5CSdeG068S83nxj0ZCJa6xmvatZWdFrEuevEH4PvpeF42Cx3WYiesX2sh61IBWJtUmqtgLNtNAKQNaKUMlMspBT9HmtYtAEP3NFTbMqRYB0DEFkWiLp9y+Gr+QyjyZ3QtAPqaEsDqscyWkEAQg1Qor3Ti5xdZx5IbjtDRWYZSEdO2mWjhXVCQ8AELgCyAamuOA4RLHkrXGJSIQFGEIifOwcsu5M4AUm8mFHVj02sAeIDKawCIdzd9o4p9pxS6Trr4/lRBHdiN3mMR/OIcnt1dxdSFTJzHbS3529zRnEvMIJIMUIMBEaMSTPH4xbNwpp9g/mYJmcwAcmNXEDypInfuFg7vUuxHD9g51O/x/1cgrHEEkFzPwFIMxJLzTaP6mJG+WMLHToJfreHIwhwGh/eh/EhzznDRdaYEN9e2QQlcmwxa1ZCM1SSKncOaS6AKwWXKT+S/432hHbfv3ELw8iqw8o6n8AcUteb/s7FPUcIH6g9WH4pjTIoQuTMDaOt2oUsGl+QLFKYN5p8bHD1/EJQfZOSWNWfD9YBMrcWAqTPQ2lHoZXH/zRu8/dgO8iRqoyfg7TmOviGFOS3x8MNraK9zEwxwRTQJBmyNbgEQcGWIidEZ9GZ/ILvXgVotoe80oSej4MsSOpYjqHocrs9K6wsV/vBsAdDa6P5XXs/bDseBSKkWEJ87yibC4erSeMwAJxkwAKR4Pqyv2fSBiNFs+UHkN6VEQ/aGD2h7TBIClNr6AjoJoMYAbBKmrq50ALCFDbktgCjgvX9d8dNjIK51dfXt/QDbIbZ8yr8ERbZXFoDH1t3o02y2HC6L7f41+yXAAGQsmY8ApwdZAAAAAElFTkSuQmCC&quot;);"></div><div class="kl_layout_selector_label">Español</div></div><div class="kl_layout_selector_option kl_layout_selector_option_middle" locale="fr" style="display: none;"><div class="kl_layout_selector_icon" style="background-image: url(&quot;data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAcCAYAAAAAwr0iAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2RpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMC1jMDYwIDYxLjEzNDc3NywgMjAxMC8wMi8xMi0xNzozMjowMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDpDRTUxMjNGN0Q5RDJFMDExQkI3QkRGOUNFMzAzQThBQSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDozRUYwNDlFRjVGREQxMUUyQkM2MDk5QzBCRTQyNjExQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDozRUYwNDlFRTVGREQxMUUyQkM2MDk5QzBCRTQyNjExQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ1M1IFdpbmRvd3MiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo1OUVDNTc3RkQzNUZFMjExQjZCMkMzMkRFRjFGMDVEQSIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDpDRTUxMjNGN0Q5RDJFMDExQkI3QkRGOUNFMzAzQThBQSIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PnftpCkAAAJPSURBVHjaxJfLbtNAFIZ/3+QWhSAhJbAIu26h+0jsWHfPC/St2PJCSJFYRarcBhTJrRxfMp4bM2MnxFUzNjA0Rz52FGt8Pp//zJmxJ6XEKc3HiS2cz+fBbDaLJ5NJEMcxfP//MgkhQAjBer3mSZKQMMuy8cXF53Q6HeP8PILneUcHX19/HBQk/fL16D0tuay2YNN7fFosXofL5fJVkjzg8vIdzs7sAIPT+nYCCwHEdgua3EHHDsuyjJPkHjc3KeqaQRHgMYIuU0+drq4+DALYLr7vgxnTL9X+lkLCjyOQ2zvo2GGjC0Oa5siyrROd6e0P631vPAKjtMmWGUAFqooad2FaY7tGIaTO9g6AMY48JyiK2gkAL0p7BnwPknUABDabag9gNP+XqdYDYGKQupsBrX9ZOpKgD0D1gg4ApY0EVcWeqv8/zgnPS/t49cKC1t0i1BkgZAewG4S/EkOU5dEeoKek5PSxBEzVQJMJJ+22KOwS1RFE2/L3GSiK3FydzIL0wQ4QRYDqBZ0iZEyCc0dLs5AHNfAUoa4B2pVALxJCuAGQwp5JE6uV2wBwlQEpfWcA6AEwC1JnFjBuqt3Z7kgDeMcVMACCH0ogEQRwJ4F+Eduj1FRk9KAVc84UQOQuAwOeIzj/vSfU2yQXG5HBpmKJtk7CBlgD6D/sxUPpsLWCQfbFB+8CcBN8NAqsA4ueDrczMnphB1BetzJpAK6PPE+BHvLVajUI4GeW9QIEzRrD9fmN8vfKJ8/8SbBW/k0DxMpfttfnNKJ845360+yXAAMAZl9qDcR+X2AAAAAASUVORK5CYII=&quot;);"></div><div class="kl_layout_selector_label">Français</div></div><div class="kl_layout_selector_option kl_layout_selector_option_middle" locale="it" style="display: none;"><div class="kl_layout_selector_icon" style="background-image: url(&quot;data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAcCAYAAAAAwr0iAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2RpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMC1jMDYwIDYxLjEzNDc3NywgMjAxMC8wMi8xMi0xNzozMjowMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDpDRTUxMjNGN0Q5RDJFMDExQkI3QkRGOUNFMzAzQThBQSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDozRUM2QzdERTVGREQxMUUyQkM2MDk5QzBCRTQyNjExQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDozRUM2QzdERDVGREQxMUUyQkM2MDk5QzBCRTQyNjExQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ1M1IFdpbmRvd3MiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo1OUVDNTc3RkQzNUZFMjExQjZCMkMzMkRFRjFGMDVEQSIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDpDRTUxMjNGN0Q5RDJFMDExQkI3QkRGOUNFMzAzQThBQSIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/Pi1y+AYAAAJrSURBVHjaxJfNbtNAEIBnY7tGUaASqsslEtwrJA6ccuAGZx6gL8E7IV6oUgWnXEJcKZBWTvy7O7PM2kljB2pb0ZKMNI6UZDzfzp/HQmsNp5QBnFjcyWTijMdjPwgCx/d9GAz+LxMRQZ7nsFgscDab5W4URS/effm8vBiewzPHg4EQDQOToO0311cfezmJvn5rIdCgswzw/h4+3N6+dKfT6Xm4XsLVxWvwnbMKQDxB0FOcy6AVgPIM5M85GN9ukiR+uP4Nc9YcJfuqvIma/618evO+F4D8/qOy3RS44EM9FjsDgO+BDOdgfLulASIskxWsVGolz2p+1/6H5yPAQlZFaC6ICjJVlGql0DjHreK5oKXaASiNkKgMUplbAdBp0lEkAghrAEgIkUwZwg4ArTsAiDUvdgCSAeIihRTtpEAn7QBaE+iiaEZgxREwXWAlAnGy18PNXtYKQdcjoBhgnadQkHpswW37iUMAnoqAaUXTklIyRB0ACZKChwMXY0PE3iDonYK4/XfPA70Z+bsuKGIGICspwIeH9ggxAIxGtSLkQYRmRJrj7o/Ag3Kg/zFH64QIpGS9BiSQILajv20OWReoPZLCPJAkNmtAOwbc0nLSAWCKUctGF3D1O441AN0BYB5MSjUigOCdORxtSxHoOgi3IqraKDZbivFtbT/scR8i3O2ExBEQAo4mZj+gTZrKCGguQsByJrcvGrLfqFYdqRSlq30ARTDUXqthHMe9ALLhsBOg2MwKt4Thnox+LTt7PgzDXgB3UdQJ4FQTDs31Fetb1uDIrwQL1hsD4JstbfN5TDHbz0qc+tXsjwADALHablodmXivAAAAAElFTkSuQmCC&quot;);"></div><div class="kl_layout_selector_label">Italiano</div></div><div class="kl_layout_selector_option kl_layout_selector_option_middle" locale="ja" style="display: none;"><div class="kl_layout_selector_icon" style="background-image: url(&quot;data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAcCAMAAAA3HE0QAAAAwFBMVEX////19vgAAAAAAADg4eMAAADm5uhKSkutrrBtbm9YWVqWlpeAgYKOjpBZWVqHh4mIiYuJiotWVlhWV1iBgYOGh4mGhojZ2t3a297f4OPj5Ofk5ejm5+nq6+7s7fDt7vHw8fTy8/bz3uHz3+Lz4OPz9Pf09ff19vj2o6X2pKb29vn29/n3+Pr4c3X4dnj4d3n4+Pr8Kir8Kyv8LCz8LS38Ly/9Cgv9Cwz9DA39DQ79Dg7+AAD+AQH+BQX+Bgb+BwdoW9a8AAAAF3RSTlMAAwQKCw4OFhgwMzRAQkNDQ0NERHSQked/HzUAAADISURBVHjapdFrE0JQEIDhjQohpPsFSUR3XXWU//+vmjEmmjnLTD2f35mzZxf+V6s3S9RrwAebA2oT8CC63hrluSLI1tJFLS0ZNNOaoyxTA83IA2cbJsl57+SB8RX4D5KKfHrgxyQT+7RgEZGPyKYEe1KwpQTnYhBSgqQYvKqCW9UTp1+GtPFvVi8qs7qT1J226uxYx+f1ssOOlfsK1JlhooyZCsp0MkZNpgpIo+EANRxJIHR7fVSvKwDXausdhN5uccCwjRIs8wYdcm3kooAHgAAAAABJRU5ErkJggg==&quot;);"></div><div class="kl_layout_selector_label">日本語配列</div></div><div class="kl_layout_selector_option kl_layout_selector_option_middle" locale="pl" style="display: none;"><div class="kl_layout_selector_icon" style="background-image: url(&quot;data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAcCAYAAAAAwr0iAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2RpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMC1jMDYwIDYxLjEzNDc3NywgMjAxMC8wMi8xMi0xNzozMjowMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDpDRTUxMjNGN0Q5RDJFMDExQkI3QkRGOUNFMzAzQThBQSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDozRUEzMTI1QjVGREQxMUUyQkM2MDk5QzBCRTQyNjExQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDozRUEzMTI1QTVGREQxMUUyQkM2MDk5QzBCRTQyNjExQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ1M1IFdpbmRvd3MiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo1OUVDNTc3RkQzNUZFMjExQjZCMkMzMkRFRjFGMDVEQSIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDpDRTUxMjNGN0Q5RDJFMDExQkI3QkRGOUNFMzAzQThBQSIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PraMmXQAAAFHSURBVHja7JcxT4VADMd7B+QS8A0OxIVBZ2LiZsL3/wZ+ABcGEzYVnufRO1sEIQzPvER7y2tSSCHk/7vetQ0qhAAxTUNkS5umSaqqMmVZJsYY0Pp/mbz3YK2FruuwbVsLdV1fh0jG2irP89u+759jpL8oijs9DIPhtEgba7L2tOGICJIQrMWaP1UQoxQXzehleAG4AMSfBXxpHx4BhiNo52T6QJYBHK5WAD+OoLkxSDUjbnxuXAECAajgxQBYK4xuBUACSLkzSWWAtLzbAHA6goLzAfibsIthfrZ/t2vDuN0CjxSk2UR23kpOxOE0OeIWYFm54FBaNL/HMQdKyRU/aS0AUwZGT4fit6z9pT5r4gbAUVl8MECeiwF8hhUALa395f1V7AjwbidzS2KYG/J78lJ4DHTkTwxgyA/zXdIs+ZuK/Wv2JcAAKUQeDX3mvq8AAAAASUVORK5CYII=&quot;);"></div><div class="kl_layout_selector_label">Polski</div></div><div class="kl_layout_selector_option kl_layout_selector_option_middle" locale="pt" style="display: none;"><div class="kl_layout_selector_icon" style="background-image: url(&quot;data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAcCAYAAAAAwr0iAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2RpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMC1jMDYwIDYxLjEzNDc3NywgMjAxMC8wMi8xMi0xNzozMjowMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDpDRTUxMjNGN0Q5RDJFMDExQkI3QkRGOUNFMzAzQThBQSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDozRUEzMTI1NzVGREQxMUUyQkM2MDk5QzBCRTQyNjExQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDozRUEzMTI1NjVGREQxMUUyQkM2MDk5QzBCRTQyNjExQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ1M1IFdpbmRvd3MiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo1OUVDNTc3RkQzNUZFMjExQjZCMkMzMkRFRjFGMDVEQSIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDpDRTUxMjNGN0Q5RDJFMDExQkI3QkRGOUNFMzAzQThBQSIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/Ppj36JgAAAQLSURBVHjaxFdNbBtFFP5m1+uN7WzsuDGpigutoFRACXBArVIBEhLiR6qoxKU9caFXJA7ce+KExAVxRqggOCFx4QJCSqFCKlIlEAm0EIfUdhw5sR2vvev9mR3eOHa8Tt1mW4tkpOdZr2bnffu97703y4QQOMih4IBHbH5+Xs3n83oul1N1XYei/L+YgiCA4zioVqu8WCw6sWazOXXq/bdquWQaE2ocjLE9N3n7+vqDIxABgk4HQa2OFxcXs7FCoZAutzdxKneMAGhQIgBQD4+hm0BAIQBOqQTpO2ZZll42N1Eic7kH9Pyz3oXAsDN5/8wfxf4fYBSW/jsI3LmOGGBxHV6pAuk7Ju/xgKNmNWH6dqSX4Gtr4wnBMOB77rYI5Y/Pfdi+07VILNr2mNKPIXC9EABSpsUlAPeez+U0G3lmwnzcRKKsQN18wIxRVXLqhwAIDtO1YN2FAUN18fpMCX86acQmbOjGFpxUHPykj8Q1DWqb3WcmkLLccAgCHy23A5vfyUCKdfCesYybC7OYKwZQMpTDdR2HbutYbSvIXmgg/ZmPWJPdRyYGoGIwAMB5ANOz4QTeQL1MAhW4/OR1TLcSOFJewhNrR1HJKuA5KlhV2kRfAV+eRO1iFTMfT5E4QhkQ2mdn7t/2OURYhF6XgQEAmWoy/QzVg+80STDA9HcBZn78EEuNFDEm8OwlG1uvXYB62oG36sKPt6DWlD2pp0pHzj0Enj8sQgnAIy2ER17UsGF28NPKUcy9cQu3f/0HjalHuuu/Xymi/eomHktMQzzfQLuYgEFhiRQCV6MuxEIMkGPLadMcDC2sig7aXhMVq4OLXzn496yKCjn3uECyo+LE1y7W32xAlOpI1lzwRjxaGmsEwJgcdEOfcypGgqrksBXdJFpCRzmtofCwikzjG+Rns3j08CE8tPEt/j7OkD9vQyMBphZV2WmiGfnbFQIPglGT2MWALRh+q0/hUv4qFt45g3Off4HnPrkBV1OwPHkTyrtZ2E//hcy1FJS2uEtdHlGpyY/wvTADQVcfuxmQ9mX9BAr2NDLHl3D53FlceSmFRqaNuEgjvVpA/YoO9ulE9LeXJvf2QpXQo1LMqDrJtNvdP+T8QeEFvJIu4fRTN+DNUcXM1zGxoUD5OYHEL5qM6vZzbET6jUwGAR4OgWxGMab2txlqZP35h60jWLIzOMnW8fKCBeNWHOq6MuxFYPT1iHbJeQhA0KVlG9m9RslJoIRj+OhqOYqXPU9GOxoISJWMYf8GOesD2GaA8hq8G4tIz/vj+u8JfweAIAaoHiMptEgbdJLJsQG4YgCAUxqgtVGPHNGK2Rw3AlB7hysJZpbsGXne2OdPgirZ7xKA7CBGb97PIQ8EJjvoT7P/BBgARdtOFmcozyEAAAAASUVORK5CYII=&quot;);"></div><div class="kl_layout_selector_label">Português</div></div><div class="kl_layout_selector_option kl_layout_selector_option_middle" locale="ru" style="display: none;"><div class="kl_layout_selector_icon" style="background-image: url(&quot;data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAcCAYAAAAAwr0iAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2RpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMC1jMDYwIDYxLjEzNDc3NywgMjAxMC8wMi8xMi0xNzozMjowMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDpDRTUxMjNGN0Q5RDJFMDExQkI3QkRGOUNFMzAzQThBQSIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDozRUYwNDlGMzVGREQxMUUyQkM2MDk5QzBCRTQyNjExQiIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDozRUYwNDlGMjVGREQxMUUyQkM2MDk5QzBCRTQyNjExQiIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ1M1IFdpbmRvd3MiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo1OUVDNTc3RkQzNUZFMjExQjZCMkMzMkRFRjFGMDVEQSIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDpDRTUxMjNGN0Q5RDJFMDExQkI3QkRGOUNFMzAzQThBQSIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/Pm2HIkMAAAGuSURBVHjaxFfNTgIxEJ7uAtVFTTxsTAwHPW98AXwujz6YJ30HH8ALB5O9qLhAdzutM7A/DVlQEmwnGZaWhu/r9PumIKy1EDIiCByD6XQaTyYTmaZpLKWEKPpfTsYYUEpBnuc4m80UZFl2aQMFY4skSW6KongLUf7xeHwbLRYLyWXxHYzJ2OsDR0TwSYKxGLN1QQgrNpjBbRi+D/DL/cMTXKdnsCzRC+jpKIaP+bIjUJEo5ssKVtWWEPmYhPPsmwfns33rnHmNBiptOgKaBoVDQAjRioTf94mnmefx9pp9wuO1qAWoUrsVsFQBDRX6cUMZCxKfdSpAJfkscE3ERwwjARdJ5BJA4M17wics21Z7cwSVBWsEdSg/DEgJhOmK0GiaHHqrAMNUdSteE3h5foQTErJQ5WHf5Fqxz447NmTlCFa0IGsIGCRLDIbsk8O3smts9zNHdGzY3oQeL6UGc3Md8+CPzeQoIURLoBahBfNb1Y6JX/eezobWkCiIQJJ4I1DajgAq2vv795c3CfBpx3VPYjJXlHeUqeefAjnlKxOQlOf102coyrkI/dfsR4ABAH9bW8vhkbgyAAAAAElFTkSuQmCC&quot;);"></div><div class="kl_layout_selector_label">Русский</div></div><div class="kl_layout_selector_option_bottom"></div></div></div><div class="kl_button kl_system kl_system_alt" onselectstart="return false;" focus="return false;"><canvas class="button_canvas" width="32" height="32">alt</canvas></div><div class="kl_button kl_system kl_system_space" onselectstart="return false;" focus="return false;"><canvas class="button_canvas" width="32" height="32"> </canvas></div><div class="kl_button kl_system kl_system_alt" onselectstart="return false;" focus="return false;"><canvas class="button_canvas" width="32" height="32">alt</canvas></div><div class="kl_spacer"></div></div></div></div>
</body>
</html>