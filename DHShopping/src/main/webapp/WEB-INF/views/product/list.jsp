<%@page import="com.devdh.shopping.home.domain.CategoryVO"%>
<%@page import="java.util.List"%>
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

			<script type="text/javascript">
			    $(document).ready(function () {
			
			        $('form[name=frmList] select[name=pageNum]').change(function() {
			            $('form[name=frmList]').get(0).submit();
			        });
			
			        $('form[name=frmList] input[name=sort]').click(function() {
			            $('form[name=frmList]').get(0).submit();
			        });
			
			        <%
			        	String sort = request.getParameter("sort");
			        	if (sort == null) {
			        		sort = "";	
			        	} 
			    	%>
			        
			        $(':radio[name="sort"][value="<%= sort %>"]').prop("checked","checked")
			        $(':radio[name="sort"][value="<%= sort %>"]').next().addClass('on');
			
			    });
			</script>
			<c:set var="parentCategory" value="unknown" />
			<c:forEach var="cate" items="${category}">
				<c:if test="${cate.code == parentCateCd}">
					<c:set var="parentCategory" value="${cate.title}" />
				</c:if>
			</c:forEach>
			<div class="contents">
    			<div class="view">
        			<div class="location">
            			<h3 class="dn">현재 위치</h3>
            			<span>홈</span>
            			<div class="navi">
                			<div class="this">
                    			<a href="#">${parentCategory}</a>
                    			<div>
                    				<c:forEach var="menu" items="${category}">
                    					<a href="${path}/product?cateCd=${menu.code}">${menu.title}</a>
                    				</c:forEach>
			                    </div>
			                </div>
            			</div>
            			<c:if test="${parentCateCd ne param.cateCd}">
            				<div class="navi">
	                			<div class="this">
	                				<c:forEach var="child" items="${childCategory}">
	                					<c:if test="${child.code eq param.cateCd }">
	                						<a href="#">${child.title}</a>
	                					</c:if>
	                    			</c:forEach>
	                    			<div>
	                    				<c:forEach var="child" items="${childCategory}">
	                    					<a href="?cateCd=${child.code}">${child.title}</a>
	                    				</c:forEach>
	                    			</div>
	                			</div>
            				</div>
            			</c:if>
        			</div>
        		<div class="cg-main">
  					<h2><c:out value="${parentCategory}"/></h2>
        			<ul class="lower-category">
        			<c:forEach var="child" items="${childCategory}">
        				<li>
        					<span <c:if test="${child.code == param.cateCd}">style="font-weight:bold"</c:if>>
        						<a href="?cateCd=${child.code}">${child.title}</a> <em>(${child.count})</em> 
        					</span>
        				</li>
        			</c:forEach>
        			</ul>
            		<!-- 설문조사 배너 --><!-- 설문조사 배너 -->

            		<div class="goods-list">
                		<span class="tc">상품 <strong>${countProduct}</strong> 개</span>
                		<form name="frmList" action="">
                    		<input type="hidden" name="cateCd" value="<%= request.getParameter("cateCd") %>">
                    		<fieldset>
                        		<legend>상품 정렬 폼</legend>
                        		<div class="align">
		                            <ul>
		                                <li>
		                                    <input type="radio" id="sort1" class="radio" name="sort" value="">
		                                    <label for="sort1">추천순</label>
		                                </li>
		                                <li>
		                                    <input type="radio" id="sort2" class="radio" name="sort" value="1">
		                                    <label for="sort2">판매인기순</label>
		                                </li>
		                                <li>
		                                    <input type="radio" id="sort3" class="radio" name="sort" value="2">
		                                    <label for="sort3">낮은가격순</label>
		                                </li>
		                                <li>
		                                    <input type="radio" id="sort4" class="radio" name="sort" value="3">
		                                    <label for="sort4">높은가격순</label>
		                                </li>
		                                <li>
		                                    <input type="radio" id="sort5" class="radio" name="sort" value="4">
		                                    <label for="sort5">상품명순</label>
		                                </li>
		                                <li>
		                                    <input type="radio" id="sort6" class="radio" name="sort" value="5">
		                                    <label for="sort6">등록일순</label>
		                                </li>
		                            </ul>
                            		<div class="choice">
                            			<%
                            				String pageNum = request.getParameter("pageNum");
		                                    if (pageNum == null) pageNum = "20";
                            			%>
                                		<div>
                                			<select name="pageNum" class="tune" style="width: 110px;">
			                                	<option value="20" <% if (pageNum.equals("20")) { %> selected="selected" <% } %>>20개씩보기</option>
			                                    <option value="40" <% if (pageNum.equals("40")) { %> selected="selected" <% } %>>40개씩보기</option>
			                                    <option value="60" <% if (pageNum.equals("60")) { %> selected="selected" <% } %>>60개씩보기</option>
			                                    <option value="80" <% if (pageNum.equals("80")) { %> selected="selected" <% } %>>80개씩보기</option>
			                                </select>
                                		</div>
		                                <!--
		                                <button type="button" class="gallery on" title="갤러리형">갤러리형</button>
		                                <button type="button" class="list" title="리스트형">리스트형</button>
		                                -->
                           	 		</div>
                        		</div>
                    		</fieldset>
                		</form>

						<div class="item-display type-gallery">
    						<div class="list">
        						<ul>
        							<c:forEach var="item" items="${product}">
	            						<li style="width:25%">
	                						<div class="space">
												<div class="PJ_goods_border">
													<div class="thumbnail">
														<a href="${path}/product${pageMaker.makeQuery(pageMaker.criteria.page)}&productNo=${item.productNo}"> 
															<img src="${path}/${item.thumbnail_url}" width="500" class="middle">
																<span class="hot">
	
																</span>
														</a>
														<div class="PJ_percent">23</div>						
													</div>
													<div class="txt">
														<a href="${path}/product${pageMaker.makeQuery(pageMaker.criteria.page)}&productNo=${item.productNo}">
	 														<strong>${item.name}</strong> <br><em>${item.comment}</em>
	 													</a>
													</div>
													<div class="price gd-default">
														<span class="cost">
	                            							<strong>
																${item.formattedPrice}</strong>원
														</span>
														<br>
													</div>
													<div class="display-field">
													</div>
												</div>
	                						</div>
	            						</li>
            						</c:forEach>
        						</ul>
    						</div>
						</div>
            		</div>
            		<div class="board-paging">
                		<nav>
                			<ul class="pagination pagination-sm">
                				<c:if test="${pageMaker.prev}">
									<li><a href="${path}/product${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
								</c:if>
								<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
									<li <c:out value="${pageMaker.criteria.page == idx ? 'class=active' : ''}"/>>
										<a href="${path}/product${pageMaker.makeQuery(idx)}">${idx}</a>
									</li>
								</c:forEach>
                				<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
									<li><a href="${path}/product${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
								</c:if>
                			</ul>
                		</nav>
            		</div>
        		</div>
    		</div>
    		<hr>
		</div>
	</div>
		<!-- 본문 끝 : end -->
	</div>
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</div>

<%@ include file="/WEB-INF/views/include/etc.jsp" %>

</body>
</html>