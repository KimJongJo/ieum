<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://kit.fontawesome.com/8d48045bdd.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200&icon_names=heart_plus" />
<link rel="stylesheet"
	href="${contextPath}/reservation/css/resSummary.css" />
<link rel="stylesheet" href="${contextPath}/common/button/button.css" />
<link rel="stylesheet" href="${contextPath}/css/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css" />
<title>resSummary</title>
</head>
<body>
	<c:import url="/common/header/header.jsp" charEncoding="UTF-8"/>
	<div class="container">
		<div class="success">
			<div class="icon">
				<span class="material-symbols-outlined"> heart_plus </span>
			</div>
			<span class="t1">예약이 확정되었습니다!</span>
		</div>

		<div class="sumbox">
			<div class="ht">
				<span class="hname"> <c:out value="${resDetail.hNm }" />
				</span>
				<table class="date">
					<tr>
						<td class="hd">일정</td>
						<td class="hd"><c:out value="${resDetail.rDate }" /></td>
						<td class="hd"><c:out value="${resDetail.rDay }" /></td>
						<td class="hd"><c:out value="${resDetail.rTime }" /></td>
					</tr>
				</table>
				<div class="line"></div>
			</div>


			<div class="docbox">
				<img class="docprof" src="${contextPath }/${resDetail.filePath }/${resDetail.fileName}" onerror="this.onerror=null; this.src='';" />

				<div class="info">
					<div class="doci">
						<p class="dname">
							<c:out value="${resDetail.username }" />
						</p>
						<p class="intro">
							<c:out value="${resDetail.introduction }" default="믿음을 주는 상담사" />
						</p>
					</div>
					<span class="major"> <c:out value="${resDetail.major }" />
					</span>
				</div>
			</div>

			<div class="painfo">
				<span class="t2">예약자 정보</span> <span class="pname"> <c:out
						value="${actName}" />
				</span> <span class="ptel"> <c:out value="${actTel}" />
				</span>
				<div class="line"></div>
			</div>

			<div class="councon">
				<span class="t2">상담내용</span>
				<div class="counbox">
					${resDetail.rContent }
				</div>
			</div>
		</div>
		<div class="btn">
			<a href="${contextPath }/index"><button type="button"
					class="btn-rec-w">홈으로</button></a> <a
				href="${contextPath }/myPage/reservation/list"><button
					type="button" class="btn-long-b">예약확인</button></a>
		</div>
	</div>

<c:import url="/common/footer/footer.html" charEncoding="UTF-8"/>
</body>
</html>