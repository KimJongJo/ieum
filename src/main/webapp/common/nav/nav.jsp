<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>건강이음</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
		<!-- userNav -->
		<c:if test="${userType == 'USER'}">
			<jsp:include page="/common/nav/userNav.jsp"></jsp:include>
		</c:if>
		<!-- hosNav -->
		<c:if test="${userType == 'DOCTOR' || userType == 'MANAGER'}">
			<jsp:include page="/common/nav/hosNav.jsp"></jsp:include>
		</c:if>
		<!-- adminNav -->
		<c:if test="${userType == 'ADMIN'}">
			<jsp:include page="/common/nav/adminNav.jsp"></jsp:include>
		</c:if>	
</body>
</html>