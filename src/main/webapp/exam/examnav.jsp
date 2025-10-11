<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200&icon_names=checklist" />
<script src="https://kit.fontawesome.com/8d48045bdd.js"
	crossorigin="anonymous"></script>
<title>examNav</title>
</head>
<body>
	<button class="sb" type="button" id="esb">
		<span class="sbcon">질환별 자가검진 <i class="fa-solid fa-caret-down"></i>
		</span>
	</button>
	<div class="sb2" id="esbTab">
		<table class="nav">
			<tr>
				<td class="en"><a href="${contextPath}/exam/examQues1.jsp">우울</a></td>
			</tr>
			<tr>
				<td class="en"><a href="${contextPath}/exam/examQues2.jsp">스트레스</a></td>
			</tr>
			<tr>
				<td class="en"><a href="${contextPath}/exam/examQues3.jsp">삶의질</a></td>
			</tr>
			<tr>
				<td class="en"><a href="${contextPath}/exam/examQues4.jsp">조울증(성인)</a></td>
			</tr>
			<tr>
				<td class="en"><a href="${contextPath}/exam/examQues5.jsp">조울증(청소년)</a></td>
			</tr>
			<tr>
				<td class="en"><a href="${contextPath}/exam/examQues6.jsp">조기정신증</a></td>
			</tr>
			<tr>
				<td class="en"><a href="${contextPath}/exam/examQues7.jsp">수면</a></td>
			</tr>
			<tr>
				<td class="en"><a href="${contextPath}/exam/examQues8.jsp">알코올중독</a></td>
			</tr>
			<tr>
				<td class="en"><a href="${contextPath}/exam/examQues9.jsp">게임중독</a></td>
			</tr>
			<tr>
				<td class="en"><a href="${contextPath}/exam/examQues10.jsp">외상후스트레스장애</a></td>
			</tr>

		</table>
	</div>
	<script src="${contextPath }/exam/js/examNav.js"></script>
</body>
</html>