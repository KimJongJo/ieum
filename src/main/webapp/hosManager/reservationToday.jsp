<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Document</title>
        <script src="https://kit.fontawesome.com/b5ec955390.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="css/manager.css" />
        <link rel="stylesheet" href="css/managerHeader.css" />
        <link rel="stylesheet" href="css/reservationToday.css" />
        <link rel="stylesheet" href="css/patientInfo.css" />
        <link rel="stylesheet" href="css/infoModal.css" />
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
	                            <tr>
	                                <th>예약ID</th>
	                                <th style="width: 150px" colspan=2>환자 이름/프로필</th>
	                                <th style="width: 150px">담당 의사</th>
	                                <th style="width: 200px">예약날짜 / 시간</th>
	                                <th>상태</th>
	                            </tr>
	                            <tr>
	                                <td>R045</td>
	                                <td>김환자</td>
	                                <td><button type="button" class="search-user-btn"><i class="fa-solid fa-magnifying-glass"></i></button></td>
	                                <td>김의사</td>
	                                <td>
	                                    <span>2025-08-31</span>
	                                    /
	                                    <span>10:00</span>
	                                </td>
	                                <td><button class="status-btn complete">완료</button> <button class="status-btn cancle">취소</button></td>
	                            </tr>
	                            <tr>
	                                <td>R045</td>
	                                <td>김환자</td>
	                                <td><button type="button" class="search-user-btn"><i class="fa-solid fa-magnifying-glass"></i></button></td>
	                                <td>김의사</td>
	                                <td>
	                                    <span>2025-08-31</span>
	                                    /
	                                    <span>10:00</span>
	                                </td>
	                                <td><button class="status-btn complete">완료</button> <button class="status-btn cancle">취소</button></td>
	                            </tr>
	                            <tr>
	                                <td>R045</td>
	                                <td>김환자</td>
	                                <td><button type="button" class="search-user-btn"><i class="fa-solid fa-magnifying-glass"></i></button></td>
	                                <td>김의사</td>
	                                <td>
	                                    <span>2025-08-31</span>
	                                    /
	                                    <span>10:00</span>
	                                </td>
	                                <td><button class="status-btn complete">완료</button> <button class="status-btn cancle">취소</button></td>
	                            </tr>
	                            <tr>
	                                <td>R045</td>
	                                <td>김환자</td>
	                                <td><button type="button" class="search-user-btn"><i class="fa-solid fa-magnifying-glass"></i></button></td>
	                                <td>김의사</td>
	                                <td>
	                                    <span>2025-08-31</span>
	                                    /
	                                    <span>10:00</span>
	                                </td>
	                                <td><button class="status-btn complete">완료</button> <button class="status-btn cancle">취소</button></td>
	                            </tr>
	                            <tr>
	                                <td>R045</td>
	                                <td>김환자</td>
	                                <td><button type="button" class="search-user-btn"><i class="fa-solid fa-magnifying-glass"></i></button></td>
	                                <td>김의사</td>
	                                <td>
	                                    <span>2025-08-31</span>
	                                    /
	                                    <span>10:00</span>
	                                </td>
	                                <td><button class="status-btn complete">완료</button> <button class="status-btn cancle">취소</button></td>
	                            </tr>
	                            <tr>
	                                <td>R045</td>
	                                <td>김환자</td>
	                                <td><button type="button" class="search-user-btn"><i class="fa-solid fa-magnifying-glass"></i></button></td>
	                                <td>김의사</td>
	                                <td>
	                                    <span>2025-08-31</span>
	                                    /
	                                    <span>10:00</span>
	                                </td>
	                                <td><button class="status-btn complete">완료</button> <button class="status-btn cancle">취소</button></td>
	                            </tr>
	                            <tr>
	                                <td>R045</td>
	                                <td>김환자</td>
	                                <td><button type="button" class="search-user-btn"><i class="fa-solid fa-magnifying-glass"></i></button></td>
	                                <td>김의사</td>
	                                <td>
	                                    <span>2025-08-31</span>
	                                    /
	                                    <span>10:00</span>
	                                </td>
	                                <td><button class="status-btn complete">완료</button> <button class="status-btn cancle">취소</button></td>
	                            </tr>
	                            <tr>
	                                <td>R045</td>
	                                <td>김환자</td>
	                                <td><button type="button" class="search-user-btn"><i class="fa-solid fa-magnifying-glass"></i></button></td>
	                                <td>김의사</td>
	                                <td>
	                                    <span>2025-08-31</span>
	                                    /
	                                    <span>10:00</span>
	                                </td>
	                                <td><button class="status-btn complete">완료</button> <button class="status-btn cancle">취소</button></td>
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
                        <jsp:include page="patientInfo.jsp"></jsp:include>
                        
                    </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="js/managerHeader.js"></script>
        <script src="js/modal2.js"></script>
        <script src="js/modal3.js"></script>
    </body>
</html>

