<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Document</title>
        <script src="https://kit.fontawesome.com/b5ec955390.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="css/manager.css" />
        <link rel="stylesheet" href="managerHeader.css" />
        <style>
            .main {
                min-width: 1600px;
            }

            .hos-name-div {
                margin-left: 10px;
            }

            .hos-name {
                font-size: 24px;
            }

            .select-div {
                width: 850px;
                display: flex;
                justify-content: space-between;
            }

            .search-div {
                display: flex;
                align-items: center;
            }

            .select-reservation {
                margin-top: 40px;
                margin-left: 10px;
            }

            .year,
            .month,
            .day {
                height: 25px;
                text-align: center;
                border: 1px solid #a6a6a6;
                border-radius: 5px;
            }

            .year {
                width: 120px;
            }

            .month,
            .day {
                width: 50px;
            }

            .reservation-input {
                height: 25px;
                border: 1px solid #a6a6a6;
                border-radius: 5px;
            }

            .reservation-btn {
                margin-left: 10px;
                height: 25px;
                width: 45px;
                border: none;
                color: white;
                background-color: #4356b3;
                border-radius: 5px;
            }

			.reservation-table-div{
				width:850px;
				height:560px;
			}

            .reservation-table {
                margin-top: 10px;
                width: 850px;
                border-collapse: collapse;
            }

            .tr:nth-child(odd) {
                background-color: #f6f8ff;
            }

            .th {
                text-align: center;
                height: 40px;
                font-size: 16px;
                background-color: #4356b3;
                color: white;
            }

            .td {
                height: 40px;
                text-align: center;
                border-bottom: 1px solid #a6a6a6;
            }

            .status-btn {
                border: none;
                background-color: transparent;
            }

            .complete,
            .cancle {
                font-size: 13px;
                width: 40px;
                height: 25px;
                border-radius: 5px;
                transition-duration: 0.2s;
                cursor: pointer;
            }

            .complete {
                background-color: #4356b3;
                color: white;
            }
            .complete:hover {
                background-color: #2d3975;
            }

            .cancle {
                border: 1px solid #4356b3;
                background-color: white;
                margin-left:10px;
            }

            .cancle:hover {
                background-color: #ffa7a4;
            }

            .ell-btn {
                transition-duration: 0.2s;
                border: none;
                margin-left: 20px;
                background-color: transparent;
                width: 22px;
                height: 25px;
                border-radius: 5px;
                cursor: pointer;
            }

            .fa-ellipsis-vertical {
                font-size: 20px;
            }

            .ell-btn:hover {
                background-color: #a6a6a6;
            }

            .search-name {
                width: 850px;
                margin-bottom: 15px;
            }

            .search-bar2 {
                width: 850px;
                display: flex;
                justify-content: space-between;
            }

            .today-res {
                font-size: 16px;
            }
        </style>
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
							<table class="table reservation-table">
	                            <tr>
	                                <th>예약ID</th>
	                                <th style="width: 150px">환자 이름</th>
	                                <th style="width: 150px">담당 의사</th>
	                                <th style="width: 200px">예약날짜 / 시간</th>
	                                <th>상태</th>
	                            </tr>
	                            <tr>
	                                <td>R045</td>
	                                <td>김환자</td>
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
                    </div>
                </div>
            </div>
        </div>
        <script src="managerHeader.js"></script>
    </body>
</html>
