<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="${path}/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
    <div class="container">
	    <div class="row">
	        <div class="col-xs-12">
	        	<tiles:insertAttribute name="header" />
	        </div>
	        <div class="col-md-2">
	        	<tiles:insertAttribute name="left_menu" />
	        </div>
	        <div class="col-md-10">
	        	<tiles:insertAttribute name="body" />
	        </div>
	        <div class="col-xs-12">
	        	<tiles:insertAttribute name="footer" />
	        </div>
	    </div>
	</div>
    <script src="${path}/resources/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>