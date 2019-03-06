<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/page.jspf" %>
<!doctype html>
<html lang="ko">
<head>
	<title>${defaultTitle} - Home</title>
	<%@ include file="/WEB-INF/views/include/common.jspf" %>
	<script type="text/javascript" src="${path}/resources/js/gd_payco.js"></script>
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
	<div id="route">
        <div>
            <span><a href="${path}/">Home</a></span>
            <span>로그인</span>
        </div>
    </div>
	<div id="container">
		<%@ include file="/WEB-INF/views/include/left_side_mypage.jsp" %>
		<!-- 본문 시작 : start -->
		<div id="content">
			<div class="member">
				<h2>로그인</h2>
				<div class="box">
					<h3>회원 로그인</h3>
					<form id="formLogin" method="post" action="${path}/auth/action">
			            <input type="hidden" id="mode" name="mode" value="login"/>
			            <input type="hidden" id="returnUrl" name="returnUrl" value="http%3A%2F%2Fsamplejinana33.godomall.com"/>
			            <div class="login">
			                <div class="input-info">
			                    <div>
			                        <input type="text" class="text" id="loginId" name="id" value="" placeholder="아이디" required="true">
			                    </div>
			                    <div>
			                        <input type="password" class="text" id="loginPwd" name="password" value="" placeholder="비밀번호" required="true">
			                    </div>
			                </div>
			                <button type="submit" class="skinbtn point2 l-login"><em>로그인</em></button>
			            </div>
			
			            <div class="save">
			                <input type="checkbox" class="checkbox" id="saveId" name="saveId" value="y" checked=""/>
			                <label for="saveId" class="">아이디 저장</label>
			            </div>
			            <p class="dn caution-msg1">아이디, 비밀번호가 일치하지 않습니다. 다시 입력해 주세요.</p>
			            <div class="m2"></div>
			            <div class="btn">
			                <button type="button" class="skinbtn base3 l-join" id="btnJoinMember"><em>회원가입</em></button>
			                <button type="button" class="skinbtn default l-findid" id="btnFindId"><em>아이디 찾기</em></button>
			                <button type="button" class="skinbtn default l-findpw" id="btnFindPwd"><em>비밀번호 찾기</em></button>
			            </div>
			        </form>
			        <form id="formOrderLogin" action="#" method="post">
			            <fieldset>
			                <legend>비회원 주문조회 하기</legend>
			                <input type="hidden" name="mode" value="guestOrder">
			                <input type="hidden" name="returnUrl" value="../mypage/order_view.php">
			
			                <h3 class="tit-nonmember">비회원 주문조회</h3>
			
			                <div class="login">
			                    <div class="input-info">
			                        <div>
			                            <input type="text" name="orderNm" class="text" placeholder="주문자명">
			                        </div>
			                        <div>
			                            <input type="text" name="orderNo" class="text" placeholder="주문번호">
			                        </div>
			                    </div>
			                    <button type="submit" class="skinbtn point1 l-confirm"><em>확인</em></button>
			                </div>
			            </fieldset>
			        </form>
			        <p class="js-caution caution-msg2">주문번호와 비밀번호를 잊으신 경우, 고객센터로 문의하여 주시기 바랍니다.</p>
				</div>
			</div>
			<hr>
			<script type="text/javascript" src="${path}/resources/js/jquery/jquery.serialize.object.js"></script>
			<script type="text/javascript">
			    var $formLogin;
			
			    function login_fail(url, message) {
			        $formLogin.find('.caution-msg1').removeClass('dn').text(message);
			        setTimeout(function () {
			            if (url) {
			                location.href = url;
			            }
			        }, 2000);
			    }
			
			    $(document).ready(function () {
			        $('#btnJoinMember').click(function (e) {
			            e.preventDefault();
			            location.href = '../member/join_method.php';
			        });
			        $('#btnFindId').click(function (e) {
			            e.preventDefault();
			            location.href = '../member/find_id.php';
			        });
			        $('#btnFindPwd').click(function (e) {
			            e.preventDefault();
			            location.href = '../member/find_password.php';
			        });
			
			        $('#loginId, #loginPwd').focusin(function () {
			            $('.caution-msg1', '#formLogin').addClass('dn');
			        });
			
			        $formLogin = $('#formLogin');
			        $formLogin.validate({
			            dialog: false,
			            rules: {
			                loginId: {
			                    required: true
			                },
			                loginPwd: {
			                    required: true
			                }
			            },
			            messages: {
			                loginId: {
			                    required: "아이디를 입력해주세요"
			                },
			                loginPwd: {
			                    required: "패스워드를 입력해주세요"
			                }
			            }, submitHandler: function (form) {
			                if (window.location.search) {
			                    var _tempUrl = window.location.search.substring(1);
			                    var _tempVal = _tempUrl.split('=');
			
			                    if (_tempVal[1] == 'lnCouponDown') {
			                        $('#returnUrl').val(document.referrer);
			                    }
			                }
			                form.target = 'ifrmProcess';
			                form.submit();
			            }
			        });
			
			        // 비회원 주문조회 폼 체크
			        $('#formOrderLogin').validate({
			            rules: {
			                orderNm: 'required',
			                orderNo: {
			                    required: true,
			                    number: true,
			                    maxlength: 16
			                }
			            },
			            messages: {
			                orderNm: {
			                    required: "주문자명을 입력해주세요."
			                },
			                orderNo: {
			                    required: "주문번호를 입력해주세요.",
			                    number: "숫자로만 입력해주세요.",
			                    maxlength: "주문번호는 16자리입니다."
			                }
			            },
			            submitHandler: function (form) {
			                $.post(form.action, $(form).serializeObject()).done(function (data, textStatus, jqXhr) {
			                    console.log(data);
			                    if (data.result == 0) {
			                        location.replace('../mypage/order_view.php?orderNo=' + data.orderNo);
			                    } else {
			                        $('.js-caution').empty().removeClass('caution-msg2').addClass('caution-msg1').html("주문자명과 주문번호가 일치하는 주문이 존재하지 않습니다. 다시 입력해 주세요.<br><span>주문번호와 비밀번호를 잊으신 경우, 고객센터로 문의하여 주시기 바랍니다.</span>");
			                    }
			                });
			                return false;
			            }
			        });
			    });
			</script>
		</div>
		<!-- 본문 끝 : end -->
	</div>
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</div>

<%@ include file="/WEB-INF/views/include/etc.jsp" %>

</body>
</html>
