<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jspf" %>
<head>
	<title>${defaultTitle} - 비밀번호 확인</title>
</head>
<body>
	<div class="col-sm-offset-3 col-sm-6">
	<div class="pwChk-logo">
		<h2>비밀번호 확인</h2>
	</div>
		<div class="pwChk-box-body">
			<form action="${path}/member/action/pwChk" method="post">
				<div class="form-group has-feedback">
					<input type ="password" name="password" class="form-control" placeholder="비밀번호">
					<span class="glyphicon glyphicon-lock form-control-feedback"></span>
				</div>
				<c:if test="${not empty message}">
					<font color="red">
						<p align="center">${message}</p>
					</font>
				</c:if>
				<button type="submit" class="btn btn-primary btn-block btn-flat">
					<i class="fa fa-sign-in"></i>확인
				</button>
			</form>
		</div>
	</div>
</body>
