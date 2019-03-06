<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="side">
	<div class="PJ_side">
	    <!--
	        == 스킨수정 안내 ==
	        아래 includeFile 함수내 파일경로에 따라 카테고리 출력 메뉴 방식을 변경하실 수 있습니다.
	
	        ==== 카테고리 트리형으로 변경 ====
	
	        ==== 카테고리 레이어형으로 변경 ====
	    -->
	    <ul class="PJ_login">
	        <li><a href="${path}/auth">LOGIN</a></li>
	        <li><a href="${path}/member/page/join">JOIN</a><div class="top_point"><font>+3,000</font></div></li>
	        <li><a href="../order/cart.php">CART (0)</a></li>
	        <li><a href="../mypage/index.php">MY PAGE</a></li>
	    </ul>
	    <div style="clear:both; height:20px;"></div>

	<script type="text/javascript">
	    
	</script>
    <div class="lnb">
        <!-- 사이드 카테고리 시작 -->
        <h2 class="dn">사이드 카테고리</h2>
        <ul class="category type-layer">
        	<c:forEach var="menu" items="${category}">
        		<li id="PJ_cate_click" class=" open">
        			<a href="${path}/product?cateCd=${menu.code}">${menu.title}</a>
        			<c:if test="${menu.child ne null}">
        				<ul>
        					<c:forEach var="menu2" items="${menu.child}">
        						<li>
						        	<a href="${path}/product?cateCd=${menu2.code}">${menu2.title}</a>
						        </li>
        					</c:forEach>
        				</ul>
        			</c:if>
        		</li>
        	</c:forEach>
		</ul>
		<hr/>
        <!-- 사이드 카테고리 끝 -->

        <!-- 검색 폼 -->
        <div class="search">
   			<form name="frmSearchTop" id="frmSearchTop" action="../goods/goods_search.php" method="get">

        		<fieldset>
            		<legend>검색폼</legend>
		            <div>
		                <input type="text" id="search-form" name="keyword" class="text" title="" placeholder="" autocomplete="off" />
		                <input type="image" class="image" id="btnSearchTop" title="검색" value="검색" src="${path}/resources/img/header/btn-search.png" alt="검색"/>
		                <div class="search-area dn">
		                    <input type="hidden" name="recentCount" value="10" />
		                    <div class="recent-area">
		                        <ul class="recent-list">
		                            <li class="li-tit">최근검색어</li>
		                            <li class="no-data">최근 검색어가 없습니다.</li>
		                        </ul>
		                    </div>
		                </div>
		            </div>
        		</fieldset>
    		</form>
		</div>
        <!-- 검색 폼 -->

        <ul class="PJ_community">
            <li><a href="../board/list.php?bdId=notice">NOTICE</a></li>
            <li><a href="../board/list.php?bdId=goodsqa">Q&A</a></li>
            <li><a href="../board/list.php?bdId=goodsreview">REVIEW</a></li>
        </ul>
    </div>
    <div class="PJ_sns">
      <a href="../main/index.php"  target="_blank" ><img src="${path}/resources/img/banner/9545e2cb3867253aab3c5d4e7e590e47_54079.gif"  alt="인스타그램" title="인스타그램"   /></a>
      <a href="../main/index.php"  target="_blank" ><img src="${path}/resources/img/banner/82e41619fe10de3ee3219ba5667fe243_98243.gif"  alt="페이스북" title="페이스북"   /></a>
      <a href="../main/index.php"  target="_blank" ><img src="${path}/resources/img/banner/9d59cf2c829bbe2e1f4323839efad875_32883.gif"  alt="블로그" title="블로그"   /></a>
      <a href="../main/index.php"  target="_blank" ><img src="${path}/resources/img/banner/cd5b22542b9fe66964da0abadd673bde_37433.gif"  alt="카카오스토리" title="카카오스토리"   /></a></div>
	</div>
</div>