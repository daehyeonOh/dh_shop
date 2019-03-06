<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jspf" %>

<head>
	<title>${defaultTitle} - 회원가입</title>
</head>
<body>
	<div class="col-sm-offset-3 col-sm-6">
		<div class="register-logo">
			<h2>회원가입</h2>
		</div>
		
		<div class="register-box-body">
			<form:form modelAttribute="memberVO" action="${path}/member/action" method="post">
				<div class="form-group has-feedback">
					<form:input path="id" class="form-control" placeholder="아이디" />
					<span class="glyphicon glyphicon-exclamation-sign form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					<form:password path="password" class="form-control" placeholder="비밀번호" />
					<span class="glyphicon glyphicon-lock form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					<input type="password" class="form-control" placeholder="비밀번호 확인" />
					<span class="glyphicon glyphicon-log-in form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					<form:input path="name" class="form-control" placeholder="이름" />
					<span class="glyphicon glyphicon-user form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					<form:input path="email" type="email" class="form-control" placeholder="이메일" />
					<span class="glyphicon glyphicon-envelope form-control-feedback"></span>
				</div>
				<div class="row">
					<div class="col-xs-8">
						<div class="checkbox icheck">
							<label>
								<input type="checkbox"> 약관에 <a href="#">동의</a>
							</label>
						</div>
					</div>
					<div class="col-xs-4">
						<button type="submit" class="btn btn-primary btn-block btn-flat">가입</button>
					</div>
				</div>
			</form:form>
		</div>
	</div>
</body>
