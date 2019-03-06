<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jspf" %>

<head>
	<title>${defaultTitle} - 로그인</title>
</head>
<body>
	<div class="col-sm-offset-3 col-sm-6">
		<div class="login-logo">
			<h2>로그인</h2>
		</div>
		<div class="login-box-body">
			<form:form modelAttribute="loginVO" action="${path}/auth/action" method="post">
				<div class="form-group has-feedback">
					<form:input path="id" class="form-control" placeholder="아이디" />
					<span class="glyphicon glyphicon-exclamation-sign form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					<form:password path="password" class="form-control" placeholder="비밀번호" />
					<span class="glyphicon glyphicon-lock form-control-feedback"></span>
				</div>
				<c:if test="${not empty message}">
					<font color="red">
						<p align="center">${message}</p>
					</font>
				</c:if>
				<div class="row">
					<div class="col-xs-8">
						<div class="checkbox icheck">
							<label>
								<input type="checkbox" name="remember_me"> 로그인유지
							</label>
						</div>
					</div>
					<div class="col-xs-4">
						<button type="submit" class="btn btn-primary btn-block btn-flat">
							<i class="fa fa-sign-in"></i>로그인
						</button>
					</div>
				</div>
			</form:form>
			<hr>
			<div class="text-center">
				<a href="#">비밀번호 찾기</a> | 
				<a href="${path}/member/page/join">회원가입</a>
			</div>
		</div>
	</div>
</body>