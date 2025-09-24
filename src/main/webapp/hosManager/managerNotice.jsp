<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Document</title>
        <script src="https://kit.fontawesome.com/b5ec955390.js" crossorigin="anonymous"></script>
        <style>
            .main {
                min-width: 1600px;
            }

            .under-section {
                padding-top: 35px;
                display: flex;
                justify-content: center;
                align-items: flex-start;
                height: 895px;
                background-color: #f7faff;
            }

            .info {
                width: 970px;
                height: 815px;
                background-color: white;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: flex-start;
            }

            .search-div {
                display: flex;
                align-items: center;
            }

            .search-keyword-box {
                display: flex;
                align-items: center;
                border: 1px solid #e7e7e7;
                border-radius: 5px;
                background-color: #f9fbff;
            }

            .keyword-input {
                width: 215px;
                height: 35px;
                background-color: transparent;
                border: none;
                text-align: right;
            }

            .keyword-input:focus {
                outline: none;
            }

            .search-img {
                color: #7e7e7e;
                font-size: 20px;
                margin-right: 10px;
                margin-left: 10px;
            }

            .filter-select {
                width: 150px;
                height: 35px;
                border: 1px solid #e7e7e7;
                border-radius: 5px;
                background-color: #f9fbff;
                margin-left: 20px;
            }

            .select-reservation {
                margin-top: 40px;
                margin-left: 10px;
                margin-bottom: 15px;
                width: 100%;
                display: flex;
                justify-content: center;
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

            .reservation-table {
                margin-top: 10px;
                width: 950px;
                border-collapse: collapse;
            }

            .notice-div {
                display: flex;
                justify-content: space-between;
                width: 895px;
            }

            .notice-span {
                font-size: 20px;
            }

            .notice-table {
                width: 895px;
                border-collapse: collapse;
            }

            .notice-table td {
                border-bottom: 1px solid #eeeeee;
                height: 70px;
            }

            .n-t-th {
                text-align: center;
                color: #b5b7c0;
            }

            .n-t-td {
                text-align: center;
            }

            .checkinput {
                text-align: center;
            }

            .n-update,
            .n-delete {
                width: 40px;
                height: 30px;
                font-size: 12px;
                border: none;
                border-radius: 5px;
                transition-duration: 0.2s;
                cursor: pointer;
            }

            .n-update:hover {
                background-color: #e0e3ee;
            }
            .n-delete:hover {
                background-color: #fccece;
            }

            .page-nav {
                display: flex;
                justify-content: space-around;
                align-items: center;
                width: 440px;
                height: 55px;
                margin-top: 15px;
            }

            .page-nav a {
                color: black;
                text-decoration-line: none;
                width: 33px;
                height: 33px;
                text-align: center;
                line-height: 33px;
            }

            .page-nav i {
                text-align: center;
                line-height: 35px;
            }

            .cur-page {
                background-color: #a7c6f4;
                border-radius: 50px;
            }
        </style>
        <link rel="stylesheet" href="./managerHeader.css" />
    </head>
    <body>
        <div class="main">
            <div class="main-div">
                <div class="under-section">
                    <jsp:include page="managerHeader.html"></jsp:include>
                    <div class="info">
                        <div class="select-reservation">
                            <div class="notice-div">
                                <span class="notice-span">공지사항</span>
                                <div class="search-div">
                                    <div class="search-keyword-box">
                                        <input type="text" placeholder="검색" class="keyword-input" />
                                        <i class="fa-solid fa-magnifying-glass search-img"></i>
                                    </div>
                                    <select name="" id="" class="filter-select">
                                        <option value="">정렬</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <table class="notice-table">
                            <tr>
                                <td class="n-t-th"><input type="checkbox" /></td>
                                <td class="n-t-th">번호</td>
                                <td class="n-t-th">제목</td>
                                <td class="n-t-th">작성자</td>
                                <td class="n-t-th">등록일</td>
                                <td class="n-t-th">최근수정일</td>
                                <td class="n-t-th">관리</td>
                            </tr>
                            <tr>
                                <td class="checkinput"><input type="checkbox" /></td>
                                <td class="n-t-td">93</td>
                                <td class="n-t-td">구로구 병원 휴진일 공고</td>
                                <td class="n-t-td">구로구병원</td>
                                <td class="n-t-td">2025-09-05</td>
                                <td class="n-t-td">2025-09-06</td>
                                <td class="n-t-td"><button class="n-update">수정</button> <button class="n-delete">삭제</button></td>
                            </tr>
                            <tr>
                                <td class="checkinput"><input type="checkbox" /></td>
                                <td class="n-t-td">93</td>
                                <td class="n-t-td">구로구 병원 휴진일 공고</td>
                                <td class="n-t-td">구로구병원</td>
                                <td class="n-t-td">2025-09-05</td>
                                <td class="n-t-td">2025-09-06</td>
                                <td class="n-t-td"><button class="n-update">수정</button> <button class="n-delete">삭제</button></td>
                            </tr>
                            <tr>
                                <td class="checkinput"><input type="checkbox" /></td>
                                <td class="n-t-td">93</td>
                                <td class="n-t-td">구로구 병원 휴진일 공고</td>
                                <td class="n-t-td">구로구병원</td>
                                <td class="n-t-td">2025-09-05</td>
                                <td class="n-t-td">2025-09-06</td>
                                <td class="n-t-td"><button class="n-update">수정</button> <button class="n-delete">삭제</button></td>
                            </tr>
                            <tr>
                                <td class="checkinput"><input type="checkbox" /></td>
                                <td class="n-t-td">93</td>
                                <td class="n-t-td">구로구 병원 휴진일 공고</td>
                                <td class="n-t-td">구로구병원</td>
                                <td class="n-t-td">2025-09-05</td>
                                <td class="n-t-td">2025-09-06</td>
                                <td class="n-t-td"><button class="n-update">수정</button> <button class="n-delete">삭제</button></td>
                            </tr>
                            <tr>
                                <td class="checkinput"><input type="checkbox" /></td>
                                <td class="n-t-td">93</td>
                                <td class="n-t-td">구로구 병원 휴진일 공고</td>
                                <td class="n-t-td">구로구병원</td>
                                <td class="n-t-td">2025-09-05</td>
                                <td class="n-t-td">2025-09-06</td>
                                <td class="n-t-td"><button class="n-update">수정</button> <button class="n-delete">삭제</button></td>
                            </tr>
                            <tr>
                                <td class="checkinput"><input type="checkbox" /></td>
                                <td class="n-t-td">93</td>
                                <td class="n-t-td">구로구 병원 휴진일 공고</td>
                                <td class="n-t-td">구로구병원</td>
                                <td class="n-t-td">2025-09-05</td>
                                <td class="n-t-td">2025-09-06</td>
                                <td class="n-t-td"><button class="n-update">수정</button> <button class="n-delete">삭제</button></td>
                            </tr>
                            <tr>
                                <td class="checkinput"><input type="checkbox" /></td>
                                <td class="n-t-td">93</td>
                                <td class="n-t-td">구로구 병원 휴진일 공고</td>
                                <td class="n-t-td">구로구병원</td>
                                <td class="n-t-td">2025-09-05</td>
                                <td class="n-t-td">2025-09-06</td>
                                <td class="n-t-td"><button class="n-update">수정</button> <button class="n-delete">삭제</button></td>
                            </tr>
                            <tr>
                                <td class="checkinput"><input type="checkbox" /></td>
                                <td class="n-t-td">93</td>
                                <td class="n-t-td">구로구 병원 휴진일 공고</td>
                                <td class="n-t-td">구로구병원</td>
                                <td class="n-t-td">2025-09-05</td>
                                <td class="n-t-td">2025-09-06</td>
                                <td class="n-t-td"><button class="n-update">수정</button> <button class="n-delete">삭제</button></td>
                            </tr>
                        </table>
                        <div class="page-nav">
                            <a href="#"><i class="fa-solid fa-chevron-left"></i></a>
                            <a href="#" class="cur-page">1</a>
                            <a href="#">2</a>
                            <a href="#">3</a>
                            <a href="#">4</a>
                            <a href="#">5</a>
                            <a href="#">6</a>
                            <a href="#">7</a>
                            <a href="#">8</a>
                            <a href="#">9</a>
                            <a href="#">10</a>
                            <a href="#"><i class="fa-solid fa-chevron-right"></i></a>
                        </div>
                    </div>
                </div>
                <%-- <jsp:include page="../footer.html"></jsp:include> --%>
            </div>
        </div>

        <script src="./managerHeader.js"></script>
    </body>
</html>
