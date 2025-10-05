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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/hosManager/css/reservation.css" />
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
	                            <tr>
	                                <th style="width: 70px">예약ID</th>
	                                <th style="width: 150px">환자 이름</th>
	                                <th style="width: 150px">담당 의사</th>
	                                <th style="width: 200px">예약날짜 / 시간</th>
	                                <th colspan=2 style="width: 150px">진단서</th>
	                                <th>환자정보</th>
	                            </tr>
	                            <tr>
	                                <td class="reservation-table-td">R045</td>
	                                <td class="reservation-table-td">김환자</td>
	                                <td class="reservation-table-td">김의사</td>
	                                <td class="reservation-table-td">
	                                    <span>2025-08-31</span>
	                                    /
	                                    <span>10:00</span>
	                                </td>
	                                <td class="reservation-table-td">미작성</td>
	                                <td><button type="button" class="show-btn">보기</button></td>
	                                <td><button type="button" class="show-btn" id="show-patient-info">보기</button></td>
	                            </tr>
	                            
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
                    </div>
                    
                    
                    <jsp:include page="patientInfo.jsp"></jsp:include>
                    
                    
                </div>
            </div>
        </div>
        <script src="${pageContext.request.contextPath}/hosManager/js/managerHeader.js"></script>
        <script src="${pageContext.request.contextPath}/hosManager/js/modal1.js"></script>
        <script src="${pageContext.request.contextPath}/hosManager/js/modal3.js"></script>
    </body>
</html>
