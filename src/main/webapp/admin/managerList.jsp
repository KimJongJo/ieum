<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Document</title>
        <script src="https://kit.fontawesome.com/b5ec955390.js" crossorigin="anonymous"></script>

        <link rel="stylesheet" href="./css/admin.css" />
        <link rel="stylesheet" href="adminNav.css" />
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
                            <span class="search-name-span">병원 관리자 목록 조회</span>
                        </div>
                        <form class="search-bar">
                            <input type="text" placeholder="검색" class="search-bar-input" />
                            <button class="search-bar-icon" type="button">
                                <i class="fa-solid fa-magnifying-glass"></i>
                            </button>

                            <select name="" id="" class="search-select">
                                <option value="">정렬</option>
                                <option value="">관리자 번호</option>
                                <option value="">분류</option>
                                <option value="">병원이름</option>
                            </select>
                        </form>
                        <div class="filter-div">
                            <div class="filter-radio">
                                <input id="all" type="radio" name="filter" checked />
                                <label for="all" class="label">
                                    <span class="filter-span">전체</span>
                                </label>
                            </div>
                            <div class="filter-radio">
                                <input id="active" type="radio" name="filter" />
                                <label for="active" class="label">
                                    <span class="filter-span">정상</span>
                                </label>
                            </div>
                            <div class="filter-radio">
                                <input id="stop" type="radio" name="filter" />
                                <label for="stop" class="label">
                                    <span class="filter-span">휴직상태</span>
                                </label>
                            </div>
                            <div class="filter-radio">
                                <input id="hide" type="radio" name="filter" />
                                <label for="hide" class="label">
                                    <span class="filter-span">퇴직상태</span>
                                </label>
                            </div>
                        </div>
                        <table class="table">
                            <tr>
                                <th style="width: 100px">관리자 번호</th>
                                <th style="width: 100px">분류</th>
                                <th style="width: 100px">이름</th>
                                <th style="width: 150px">병원이름</th>
                                <th>이메일</th>
                                <th style="width: 100px">가입일</th>
                                <th style="width: 100px">상태</th>
                            </tr>
                            <tr>
                                <td>10203</td>
                                <td>접수담당자</td>
                                <td>김종조</td>
                                <td>중랑구보건소</td>
                                <td>desk1614@gmail.com</td>
                                <td>2025-08-31</td>
                                <td><div class="active">정상</div></td>
                            </tr>
                            <tr>
                                <td>10203</td>
                                <td>접수담당자</td>
                                <td>김종조</td>
                                <td>중랑구보건소</td>
                                <td>desk1614@gmail.com</td>
                                <td>2025-08-31</td>
                                <td><div class="leave">휴직</div></td>
                            </tr>
                            <tr>
                                <td>10203</td>
                                <td>접수담당자</td>
                                <td>김종조</td>
                                <td>중랑구보건소</td>
                                <td>desk1614@gmail.com</td>
                                <td>2025-08-31</td>
                                <td><div class="retired">퇴직</div></td>
                            </tr>
                            <tr>
                                <td>10203</td>
                                <td>접수담당자</td>
                                <td>김종조</td>
                                <td>중랑구보건소</td>
                                <td>desk1614@gmail.com</td>
                                <td>2025-08-31</td>
                                <td><div class="active">정상</div></td>
                            </tr>
                            <tr>
                                <td>10203</td>
                                <td>접수담당자</td>
                                <td>김종조</td>
                                <td>중랑구보건소</td>
                                <td>desk1614@gmail.com</td>
                                <td>2025-08-31</td>
                                <td><div class="leave">휴직</div></td>
                            </tr>
                            <tr>
                                <td>10203</td>
                                <td>접수담당자</td>
                                <td>김종조</td>
                                <td>중랑구보건소</td>
                                <td>desk1614@gmail.com</td>
                                <td>2025-08-31</td>
                                <td><div class="retired">퇴직</div></td>
                            </tr>
                            <tr>
                                <td>10203</td>
                                <td>접수담당자</td>
                                <td>김종조</td>
                                <td>중랑구보건소</td>
                                <td>desk1614@gmail.com</td>
                                <td>2025-08-31</td>
                                <td><div class="active">정상</div></td>
                            </tr>
                            <tr>
                                <td>10203</td>
                                <td>접수담당자</td>
                                <td>김종조</td>
                                <td>중랑구보건소</td>
                                <td>desk1614@gmail.com</td>
                                <td>2025-08-31</td>
                                <td><div class="leave">휴직</div></td>
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
                    </div>
                    <div class="modal-profile" id="modal-profile">
                        <div class="profile">
                            <div class="profile-header">
                                <span>ID : 10203</span>
                                <i class="fa-solid fa-xmark"></i>
                            </div>
                            <div class="profile-name-div"><span class="profile-name"> 김종조 </span></div>
                            <div class="profile-img-div">
                                <img src="../image/일반회원.png" class="profile-img" alt="" />
                            </div>
                            <table class="profile-table">
                                <tr>
                                    <th>이메일</th>
                                    <td class="profile-info">desk1614@gmail.com</td>
                                    <td class="empty"></td>
                                </tr>
                                <tr>
                                    <th>가입일</th>
                                    <td class="profile-info">2025-08-31</td>
                                    <td class="empty"></td>
                                </tr>
                                <tr>
                                    <th>분류</th>
                                    <td class="profile-info">접수담당자</td>
                                    <td class="empty"></td>
                                </tr>
                                <tr>
                                    <th>소속</th>
                                    <td class="profile-info">중랑구보건소</td>
                                    <td class="empty"></td>
                                </tr>
                                <tr>
                                    <th>상태</th>
                                    <td class="profile-info"><div class="active" style="display: inline-block">정상</div></td>
                                    <td class="empty"></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="adminNav.js"></script>
        <script src="./adminModal.js"></script>
    </body>
</html>
