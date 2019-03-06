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
		
		<!-- 본문 끝 : end -->
	</div>
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</div>

<%@ include file="/WEB-INF/views/include/etc.jsp" %>

</body>
</html>