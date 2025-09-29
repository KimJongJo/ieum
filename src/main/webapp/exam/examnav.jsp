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
<link rel="stylesheet" href="./css/examList.css" />
<title>examNav</title>
</head>
<body>
	<div class="sb">
		<span class="sbcon">질환별 자가검진</span>
	</div>
	<div class="sb2">
		<table class="nav">
			<tr>
				<a href="${contextPath }/exam/examques"><td class="en">강박장애</td></a>
			</tr>
			<tr>
				<td class="en">게임 생활습관</td>
			</tr>
			<tr>
				<td class="en">공황장애</td>
			</tr>
			<tr>
				<td class="en">노인 우울장애</td>
			</tr>
			<tr>
				<td class="en">범 불안장애</td>
			</tr>
			<tr>
				<td class="en">스마트폰 생활습관</td>
			</tr>
			<tr>
				<td class="en">아동용 ADHD</td>
			</tr>
			<tr>
				<td class="en">알코올 중독</td>
			</tr>
			<tr>
				<td class="en">양극성장애</td>
			</tr>
			<tr>
				<td class="en">외상후 스트레스</td>
			</tr>
			<tr>
				<td class="en">우울증</td>
			</tr>
			<tr>
				<td class="en">인지장애(보호자)</td>
			</tr>
			<tr>
				<td class="en">인지장애(치매)</td>
			</tr>
			<tr>
				<td class="en">인터넷 생활습관</td>
			</tr>
			<tr>
				<td class="en">자살</td>
			</tr>
			<tr>
				<td class="en">정신장애</td>
			</tr>
			<tr>
				<td class="en">조기정신증</td>
			</tr>
			<tr>
				<td class="en">청소년자해</td>
			</tr>
			<tr>
				<td class="en">청소년조울병(보호자)</td>
			</tr>

		</table>
	</div>
</body>
</html>