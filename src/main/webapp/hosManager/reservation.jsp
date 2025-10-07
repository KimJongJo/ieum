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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/hosManager/css/reservation.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/hosManager/css/patientInfo.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/hosManager/css/infoModal.css" />
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
        <div class="main">
            <div class="main-div">
                <!-- 헤더 들어올 곳 -->
                <!-- 아래 -->
                <div class="under-section">
                    <!-- 네비 들어올 곳 -->
                    <jsp:include page="managerHeader.html"></jsp:include>
                    <div class="info">
                        <div class="search-name">
                            <span class="hos-name">${hosName}</span>
                        </div>
                        <form class="search-bar2">
                            <div class="select-div">
                                <div>
                                    <select name="" id="" class="year">
                                        <option value="">년</option>
                                    </select>
                                    <select name="" id="" class="month">
                                        <option value="">월</option>
                                    </select>
                                    <select name="" id="" class="day">
                                        <option value="">일</option>
                                    </select>
                                </div>
                                <div class="search-div">
                                    <input type="text" placeholder="환자 이름을 검색해주세요" class="reservation-input" />
                                    <button type="button" class="reservation-btn">검색</button>
                                </div>
                            </div>
                        </form>
						<div class="reservation-table-div">
							<table class="table reservation-table">
								<thead>
									<tr>
		                                <th style="width: 70px">예약ID</th>
		                                <th style="width: 150px">환자 이름</th>
		                                <th style="width: 150px">담당 의사</th>
		                                <th style="width: 200px">예약날짜 / 시간</th>
		                                <th style="width: 150px">진단서</th>
		                                <th>환자정보</th>
		                            </tr>
								</thead>	
								<tbody>
									<c:forEach var="res" items="${resList.list}">
										<tr>
											<td class="reservation-table-td">${res.rNo}</td>
			                                <td class="reservation-table-td">${res.pNm}</td>
			                                <td class="reservation-table-td">${res.mNm}</td>
			                                <td class="reservation-table-td">
			                                    <span>${res.date}</span>
			                                    /
			                                    <span>${res.time}</span>
			                                </td>
			                                <td><button value="${res.diaNo}" type="button" class="show-dia-btn">보기</button></td>
	                                		<td><button value="${res.diaNo}" type="button" class="show-pInfo-btn" id="show-patient-info">보기</button></td>
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
							    <c:forEach var="i" begin="${resList.startPage}" end="${resList.endPage}">
							        <c:choose>
							            <c:when test="${i == resList.curPage}">
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
                    </div>
                    
                    
                    <jsp:include page="patientInfo.jsp"></jsp:include>
                   	<!-- 진단서 보기를 눌렀을때 나타날 진단서 -->
				   <jsp:include page="showDia2.jsp"></jsp:include>
                    
                    
                </div>
            </div>
        </div>
        <script src="${pageContext.request.contextPath}/hosManager/js/managerHeader.js"></script>
        <script src="${pageContext.request.contextPath}/hosManager/js/modal4.js"></script>
        <script src="${pageContext.request.contextPath}/hosManager/js/modal3.js"></script>
    </body>
</html>
