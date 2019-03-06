<%@page import="com.devdh.shopping.member.domain.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<nav class="navbar navbar-default">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="${path}/">DH SHOPPING</a>
			<div class="navbar-form navbar-left" role="search">
				<div class="form-group">
			    	<input type="text" class="form-control" id="keywordInput" placeholder="상품 검색" value="${pageMaker.criteria.keyword}">
			  	</div>
		  		<button type="button" id="searchBtn" class="btn btn-default">검색</button>
			</div>
		</div>
			<%
				MemberVO member = (MemberVO)session.getAttribute("login");
				
				if (member == null) {
			%>
					<ol class="breadcrumb navbar-right">
					  <li><a href="${path}/auth">로그인</a></li>
					  <li><a href="${path}/member/page/join">회원가입</a></li>
					</ol>
			<%
				} else {
			%>
					<ol class="breadcrumb navbar-right">
					  <li><span><%= member.getName() %>님 안녕하세요!</span></li>
					  <li><a href="${path}/auth/logout">로그아웃</a></li>
					  <li><a href="${path}/member/page/update">회원정보수정</a></li>
					  <li><a href="${path}/member/page/productList">장바구니&nbsp;<span class="badge">0</span></a></li>
					</ol>
			<%
				}
			%>
	</div>	
</nav>
<script type="text/javascript">
	$(function() {
		$("#searchBtn").on("click", function (event) {
			self.location = "/product?keyword=" + encodeURIComponent($("#keywordInput").val());
		});
	});
</script>
