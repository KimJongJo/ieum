<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Document</title>
        <style>
            .modal-div {
                display: none;
                width: 100%;
                height: 100%;
                background-color: rgba(217, 217, 217, 0.7);
                position: fixed;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                justify-content: center;
                align-items: center;
            }

            .main {
                min-width: 1600px;
            }

            .under-section {
                padding-top: 35px;
                height: 100%;
                display: flex;
                justify-content: center;
                align-items: flex-start;
            }

            .first-block {
                width: 195px;
                height: 115px;
                background-color: #4356b3;
                border-radius: 5px 5px 0 0;
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
            }

            .first-block-span {
                color: white;
                font-size: 17px;
            }

            .second-block {
                width: 195px;
                height: 105px;
                background-color: #ccd1df;
                display: flex;
                flex-direction: column;
                align-items: flex-start;
                justify-content: center;
            }

            .second-block > span {
                padding-left: 15px;
            }

            .second-block-first {
                font-size: 17px;
            }

            .second-block-second {
                font-size: 17px;
                font-weight: bold;
            }

            .second-block-third {
                font-size: 13px;
                color: #96989e;
            }

            .button-block {
                display: flex;
                flex-direction: column;
            }

            .button {
                width: 195px;
                height: 50px;
                background-color: white;
                border: 1px solid #bfbfbf;
                cursor: pointer;
                text-align: start;
                padding-left: 15px;
                font-size: 16px;
            }

            .button-block .button:last-child {
                border-radius: 0 0 5px 5px;
            }

            .main-nav {
                width: 195px;
                margin-right: 35px;
            }

            .info {
                width: 970px;
                height: 100%;
                background-color: white;
                display: flex;
                flex-direction: column;
                align-items: flex-start;
                justify-content: flex-start;
            }

            .info-div {
                width: 100%;
                height: 150px;
                background-color: #f7faff;
                display: flex;
                flex-direction: column;
                justify-content: center;
            }

            .info-span {
                font-size: 18px;
                margin-left: 20px;
            }

            .info-ul {
                margin-top: 40px;
                padding-left: 40px;
            }

            .select-div-date {
                width: 100%;
                margin-top: 40px;
                display: flex;
                justify-content: flex-end;
            }

            .select-date {
                font-size: 20px;
                margin-left: 25px;
                margin-right: 25px;
            }

            .caret-btn {
                width: 25px;
                height: 30px;
                font-size: 20px;
                cursor: pointer;
            }

            .calendar {
                width: 100%;
                height: 460px;
                background-color: #96989e;
                margin-top: 10px;
            }

            #diagnosis-box {
                border: 2px solid #d9d9d9;
                background-color: white;
                width: 966px;
                height: 230px;
                display: flex; /* flex 사용 */
                flex-direction: column; /* 세로로 쌓기 */
                align-items: center; /* 가로 중앙 정렬 */
                margin-bottom: 40px;
                border-radius: 15px;
            }

            #box1 {
                width: 950px;
                height: 45px;
                border: 1px solid #d9d9d9;
                margin: 20px auto 0 auto;
                display: flex;
                justify-content: space-between;
            }

            #box2 {
                width: 950px;
                height: 45px;
                border: 1px solid #d9d9d9;
                display: flex;
                justify-content: space-between;
                margin: 0 auto 0 auto;
            }

            /* 각 영역 */
            .box-item {
                flex: 1; /* 영역을 균등 분할 */
                border-right: 1px solid #d9d9d9; /* 구분선 */
                display: flex; /* 안쪽 텍스트 정렬용 */
                align-items: center; /* 세로 가운데 */
                justify-content: center; /* 가로 가운데 */
                font-size: 14px;
            }

            /* 마지막 영역은 오른쪽 선 제거 */
            .box-item:last-child {
                border-right: none;
            }
            .btn2 {
                width: 100px;
                height: 30px;
                border: 1px solid #888;
                background-color: #d9d9d9;
                border-radius: 15px;
                cursor: pointer; /* 손가락 커서 */
                transition: all 0.2s ease; /* 부드러운 애니메이션 */
            }

            /* 마우스를 올렸을 때 */
            .btn2:hover {
                background-color: #c0c0c0;
                transform: translateY(-2px); /* 살짝 위로 */
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2); /* 눌린 듯한 그림자 */
            }

            /* 클릭 중(active)일 때 */
            .btn2:active {
                transform: translateY(1px); /* 눌린 듯 아래로 */
                box-shadow: 0 2px 3px rgba(0, 0, 0, 0.2);
            }

            #doc-comment {
                font-size: 14px;
                width: 900px;
                margin: 20px auto 0 auto;
            }

            #upload {
                display: flex; /* 가로 정렬 */
                justify-content: flex-start; /* 왼쪽 정렬 */
                gap: 20px; /* 요소 사이 간격 */
                margin: 20px auto 0 auto;
                font-size: 12px;
                width: 940px;
            }

            .select-div {
                width: 100%;
                display: flex;
                justify-content: flex-end;
                margin-top: 20px;
                margin-bottom: 20px;
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

            .reservation-btn {
                height: 25px;
                width: 45px;
                border: none;
                color: white;
                background-color: #4356b3;
                border-radius: 5px;
                cursor: pointer;
            }

            .reservation-btn:hover {
                background-color: #2d3975;
            }

            .diagnosis {
            	min-width:1550px;
                width: 1550px;
                height: 770px;
                border: 1px solid #a6a6a6;
                background-color: white;
                border: none;
                border-radius: 5px;
            }
            .diagnosis-div {
                display: flex;
                justify-content: space-around;
                align-items: center;
                height: 650px;
            }

            .xmark-div {
                display: flex;
                justify-content: flex-end;
            }

            .fa-xmark {
                margin-top: 10px;
                margin-right: 10px;
                font-size: 20px;
            }

            .user-table {
                width: 710px;
                height: 40px;
                table-layout: fixed;
            }

            .th {
                background-color: #4356b3;
                font-size: 14px;
                color: white;
                text-align: center;
            }

            .user-th {
                width: 110px;
                height: 100%;
            }

            .td {
                height: 38px;
                text-align: center;
            }
            .user-td {
                border-top: 1px solid #a6a6a6;
                border-bottom: 1px solid #a6a6a6;
            }

            /* .table-left {
                border-radius: 5px 0 0 5px;
            }

            .table-right {
                border-right: 1px solid #a6a6a6;
                border-radius: 0 5px 5px 0;
            } */

            .diagnosis-table {
                width: 710px;
                height: 510px;
            }

            .diagnosis-th {
                width: 180px;
            }
            .diagnosis-td {
                padding: 10px;
                border: 1px solid #a6a6a6;
            }
            /* .diagnosis-left {
                border-radius: 5px 0 0 0;
            }

            .diagnosis-right {
                border-radius: 0 5px 0 0;
            }

            .diagnosis-left-down {
                border-radius: 0 0 0 5px;
            }

            .diagnosis-right-down {
                border-radius: 0 0 5px 0;
            } */

            .left-div {
                display: flex;
                flex-direction: column;
                justify-content: space-between;
                width: 710px;
                height: 100%;
            }

            .right-div {
                display: flex;
                flex-direction: column;
                justify-content: space-between;
                width: 710px;
                height: 100%;
            }

            .img {
                width: 180px;
                height: 190px;
                background-color: aquamarine;
            }

            .doctor-info {
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            .doctor-th {
                width: 150px;
                height: 40px;
            }

            .doctor-td {
                padding: 10px;
                width: 345px;
                border: 1px solid #a6a6a6;
            }

            /* .doctor-first {
                border-radius: 0 5px 0 0;
            }

            .doctor-last {
                border-radius: 0 0 5px 0;
            } */

            .comment-table {
                width: 100%;
                height: 380px;
            }

            .comment-td {
                padding: 10px;
            }

            /* .comment-td {
                border: 1px solid #a6a6a6;
                padding-left: 10px;
                border-radius: 0 5px 5px 0;
            }

            .comment-th {
                border-radius: 5px 0 0 5px;
            } */

            .btn-div {
                display: flex;
                justify-content: center;
                margin-top: 30px;
            }

            .check-btn {
                width: 70px;
                height: 40px;
                border: none;
                border-radius: 5px;
                color: white;
                background-color: #4356b3;
                cursor: pointer;
                transition-duration: 0.2s;
            }

            .check-btn:hover {
                background-color: #33418a;
            }

            .user-table,
            .diagnosis-table,
            .doctor-table,
            .comment-table {
                border-collapse: collapse;
            }

            .user-table td,
            .diagnosis-table td,
            .doctor-table td,
            .comment-table td {
                border: 1px solid #a6a6a6;
            }

            .doc-img {
                width: 180px;
                height: 190px;
            }
        </style>
        <script src="https://kit.fontawesome.com/b5ec955390.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <div class="main">
            <div class="main-div">
                <div class="under-section">
                    <div class="main-nav">
                        <div class="first-block">
                            <img src="../image/건강이음.png" width="120px" alt="" />
                            <span class="first-block-span">마이페이지</span>
                        </div>
                        <div class="second-block">
                            <span class="second-block-first">뭐 알아서 관리해</span>
                            <span class="second-block-second">관리자(너 나 우리)</span>
                            <span class="second-block-third">심원의 방</span>
                        </div>
                        <div class="button-block">
                            <button type="button" class="button">대기열 관리</button>
                            <button type="button" class="button">공지사항 관리</button>
                        </div>
                    </div>
                    <div class="info">
                        <div class="info-div">
                            <span class="info-span">진료 기록 조회</span>
                            <ul class="info-ul">
                                <li class="info-li">과거 내원했던 병원의 정보와 날짜, 담당의가 작성했던 진단서를 확인할 수 있습니다.</li>
                            </ul>
                        </div>
                        <div class="select-div-date">
                            <button class="caret-btn"><i class="fa-solid fa-caret-left"></i></button>
                            <span class="select-date">2025.09</span>
                            <button class="caret-btn"><i class="fa-solid fa-caret-right"></i></button>
                        </div>
                        <div class="calendar"></div>
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
                                <button type="button" class="reservation-btn">검색</button>
                            </div>
                        </div>
                        <div>
                            <div id="diagnosis-box">
                                <div id="box1">
                                    <div class="box-item">진단 일시</div>
                                    <div class="box-item">진단 명</div>
                                    <div class="box-item">결과요약</div>
                                    <div class="box-item">상세보기</div>
                                </div>
                                <div id="box2">
                                    <div class="box-item">2025-09-18</div>
                                    <div class="box-item">우울증</div>
                                    <div class="box-item">중(약 복용)</div>
                                    <div class="box-item">
                                        <button class="btn2">진단 결과 보기</button>
                                    </div>
                                </div>
                                <div id="doc-comment">
                                    우울증은 단순한 슬픔과는 달리, 하루 대부분 지속되는 우울감, 흥미와 즐거움 상실, 의욕 저하 등이 주요 증상으로 나타나 일상생활과 사회생활에 어려움을 주는 질병입니다
                                </div>
                                <div id="upload">
                                    <div>수원시 보건소</div>
                                    <div>업로드 날짜</div>
                                </div>
                            </div>
                            <div id="diagnosis-box">
                                <div id="box1">
                                    <div class="box-item">진단 일시</div>
                                    <div class="box-item">진단 명</div>
                                    <div class="box-item">결과요약</div>
                                    <div class="box-item">상세보기</div>
                                </div>
                                <div id="box2">
                                    <div class="box-item">2025-09-18</div>
                                    <div class="box-item">우울증</div>
                                    <div class="box-item">중(약 복용)</div>
                                    <div class="box-item">
                                        <button class="btn2">진단 결과 보기</button>
                                    </div>
                                </div>
                                <div id="doc-comment">
                                    우울증은 단순한 슬픔과는 달리, 하루 대부분 지속되는 우울감, 흥미와 즐거움 상실, 의욕 저하 등이 주요 증상으로 나타나 일상생활과 사회생활에 어려움을 주는 질병입니다
                                </div>
                                <div id="upload">
                                    <div>수원시 보건소</div>
                                    <div>업로드 날짜</div>
                                </div>
                            </div>
                            <div id="diagnosis-box">
                                <div id="box1">
                                    <div class="box-item">진단 일시</div>
                                    <div class="box-item">진단 명</div>
                                    <div class="box-item">결과요약</div>
                                    <div class="box-item">상세보기</div>
                                </div>
                                <div id="box2">
                                    <div class="box-item">2025-09-18</div>
                                    <div class="box-item">우울증</div>
                                    <div class="box-item">중(약 복용)</div>
                                    <div class="box-item">
                                        <button class="btn2">진단 결과 보기</button>
                                    </div>
                                </div>
                                <div id="doc-comment">
                                    우울증은 단순한 슬픔과는 달리, 하루 대부분 지속되는 우울감, 흥미와 즐거움 상실, 의욕 저하 등이 주요 증상으로 나타나 일상생활과 사회생활에 어려움을 주는 질병입니다
                                </div>
                                <div id="upload">
                                    <div>수원시 보건소</div>
                                    <div>업로드 날짜</div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-div" id="modal-div">
                            <div class="diagnosis">
                                <div class="xmark-div"><i class="fa-solid fa-xmark"></i></div>
                                <div class="diagnosis-div">
                                    <!-- 왼쪽 내용 -->
                                    <div class="left-div">
                                        <div><span>환자 정보</span></div>
                                        <table class="user-table">
                                            <tr>
                                                <td class="th user-th table-left">이름</td>
                                                <td class="td user-td">김종조</td>
                                                <td class="th user-th th2">성별</td>
                                                <td class="td user-td">남</td>
                                                <td class="th user-th th2">나이</td>
                                                <td class="td user-td table-right">26</td>
                                            </tr>
                                        </table>
                                        <div><span>진단/진료상세</span></div>
                                        <table class="diagnosis-table">
                                            <tr>
                                                <td class="th diagnosis-th diagnosis-left" style="height: 40px">진단명</td>
                                                <td class="diagnosis-td diagnosis-right">진단명내용</td>
                                            </tr>
                                            <tr>
                                                <td class="th diagnosis-th">증상</td>
                                                <td class="diagnosis-td">증상내용</td>
                                            </tr>
                                            <tr>
                                                <td class="th diagnosis-th" style="height: 200px">주요검사 결과 요약</td>
                                                <td class="diagnosis-td">검사 내용</td>
                                            </tr>
                                            <tr>
                                                <td class="th diagnosis-th" style="height: 165px">처치/수술내용</td>
                                                <td class="diagnosis-td">처치 수술 내용</td>
                                            </tr>
                                            <tr>
                                                <td class="th diagnosis-th diagnosis-left-down">처방전</td>
                                                <td class="diagnosis-td diagnosis-right-down">약, 이름, 용량, 투여 방법</td>
                                            </tr>
                                        </table>
                                    </div>
                                    <!-- 오른쪽 내용 -->
                                    <div class="right-div">
                                        <div><span>의사 정보</span></div>
                                        <div class="doctor-info">
                                            <img src="../image/병원관리자.png" alt="" class="doc-img" />
                                            <table class="doctor-table">
                                                <tr>
                                                    <td class="th doctor-th">담당의사</td>
                                                    <td class="doctor-td doctor-first">김종조</td>
                                                </tr>
                                                <tr>
                                                    <td class="th doctor-th">진료 일시</td>
                                                    <td class="doctor-td">2025-08-31</td>
                                                </tr>
                                                <tr>
                                                    <td class="th doctor-th">진료 유형</td>
                                                    <td class="doctor-td">외래/응급</td>
                                                </tr>
                                                <tr>
                                                    <td class="th doctor-th">진료 병원</td>
                                                    <td class="doctor-td doctor-last">중랑구 보건소</td>
                                                </tr>
                                            </table>
                                        </div>
                                        <div><span>의사의 말</span></div>
                                        <table class="comment-table">
                                            <tr>
                                                <td class="th comment-th" style="width: 180px">내용</td>
                                                <td class="comment-td">아프지 마세요~</td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                                <div class="btn-div"><button type="button" class="check-btn" id="check">확인</button></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script>
            const modalProfile = document.getElementById("modal-div");
            const closeBtn = modalProfile.querySelector(".fa-xmark"); // 닫기 아이콘

            // 모달 열기 함수
            function openModal() {
                modalProfile.style.display = "flex"; // 모달 보이기
                document.body.style.overflow = "hidden"; // 스크롤 막기
                
            }

            // 모달 닫기 함수
            function closeModal() {
                modalProfile.style.display = "none"; // 모달 숨기기
                document.body.style.overflowY = ""; // 스크롤 허용
                
            }

            // 예: 테이블에서 클릭 시 모달 열기 (임의 예시)
            document.querySelectorAll(".btn2").forEach((td) => {
                td.addEventListener("click", () => {
                    openModal();
                });
            });

            // 모달 배경 클릭 시 모달 닫기
            modalProfile.addEventListener("click", (e) => {
                // 모달 안쪽(.profile) 클릭은 무시
                if (e.target === modalProfile) {
                    closeModal();
                }
            });

            document.getElementById("check").addEventListener("click", () => {
                closeModal();
            });

            // 닫기 버튼 클릭 시
            closeBtn.addEventListener("click", closeModal);
        </script>
    </body>
</html>
