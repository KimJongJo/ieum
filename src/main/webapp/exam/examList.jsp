<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <c:set var="contextPath" value="${pageContext.request.contextPath}" /> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200&icon_names=checklist" />
    <link rel="stylesheet" href="${contextPath}/exam/css/examList.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css" />
    <title>examlist</title>
</head>
<body>
<c:import url="/common/header/header.jsp" charEncoding="UTF-8"/>
	<div class="body-div">
		<div class="exam-container">	
	        <div class="left">
	        <jsp:include page="examnav.jsp"></jsp:include>
	        </div>           
	        <div class="right">
	            <div class="cate-header">
	                <div class="icon">
	                    <span class="material-symbols-outlined">
	                        checklist
	                    </span>
	                </div>
	                <div class="text">
	                    <span class="ename">질환별 자가검진</span>
	                    <span class="content">
	                        자가진단은 정확한 진단을 내리기에는 어려움이 있으므로 정확한 증상과 판단을 위해서는 의사의 진료가 필요함을 안내드립니다.
	                    </span>
	                </div>
	            </div>
	            <div class="listg">
	                <table class="elc">
	                    <tr>
	                    <td>
	                     <a href="${contextPath}/exam/examques">
	                            <div class="sum">
	                                <img class="ci" src="" />
	                                <span class="e1">강박장애</span>
	                            </div>                      
	                     		</a>
	                        </td>
	                        <td>
	                        <a href="${contextPath }/exam/examques">
	                            <div class="sum">
	                                <img class="ci" src="" />
	                                <span class="e1">게임 생활습관</span>
	                            </div>
	                            </a>
	                        </td>
	                        <td>
	                        <a href="${contextPath }/exam/examques">
	                            <div class="sum">
	                                <img class="ci" src="" />
	                                <span class="e1">공황장애</span>
	                            </div>
	                            </a>
	                        </td>
	                        <td>
	                        <a href="${contextPath }/exam/examques">
	                            <div class="sum">
	                                <img class="ci" src="" />
	                                <span class="e1">노인 우울장애</span>
	                            </div>
	                            </a>
	                        </td>
	                    </tr>
	                    <tr>
	                        <td>
	                        <a href="${contextPath }/exam/examques">
	                            <div class="sum">
	                                <img class="ci" src="" />
	                                <span class="e1">범 불안장애</span>
	                            </div>
	                            </a>
	                        </td>
	                        <td>
	                        <a href="${contextPath }/exam/examques">
	                            <div class="sum">
	                                <img class="ci" src="" />
	                                <span class="e1">스마트폰 생활습관</span>
	                            </div>
	                            </a>
	                        </td>
	                        <td>
	                        <a href="${contextPath }/exam/examques">
	                            <div class="sum">
	                                <img class="ci" src="" />
	                                <span class="e1">아동용 ADHD</span>
	                            </div>
	                            </a>
	                        </td>
	                        <td>
	                        <a href="${contextPath }/exam/examques">
	                            <div class="sum">
	                                <img class="ci" src="" />
	                                <span class="e1">알코올 중독</span>
	                            </div>
	                            </a>
	                        </td>
	                    </tr>
	                    <tr>
	                        <td>
	                        <a href="${contextPath }/exam/examques">
	                            <div class="sum">
	                                <img class="ci" src="" />
	                                <span class="e1">양극성장애</span>
	                            </div>
	                            </a>
	                        </td>
	                        <td>
	                        <a href="${contextPath }/exam/examques">
	                            <div class="sum">
	                                <img class="ci" src="" />
	                                <span class="e1">외상후 스트레스</span>
	                            </div>
	                            </a>
	                        </td>
	                        <td>
	                        <a href="${contextPath }/exam/examques">
	                            <div class="sum">
	                                <img class="ci" src="" />
	                                <span class="e1">우울증</span>
	                            </div>
	                            </a>
	                        </td>
	                        <td>
	                        <a href="${contextPath }/exam/examques">
	                            <div class="sum">
	                                <img class="ci" src="" />
	                                <span class="e1">인지장애(보호자)</span>
	                            </div>
	                            </a>
	                        </td>
	                    </tr>
	                    <tr>
	                        <td>
	                        <a href="${contextPath }/exam/examques">
	                            <div class="sum">
	                                <img class="ci" src="" />
	                                <span class="e1">인지장애(치매)</span>
	                            </div>
	                            </a>
	                        </td>
	                        <td>
	                        <a href="${contextPath }/exam/examques">
	                            <div class="sum">
	                                <img class="ci" src="" />
	                                <span class="e1">인터넷 생활습관</span>
	                            </div>
	                            </a>
	                        </td>
	                        <td>
	                        <a href="${contextPath }/exam/examques">
	                            <div class="sum">
	                                <img class="ci" src="" />
	                                <span class="e1">자살</span>
	                            </div>
	                            </a>
	                        </td>
	                        <td>
	                        <a href="${contextPath }/exam/examques">
	                            <div class="sum">
	                                <img class="ci" src="" />
	                                <span class="e1">정신장애</span>
	                            </div>
	                            </a>
	                        </td>
	                    </tr>
	                    <tr>
	                        <td>
	                        <a href="${contextPath }/exam/examques">
	                            <div class="sum">
	                                <img class="ci" src="" />
	                                <span class="e1">조기정신증</span>
	                            </div>
	                            </a>
	                        </td>
	                        <td>
	                        <a href="${contextPath }/exam/examques">
	                            <div class="sum">
	                                <img class="ci" src="" />
	                                <span class="e1">청소년자해</span>
	                            </div>
	                            </a>
	                        </td>
	                        <td>
	                        <a href="${contextPath }/exam/examques">
	                            <div class="sum">
	                                <img class="ci" src="" />
	                                <span class="e1">청소년조울병(보호자)</span>
	                            </div>
	                            </a>
	                        </td>
	                    </tr>
	                </table>
	
	            </div>
	        </div>
	    </div>
	   </div>
    <c:import url="/common/footer/footer.html" charEncoding="UTF-8"/>
    <script src="${contextPath }/exam/js/examList.js"></script>
</body>
</html>