<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jspf" %>

<head>
	<title>${defaultTitle} - 회원정보수정</title>
</head>
<body>
	<div class="col-sm-offset-3 col-sm-6">
	<div class="modify-logo">
		<h2>회원정보수정</h2>
	</div>
	
	<div class="modify-box-body">
			<form:form modelAttribute="memberVO" action="${path}/member/action/update" method="post">
				<div class="form-group has-feedback">
					<form:input path="id" class="form-control" placeholder="아이디" value="${member.id}" readonly="true" />
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
					<form:input path="name" class="form-control" placeholder="이름" value="${member.name}" />
					<span class="glyphicon glyphicon-user form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					<form:input path="email" type="email" class="form-control" placeholder="이메일" value="${member.email}" />
					<span class="glyphicon glyphicon-envelope form-control-feedback"></span>
				</div>
				<button type="submit" class="btn btn-primary btn-block btn-flat">수정</button>
			</form:form>
		</div>
	</div>
	
</body>
