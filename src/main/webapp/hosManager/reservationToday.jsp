<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Document</title>
        <script src="https://kit.fontawesome.com/b5ec955390.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/hosManager/css/manager.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/hosManager/css/managerHeader.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/hosManager/css/reservationToday.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/hosManager/css/patientInfo.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/hosManager/css/infoModal.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/hosManager/css/modal.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/adminIndexFooter.css" />
        <script src="https://kit.fontawesome.com/8d48045bdd.js"></script>
        <!-- jquery -->
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script>
		    // HTML 페이지에서 선언, JSP에서 EL 치환됨
		    const contextPath = "${pageContext.request.contextPath}";
		    let curPage = ${resList.curPage};
		    let allPage = ${resList.allPage};
		    let curKeyword = ""; // 현재 검색어
		    let uNo = ${sessionScope.uNo};
		</script>

    </head>
    <body>

    
    <c:import url="/common/header/header.jsp" charEncoding="UTF-8"/>
        <div class="main">
            <div class="main-div">
                <!-- 헤더 들어올 곳 -->
                <!-- 아래 -->
                <div class="under-section">
                    <!-- 네비 들어올 곳 -->
<%--                         <c:choose> --%>
<%-- 					    	<c:when test="${userType =='DOCTOR'}"> --%>
<%-- 					    		<jsp:include page="doctorHeader.html"></jsp:include> --%>
<%-- 					    	</c:when> --%>
<%-- 					    	<c:otherwise> --%>
<%-- 					    		<jsp:include page="managerHeader.html"></jsp:include> --%>
<%-- 					    	</c:otherwise> --%>
<%-- 					    </c:choose> --%>
						<jsp:include page="../common/nav/nav.jsp"></jsp:include>                    
                    <div class="info">
                        <div class="search-name">
                            <span class="hos-name">${hosName}</span>
                        </div>
                        <form class="search-bar2">
                            <div class="select-div">
                                <div class="today-div"><span class="today-res">오늘 날짜 : </span> <span>${today}</span></div>
                                <div class="search-div">
                                    <input id="searchKeyword" type="text" placeholder="환자 이름을 검색해주세요" class="reservation-input" />
                                    <button id="searchBtn" type="button" class="reservation-btn">검색</button>
                                </div>
                            </div>
                        </form>
						<div class="reservation-table-div">
							<table class="table reservation-table2" id="tableSetting">
								<thead>
									<tr>
		                                <th>예약ID</th>
		                                <th style="width: 150px" colspan=2>환자 이름/프로필</th>
		                                <th style="width: 150px">예약시간</th>
		                                <th style="width: 150px" colspan=2>진단서 / 작성상태</th>
		                                <th>진료</th>
		                            </tr>
								</thead>
								<tbody>
								<c:forEach var="res" items="${resList.list}">
									<tr>
		                                <td>${res.rNo}</td>
		                                <td>${res.pNm}</td>
		                                <td><button value="${res.diaNo}" type="button" class="search-user-btn profileBtn show-pInfo-btn"><i class="fa-solid fa-magnifying-glass"></i></button></td>
		                                <td>
		                                	${res.time}
		                                </td>
	                                	<td><button type="button" class="write-btn" value="${res.rNo}"><i class="fa-regular fa-pen-to-square"></i></button></td>
	                                    <td class="reservation-table-td">
	                                    	<input class="diaState" type="hidden" value="${res.diaState}" />
	                                    	<c:choose>
	                                    		<c:when test="${res.diaState == 'BASIC'}">
	                                    			미작성
	                                    		</c:when>
	                                    		<c:when test="${res.diaState == 'WRITING'}">
	                                    			작성중
	                                    		</c:when>
	                                    		<c:otherwise>
	                                    			작성완료
	                                    		</c:otherwise>
	                                    	</c:choose>
	                                    </td>
		                                <td><button value="${res.diaNo}" class="status-btn complete">완료</button></td>
	                            	</tr>
								</c:forEach>
								</tbody>
	                        </table>
						</div>
                        
                        <c:if test="${not empty resList.list}">
						<div class="page-div">
							<button class="page previous" type="button">
								<i class="fa-solid fa-angle-left"></i>
							</button>
							<!-- 페이지 번호 반복 -->
							    <c:forEach var="i" begin="${pageMap.startPage}" end="${pageMap.endPage}">
							        <c:choose>
							            <c:when test="${i == pageMap.curPage}">
							                <button value="${i}" class="cur-page" type="button">${i}</button>
							            </c:when>
							            <c:otherwise>
							                <button value="${i}" class="page move-page" type="button">${i}</button>
							            </c:otherwise>
							        </c:choose>
							    </c:forEach>
						  
							<button class="page next-page" type="button">
								<i class="fa-solid fa-angle-right"></i>
							</button>
						</div>
				  		</c:if>
                        
                        <jsp:include page="diaWrite.jsp"></jsp:include>
                        <jsp:include page="patientInfo.jsp"></jsp:include>
                        <div id="checkModal" class="modal-main-div">
				            <div class="modal-div-over">
				                <div class="modal-header-div">
				                    <span class="modal-header-div-span">진료를 완료하시겠습니까?</span>
				                    <button type="button" class="x-button" id="checkModalX">
				                        <i class="fa-solid fa-x x-btn"></i>
				                    </button>
				                </div>
				                <div class="modal-content-div">
				                    <span class="modal-content-div-span">더 이상 진단서 작성 및 수정이 불가능합니다.</span>
				                </div>
				                <div class="modal-div-under">
				                    <div class="modal-btn-div">
				                        <button id="checkModalCancle" class="modal-btn-left modal-btn">취소</button>
				                        <button id="diaConfirm" class="modal-btn-right modal-btn">완료</button>
				                    </div>
				                </div>
				            </div>
				        </div>
                    </div>
                    </div>
                </div>
            </div>
        </div>
        <c:import url="/common/footer/footer.html" charEncoding="UTF-8"/>
        <script src="${pageContext.request.contextPath}/hosManager/js/managerHeader.js"></script>
        <script src="${pageContext.request.contextPath}/hosManager/js/modal.js"></script>
        <script src="${pageContext.request.contextPath}/hosManager/js/modal1.js"></script>
        <script src="${pageContext.request.contextPath}/hosManager/js/modal2.js"></script>
        <script src="${pageContext.request.contextPath}/hosManager/js/modal3.js"></script>
    </body>
</html>

