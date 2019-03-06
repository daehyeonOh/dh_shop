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
    <script type="text/javascript" src="${path}/resources/js/PJ_main.js?ts=1501039149"></script>
    <link type="text/css" rel="stylesheet" href="${path}/resources/css/PJ_main.css?ts=1529632283" />
</head>
<body class="body-main body-index pc"  >
<div id="wrap">
	<%@ include file="/WEB-INF/views/include/top_global.jsp" %>
	<div id="container">
		<%@ include file="/WEB-INF/views/include/left_side.jsp" %>
		<!-- 본문 시작 : start -->
		<div id="content">
			<div class="PJ_content">
				<!-- 메인 상품 노출 -->
				<div class="PJ_main_title_desc">기본메인상품</div>
				<div class="item-display-wrap js-main-wrap-1-">
					<h2>BEST SELLER
            			<a href="../goods/goods_main.php?sno=1" class="btn-main-top-more normal-btn small1 m1"><em>더보기</em></a>
					</h2>
					<div class="goods-content1">
						<div class="item-display type-gallery">
							<div class="list">
								<ul>
									<!-- 메인 상품 리스트 시작 -->
									<c:forEach var="product" items="${main_products}">
										<li style="width:20%">
											<div class="space">
												<div class="PJ_goods_border">
													<div class="thumbnail" >
														<a href="../goods/goods_view.php?goodsNo=1000000023&mtn=1%5E%7C%5EBEST+SELLER%5E%7C%5En"  >
															<img src="${path}/${product.thumbnail_url}" width="500" class="middle"  />
															<span class="hot">
															
															</span>
														</a>
														<div class="PJ_percent">23</div>
													</div>
													<div class="txt">
														<a href="../goods/goods_view.php?goodsNo=1000000023&mtn=1%5E%7C%5EBEST+SELLER%5E%7C%5En">
															<strong>${product.name}</strong> <br><em>${product.comment}</em>
														</a>
													</div>
													<div class="price gd-default">
														<span class="cost">
															<strong>${product.formattedPrice}</strong>원
														</span>
														<br>
													</div>
													<div class="display-field">
													</div>
												</div>
											</div>
										</li>
									</c:forEach>
									<!-- 메인 상품 리스트 끝 -->
								</ul>
							</div>
						</div>
					</div>
				</div>
				<script></script>
				<!-- 메인상품 노출 -->
			</div>
		</div>
		<!-- 본문 끝 : end -->
	</div>
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</div>

<%@ include file="/WEB-INF/views/include/etc.jsp" %>

</body>
</html>

