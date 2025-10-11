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
    <link rel="stylesheet" href="${contextPath}/exam/css/examQues.css" />
    <link rel="stylesheet" href="${contextPath}/css/header.css">
    <title>examlist</title>
</head>
<body>
<jsp:include page="/common/header/header.jsp" />
<div class="container1">
        <div class="left">
        <jsp:include page="examnav.jsp"></jsp:include>
        </div>           
        <div class="right">
            <div class="examHeader">
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
                     <a href="${contextPath}/exam/examQues1.jsp">
                            <div class="sum">
                                <img class="ci" src="" />
                                <span class="e1">우울</span>
                            </div>                      
                     		</a>
                        </td>
                        <td>
                        <a href="${contextPath }/exam/examQues2.jsp">
                            <div class="sum">
                                <img class="ci" src="" />
                                <span class="e1">스트레스</span>
                            </div>
                            </a>
                        </td>
                        <td>
                        <a href="${contextPath }/exam/examQues3.jsp">
                            <div class="sum">
                                <img class="ci" src="" />
                                <span class="e1">삶의 질</span>
                            </div>
                            </a>
                        </td>
                        <td>
                        <a href="${contextPath }/exam/examQues4.jsp">
                            <div class="sum">
                                <img class="ci" src="" />
                                <span class="e1">조울증(성인)</span>
                            </div>
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        <a href="${contextPath }/exam/examQues5.jsp">
                            <div class="sum">
                                <img class="ci" src="" />
                                <span class="e1">조울증(청소년)</span>
                            </div>
                            </a>
                        </td>
                        <td>
                        <a href="${contextPath }/exam/examQues6.jsp">
                            <div class="sum">
                                <img class="ci" src="" />
                                <span class="e1">조기정신증</span>
                            </div>
                            </a>
                        </td>
                        <td>
                        <a href="${contextPath }/exam/examQues7.jsp">
                            <div class="sum">
                                <img class="ci" src="" />
                                <span class="e1">수면</span>
                            </div>
                            </a>
                        </td>
                        <td>
                        <a href="${contextPath }/exam/examQues8.jsp">
                            <div class="sum">
                                <img class="ci" src="" />
                                <span class="e1">알코올 중독</span>
                            </div>
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        <a href="${contextPath }/exam/examQues9.jsp">
                            <div class="sum">
                                <img class="ci" src="" />
                                <span class="e1">게임중독</span>
                            </div>
                            </a>
                        </td>
                        <td>
                        <a href="${contextPath }/exam/examQues10.jsp">
                            <div class="sum">
                                <img class="ci" src="" />
                                <span class="e1">외상 후 스트레스 장애</span>
                            </div>
                            </a>
                        </td>
                    </tr>
                </table>

            </div>
        </div>
    </div>
</body>
</html>