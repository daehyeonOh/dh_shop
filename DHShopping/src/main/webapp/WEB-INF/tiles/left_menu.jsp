<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ include file="/WEB-INF/views/include/head.jspf" %>

<ul class="nav nav-pills nav-stacked">
	<c:forEach var="menu" items="${category}">
		<c:if test="${ menu.level eq 1}">
			<li role="presentation" class="dropdown">
				<a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false" 
					href="${path}/${menu.url}${menu.code}">${menu.title}</a>
				<ul class="dropdown-menu" role="menu">
					<c:forEach var="menu2" items="${category}">
						<c:if test="${ menu.code eq menu2.parent}">
							<li><a href="${path}/${menu2.url}${menu2.code}">${menu2.title}</a></li>
						</c:if>
					</c:forEach>
				</ul>
			</li>
		</c:if>
	</c:forEach>
</ul>
