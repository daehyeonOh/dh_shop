<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="footer">
	<div class="PJ_foot">
  		<div class="PJ_foot_cs">
      		<div class="cs-center">
	          	<h3>CS CENTER</h3>
	         	<strong>1234-5678</strong>
	          	<p>AM 09 - PM 5<br />
					LUNCH PM1 - PM2<br />
					SAT, SUN, HOLIDAY OFF</p>
      		</div>
      		<div class="bank-info">
          		<h3>BANK INFO</h3>
          		<strong>123-456-78-900</strong>
          		<p>기업은행 / 예금주 : Unknown</p>
          		<select onchange="select_URL(this.value);">
		            <option>인터넷뱅킹 바로가기</option>
		            <option value="https://www.kbstar.com">KB국민은행</option>
		            <option value="https://www.wooribank.com">우리은행</option>
		            <option value="http://www.shinhan.com">신한은행</option>
		            <option value="https://www.kebhana.com">KEB하나은행</option>
		            <option value="http://www.standardchartered.co.kr">스탠다드차타드은행</option>
		            <option value="http://www.citibank.co.kr">한국씨티은행</option>
		            <option value="https://www.dgb.co.kr">대구은행</option>
		            <option value="https://www.busanbank.co.kr">부산은행</option>
		            <option value="https://m.kjbank.com/mweb/main/index.html">광주은행</option>
		            <option value="http://www.knbank.co.kr">경남은행</option>
		            <option value="https://www.jbbank.co.kr">전북은행</option>
		            <option value="https://www.e-jejubank.com">제주은행</option>
		            <option value="https://banking.nonghyup.com/nhbank.html">농협</option>
		            <option value="https://www.suhyup-bank.com">수협</option>
		            <option value="https://open.ibk.co.kr">기업은행</option>
		            <option value="https://openbank.cu.co.kr">신협</option>
		            <option value="http://www.epostbank.kr">우체국</option>
		            <option value="https://ibs.kfcc.co.kr">새마을금고</option>
          		</select>
      		</div>
  		</div>
  		<div class="PJ_foot_info">
    		<div class="PJ_foot_1">
	        	<div class="container">
	            	<ul>
		                <li><a href="../service/company.php">회사소개</a></li>
		                <li><a href="../service/agreement.php">이용약관</a></li>
		                <li><a href="../service/private.php" class="privacy">개인정보처리방침</a></li>
		                <li><a href="../service/guide.php">이용안내</a></li>
		                <li><a href="../service/cooperation.php">광고/제휴 문의</a></li>
	            	</ul>
	        	</div>
    		</div>
    		<div class="PJ_foot_3">
        		<div class="container">
           			<div class="policy">
						<ul>
							<li>상호 : DH</li>
							<li>주소 : 서울특별시 강남구  역삼동 000 0, 0층 0호</li>
						</ul>
						<ul>
							<li>대표 : 홍길동</li>
							<li>사업자등록번호 : 123-45-67890 <a href="#;" onclick="popup_bizInfo('2011635684');">[사업자정보확인]</a></li>
						</ul>
						<ul>
							<li>통신판매업신고번호 : 제 2000-서울OO-0000호</li>
							<li>개인정보관리자 : </li>
						</ul>
						<ul>
							<li>대표번호 : 1234-5678</li>
							<li>팩스번호 : 1234-5678</li>
						</ul>
						<ul>
							<li>메일 : <a href="#;" onclick="popup_email('test@test.kr');">test@test.kr</a></li>
							<li>호스팅제공 : 엔에이치엔고도(주)</li>
						</ul>
						<ul class="PJ_copyright">
							<li>COPYRIGHT (c) dhshop.com ALL RIGHTS RESERVED.</li>
							<li>DESIGNED BY <a href="http://8design.kr" target="_blank">8디자인</a>.</li>
						</ul>
            		</div>
            		<div class="certify-mark">
                		<span></span>
                		<span></span>
            		</div>
        		</div>
    		</div>
  		</div>
	</div>
</div>

<!-- 좌측 스크롤 배너 : start -->
<div id="scroll-left">

</div>
<!-- 좌측 스크롤 배너 : end -->

<!-- 우측 스크롤 배너 : start -->
<div id="scroll-right">
	<div class="recent-list">
    	<em>최근본상품</em>
    	<div class="list">
        	<div class="paging">
            	<button type="button" class="prev" title="최근본 이전 상품"><span>최근본 이전 상품</span></button>
            	<span><strong class="js-current">0</strong>/<span class="js-total" style="float:none;width:auto;">0</span></span>
            	<button type="button" class="next" title="최근본 다음 상품"><span>최근본 다음 상품</span></button>
        	</div>
    	</div>
    	<div class="top"><a href="#top"><img src="${path}/resources/img/side/btn-top.png" alt="상단으로 이동"/></a></div>
	</div>

	<script type="text/javascript">
	    // DOM 로드
	    $(function () {
	        $('.recent-list').todayGoods();
	    });
	
	    // 최근본상품 리스트 페이징 처리 플러그인
	    $.fn.todayGoods = function () {
	        // 기본값 세팅
	        var self = $(this);
	        var setting = {
	            page: 1,
	            total: 0,
	            rowno: 5
	        };
	        var element = {
	            goodsList: self.find('.list > ul > li'),
	            closeButton: self.find('.list > ul > li > button'),
	            prev: self.find('.paging > .prev'),
	            next: self.find('.paging > .next'),
	            paging: self.find('.paging')
	        };
	
	        // 페이지 갯수 설정
	        setting.total = Math.ceil(element.goodsList.length / setting.rowno);
	
	        // 화면 초기화 및 갱신 (페이지 및 갯수 표기)
	        var init = function () {
	            if (setting.total == 0) {
	                setting.page = 0;
	                element.paging.hide();
	            }
	            self.find('ul').hide().eq(setting.page - 1).show();
	            self.find('.paging .js-current').text(setting.page);
	            self.find('.paging .js-total').text(setting.total);
	        }
	
	        // 삭제버튼 클릭
	        element.closeButton.click(function(e){
	            $.post('../goods/goods_ps.php', {
	                'mode': 'delete_today_goods',
	                'goodsNo': $(this).data('goods-no')
	            }, function (data, status) {
	                // 값이 없는 경우 성공
	                if (status == 'success' && data == '') {
	                    location.reload(true);
	                }
	                else {
	                    console.log('request fail. ajax status (' + status + ')');
	                }
	            });
	        });
	
	        // 이전버튼 클릭
	        element.prev.click(function (e) {
	            setting.page = 1 == setting.page ? setting.total : setting.page - 1;
	            init();
	        });
	
	        // 다음버튼 클릭
	        element.next.click(function (e) {
	            setting.page = setting.total == setting.page ? 1 : setting.page + 1;
	            init();
	        });
	
	        // 화면 초기화
	        init();
	    };
	</script>
</div>
    <!-- 우측 스크롤 배너 : end -->
