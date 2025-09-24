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
        <link rel="stylesheet" href="reservation.css" />
        
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
	                                <th style="width: 150px">진단서</th>
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
	                                <td>미작성</td>
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
	                                <td>미작성</td>
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
	                                <td>미작성</td>
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
	                                <td>미작성</td>
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
	                                <td>미작성</td>
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
	                                <td>미작성</td>
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
	                                <td>미작성</td>
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
	                                <td>미작성</td>
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
                    <div class="modal-dia" id="modal-dia">
                        <form action="" class="form-div">
                            <div class="save-div">
                                <div class="xmark-div"><i class="fa-solid fa-xmark"></i></div>
                                <table class="user-dia-table">
                                	<tr>
                                		<td colspan="6" class="td-name">환자 정보</td>
                                	</tr>
                                    <tr>
                                        <td class="u-td u-th up">환자ID</td>
                                        <td class="u-td up">2241</td>
                                        <td class="u-td u-th up">나이</td>
                                        <td class="u-td up">26</td>
                                        <td class="u-td u-th">연락처</td>
                                        <td class="u-td add">010-1234-5678</td>
                                    </tr>
                                    <tr>
                                        <td class="u-td u-th up">이름</td>
                                        <td class="u-td up">김종조</td>
                                        <td class="u-td u-th up">성별</td>
                                        <td class="u-td up">남</td>
                                        <td class="u-td u-th ">주소</td>
                                        <td class="u-td add">서울시 중랑구 어쩌구 저쩌구</td>
                                    </tr>
                                	<tr>
                                		<td colspan="6" class="td-name">진료 정보</td>
                                	</tr>
                                    <tr>
                                        <td class="u-td u-th up">진료ID</td>
                                        <td class="u-td up">2241</td>
                                        <td class="u-td u-th up">진료 일시</td>
                                        <td class="u-td up">2025-08-31</td>
                                        <td class="u-td u-th">진료 병원</td>
                                        <td class="u-td add">중랑구보건소</td>
                                    </tr>
                                    <tr>
                                        <td class="u-td u-th">담당의사</td>
                                        <td class="u-td">김종조</td>
                                        <td class="u-td u-th">진료 유형</td>
                                        <td class="u-td">외래/응급</td>
                                        <td class="u-td u-th">병원 주소</td>
                                        <td class="u-td add">중랑구 보건소 어쩌구 저쩌구</td>
                                    </tr>
                                    <tr>
                                		<td colspan="6" class="td-name">진단/진료상세</td>
                                	</tr>
                                    <tr>
                                        <td class="u-td u-th up">진단명</td>
                                        <td class="u-td up">2241</td>
                                        <td class="u-td u-th up">증상</td>
                                        <td colspan="3" id="area1" class="u-td "><textarea name="" id="" class="area area1"></textarea></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" class="u-td u-th" style="height: 185px">검사 내용 및 결과</td>
                                        <td colspan="4" id="area2" class="u-td" colspan="2"><textarea name="" id="" class="area area2"></textarea></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" class="u-td u-th">처치/수술내용</td>
                                        <td colspan="4" id="area3" class="u-td" colspan="2"><textarea name="" id="" class="area area3"></textarea></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" class="u-td u-th">처방전</td>
                                        <td colspan="4" id="area4" class="u-td" colspan="2"><textarea name="" id="" class="area area4"></textarea></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" class="u-td u-th">의사의 말</td>
                                        <td colspan="4" id="area5" class="u-td" colspan="2"><textarea name="" id="" class="area area5"></textarea></td>
                                    </tr>
                                </table>
                                <div id="btn-event">
                                    <button id="btn-cancellation">임시저장</button>
                                    <button id="btn-complete">저장</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <script src="managerHeader.js"></script>
        <script>
            const modalProfile = document.getElementById("modal-dia");
            const closeBtn = modalProfile.querySelector(".fa-xmark"); // 닫기 아이콘

            // 모달 열기 함수
            function openModal() {
                modalProfile.style.display = "flex"; // 모달 보이기
                document.body.style.overflow = "hidden"; // 스크롤 막기
            }

            // 모달 닫기 함수
            function closeModal() {
                modalProfile.style.display = "none"; // 모달 숨기기
                document.body.style.overflow = ""; // 스크롤 허용
            }

            // 예: 테이블에서 클릭 시 모달 열기 (임의 예시)
            document.querySelectorAll(".reservation-table td").forEach((td) => {
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

            // 닫기 버튼 클릭 시
            closeBtn.addEventListener("click", closeModal);
        </script>
    </body>
</html>
