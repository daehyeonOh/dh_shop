<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="side">
	<div class="PJ_side">
	    <div class="lnb mypage-lnb">
	        <h2>마이페이지</h2>
	        <h3>쇼핑정보</h3>
	        <ul>
	            <li><a href="../mypage/order_list.php">주문목록/배송조회</a></li>
	            <li><a href="../mypage/cancel_list.php">취소/반품/교환 내역</a></li>
	            <li><a href="../mypage/refund_list.php">환불/입금 내역</a></li>
	            <li><a href="../mypage/wish_list.php">찜리스트</a></li>
	        </ul>
	        <h3>혜택관리</h3>
	        <ul>
	            <li><a href="../mypage/coupon.php">쿠폰</a></li>
	            <li><a href="../mypage/deposit.php">예치금</a></li>
	            <li><a href="../mypage/mileage.php">마일리지</a></li>
	        </ul>
	        <h3>고객센터</h3>
	        <ul>
	            <li><a href="../mypage/mypage_qa.php">1:1 문의</a></li>
	        </ul>
	        <h3>회원정보</h3>
	        <ul>
	            <li><a href="../mypage/my_page_password.php">회원정보 변경</a></li>
	            <li><a href="../mypage/hack_out.php">회원 탈퇴</a></li>
	            <li><a href="../mypage/shipping.php">배송지 관리</a></li>
	        </ul>
	        <h3 class="my-question"><a href="../mypage/mypage_goods_qa.php">나의 상품문의</a></h3>
	        <h3 class="my-review"><a href="../mypage/mypage_goods_review.php">나의 상품후기</a></h3>
	        <hr />
	    </div>
	    <script type="text/javascript">
	        // 메뉴 선택
	        $('.mypage-lnb li > a[href*="' + document.location.pathname + '"]').addClass('on');
	    </script>
	</div>
</div>