<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
                            <span class="hos-name">중랑구 보건소</span>
                        </div>
                        <form class="search-bar2">
                            <div class="select-div">
                                <div class="today-div"><span class="today-res">오늘 날짜 : </span> <span>2025-08-31</span></div>
                                <div class="search-div">
                                    <input type="text" placeholder="환자 이름을 검색해주세요" class="reservation-input" />
                                    <button type="button" class="reservation-btn">검색</button>
                                </div>
                            </div>
                        </form>
						<div class="reservation-table-div">
							<table class="table reservation-table2">
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
									<tr>
	                                <td>R045</td>
	                                <td>김환자</td>
	                                <td><button type="button" class="search-user-btn"><i class="fa-solid fa-magnifying-glass"></i></button></td>
	                                <td>
	                                	10:00
	                                </td>
                                	<td><button type="button" class="write-btn"><i class="fa-regular fa-pen-to-square"></i></button></td>
                                    <td class="reservation-table-td">미작성</td>
	                                <td><button class="status-btn complete">완료</button></td>
	                            </tr>
								</tbody>
	                        </table>
						</div>
                        
                        <div class="page-div">
                            <a href="#"
                                ><button class="page" type="button"><i class="fa-solid fa-angle-left"></i></button
                            ></a>
                            <a href="#"><button class="cur-page" type="button">1</button></a>
                            <a href="#"><button class="page" type="button">2</button></a>
                            <a href="#"><button class="page" type="button">3</button></a>
                            <a href="#"><button class="page" type="button">4</button></a>
                            <a href="#"><button class="page" type="button">5</button></a>
                            <a href="#"
                                ><button class="page" type="button"><i class="fa-solid fa-angle-right"></i></button
                            ></a>
                        </div>
                        
                        <jsp:include page="diaWrite.jsp"></jsp:include>
                        <jsp:include page="patientInfo.jsp"></jsp:include>
                        
                    </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="${pageContext.request.contextPath}/hosManager/js/managerHeader.js"></script>
        <script src="${pageContext.request.contextPath}/hosManager/js/modal1.js"></script>
        <script src="${pageContext.request.contextPath}/hosManager/js/modal2.js"></script>
        <script src="${pageContext.request.contextPath}/hosManager/js/modal3.js"></script>
    </body>
</html>

