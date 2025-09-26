<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Document</title>
        <script src="https://kit.fontawesome.com/b5ec955390.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/admin.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/adminNav.css" />
    </head>
    <body>
        <div class="main">
            <div class="main-div">
                 <!-- 헤더 들어올 곳 -->
                <jsp:include page="../common/header/adminHeader.html"></jsp:include>
                <!-- 아래 -->
                <div class="under-section">
                    <!-- 네비 들어올 곳 -->
                    <jsp:include page="../common/nav/adminNav.html"></jsp:include>
                    <div class="info">
                        <div class="search-name">
                            <span class="search-name-span">병원 목록 조회</span>
                        </div>
                        <form class="search-bar">
                            <input type="text" placeholder="검색" class="search-bar-input" />
                            <button class="search-bar-icon" type="button">
                                <i class="fa-solid fa-magnifying-glass"></i>
                            </button>

                            <select name="" id="" class="search-select">
                                <option value="">정렬</option>
                                <option value="">병원 ID</option>
                                <option value="">병원명</option>
                                <option value="">지역/주소</option>
                                <option value="">병원유형</option>
                                <option value="">등록일</option>
                                <option value="">최근수정일</option>
                            </select>
                        </form>
                        <div class="filter-div">
                            <div class="filter-radio">
                                <input id="all" type="radio" name="filter" />
                                <label for="all" class="label">
                                    <span class="filter-span">전체</span>
                                </label>
                            </div>
                            <div class="filter-radio">
                                <input id="active" type="radio" name="filter" checked />
                                <label for="active" class="label">
                                    <span class="filter-span">운영중</span>
                                </label>
                            </div>
                            <div class="filter-radio">
                                <input id="stop" type="radio" name="filter" />
                                <label for="stop" class="label">
                                    <span class="filter-span">운영중지</span>
                                </label>
                            </div>
                        </div>

                        <table class="table">
                            <tr>
                                <th style="width: 100px">병원 ID</th>
                                <th style="width: 100px">병원명</th>
                                <th style="width: 300px">지역/주소</th>
                                <th>병원유형</th>
                                <th style="width: 150px">연락처</th>
                                <th style="width: 100px">등록일</th>
                                <th style="width: 100px">최근수정일</th>
                            </tr>
                            <tr>
                                <td>10203</td>
                                <td>중랑구보건소</td>
                                <td>서울특별시 중랑구 봉화산로 179</td>
                                <td>병원</td>
                                <td>02-2094-0115</td>
                                <td>2025-08-31</td>
                                <td>2025-08-31</td>
                            </tr>
                            <tr>
                                <td>10203</td>
                                <td>중랑구보건소</td>
                                <td>서울특별시 중랑구 봉화산로 179</td>
                                <td>병원</td>
                                <td>02-2094-0115</td>
                                <td>2025-08-31</td>
                                <td>2025-08-31</td>
                            </tr>
                            <tr>
                                <td>10203</td>
                                <td>중랑구보건소</td>
                                <td>서울특별시 중랑구 봉화산로 179</td>
                                <td>병원</td>
                                <td>02-2094-0115</td>
                                <td>2025-08-31</td>
                                <td>2025-08-31</td>
                            </tr>
                            <tr>
                                <td>10203</td>
                                <td>중랑구보건소</td>
                                <td>서울특별시 중랑구 봉화산로 179</td>
                                <td>병원</td>
                                <td>02-2094-0115</td>
                                <td>2025-08-31</td>
                                <td>2025-08-31</td>
                            </tr>
                            <tr>
                                <td>10203</td>
                                <td>중랑구보건소</td>
                                <td>서울특별시 중랑구 봉화산로 179</td>
                                <td>병원</td>
                                <td>02-2094-0115</td>
                                <td>2025-08-31</td>
                                <td>2025-08-31</td>
                            </tr>
                            <tr>
                                <td>10203</td>
                                <td>중랑구보건소</td>
                                <td>서울특별시 중랑구 봉화산로 179</td>
                                <td>병원</td>
                                <td>02-2094-0115</td>
                                <td>2025-08-31</td>
                                <td>2025-08-31</td>
                            </tr>
                            <tr>
                                <td>10203</td>
                                <td>중랑구보건소</td>
                                <td>서울특별시 중랑구 봉화산로 179</td>
                                <td>병원</td>
                                <td>02-2094-0115</td>
                                <td>2025-08-31</td>
                                <td>2025-08-31</td>
                            </tr>
                            <tr>
                                <td>10203</td>
                                <td>중랑구보건소</td>
                                <td>서울특별시 중랑구 봉화산로 179</td>
                                <td>병원</td>
                                <td>02-2094-0115</td>
                                <td>2025-08-31</td>
                                <td>2025-08-31</td>
                            </tr>
                        </table>
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
                        <div class="modal-hospital" id="modal-hospital">
                            <div class="hospital">
                                <div class="hospital-header">
                                    <i class="fa-solid fa-xmark"></i>
                                </div>
                                <div class="hospital-name-div"><span class="hospital-name"> 중랑구보건소 </span></div>
                                <table class="hospital-table">
                                    <tr>
                                        <th>병원 ID</th>
                                        <td class="hospital-info">10203</td>
                                    </tr>
                                    <tr>
                                        <th>연락처</th>
                                        <td class="hospital-info">02-1234-5678</td>
                                    </tr>
                                    <tr>
                                        <th>병원유형</th>
                                        <td class="hospital-info">병원</td>
                                    </tr>
                                    <tr>
                                        <th>주소</th>
                                        <td class="hospital-info">서울시 중랑구 어쩌구 저쩌구</td>
                                    </tr>
                                </table>
                                <div class="hospital-map"></div>
                                <div class="hospital-btn-div">
                                    <button class="hospital-btn-update">수정</button>
                                    <button class="hospital-btn-delete">삭제</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="adminNav.js"></script>
        <script>
            // 공통 모달 열기
            function openModal(modalId) {
                const modal = document.getElementById(modalId);
                modal.style.display = "flex";
                document.body.style.overflow = "hidden"; // 스크롤 막기
            }

            // 공통 모달 닫기
            function closeModal(modalId) {
                const modal = document.getElementById(modalId);
                modal.style.display = "none";
                document.body.style.overflow = ""; // 스크롤 허용
            }

            // 특정 모달에 이벤트 연결
            function initModal(modalId, triggerSelector) {
                const modal = document.getElementById(modalId);
                const closeBtn = modal.querySelector(".fa-xmark");

                // 열기 이벤트
                document.querySelectorAll(triggerSelector).forEach((el) => {
                    el.addEventListener("click", () => openModal(modalId));
                });

                // 닫기 이벤트
                closeBtn.addEventListener("click", () => closeModal(modalId));
            }

            // 모달 초기화
            initModal("modal-hospital", ".table td"); // 병원 모달
            initModal("modal-profile", ".table td"); // 프로필 모달
        </script>
    </body>
</html>
