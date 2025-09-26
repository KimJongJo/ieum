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
                            <span class="search-name-span">일반 사용자 목록 조회</span>
                        </div>
                        <form class="search-bar">
                            <input type="text" placeholder="검색" class="search-bar-input" />
                            <button class="search-bar-icon" type="button">
                                <i class="fa-solid fa-magnifying-glass"></i>
                            </button>

                            <select name="" id="" class="search-select">
                                <option value="">정렬</option>
                                <option value="">회원번호</option>
                                <option value="">가입일</option>
                                <option value="">경고수</option>
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
                                    <span class="filter-span">활동정지</span>
                                </label>
                            </div>
                            <div class="filter-radio">
                                <input id="hide" type="radio" name="filter" />
                                <label for="hide" class="label">
                                    <span class="filter-span">비활성화</span>
                                </label>
                            </div>
                        </div>
                        <table class="table">
                            <tr>
                                <th style="width: 100px">회원번호</th>
                                <th style="width: 150px">이름</th>
                                <th>이메일</th>
                                <th style="width: 150px">가입일</th>
                                <th style="width: 100px">경고수</th>
                                <th style="width: 150px">정지상태</th>
                            </tr>
                            <tr>
                                <td>10203</td>
                                <td>김종조</td>
                                <td>desk1614@gmail.com</td>
                                <td>2025-08-31</td>
                                <td>0</td>
                                <td><div class="active">정상</div></td>
                            </tr>
                            <tr>
                                <td>10203</td>
                                <td>김종조</td>
                                <td>desk1614@gmail.com</td>
                                <td>2025-08-31</td>
                                <td>0</td>
                                <td><div class="stop">활동정지</div></td>
                            </tr>
                            <tr>
                                <td>10203</td>
                                <td>김종조</td>
                                <td>desk1614@gmail.com</td>
                                <td>2025-08-31</td>
                                <td>0</td>
                                <td><div class="hide">비활성화</div></td>
                            </tr>
                            <tr>
                                <td>10203</td>
                                <td>김종조</td>
                                <td>desk1614@gmail.com</td>
                                <td>2025-08-31</td>
                                <td>0</td>
                                <td><div class="active">정상</div></td>
                            </tr>
                            <tr>
                                <td>10203</td>
                                <td>김종조</td>
                                <td>desk1614@gmail.com</td>
                                <td>2025-08-31</td>
                                <td>0</td>
                                <td><div class="stop">활동정지</div></td>
                            </tr>
                            <tr>
                                <td>10203</td>
                                <td>김종조</td>
                                <td>desk1614@gmail.com</td>
                                <td>2025-08-31</td>
                                <td>0</td>
                                <td><div class="hide">비활성화</div></td>
                            </tr>
                            <tr>
                                <td>10203</td>
                                <td>김종조</td>
                                <td>desk1614@gmail.com</td>
                                <td>2025-08-31</td>
                                <td>0</td>
                                <td><div class="active">정상</div></td>
                            </tr>
                            <tr>
                                <td>10203</td>
                                <td>김종조</td>
                                <td>desk1614@gmail.com</td>
                                <td>2025-08-31</td>
                                <td>0</td>
                                <td><div class="stop">활동정지</div></td>
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
                                <img src="../image/회원이미지.jpg" class="profile-img" alt="" />
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
                                    <th>경고수</th>
                                    <td class="profile-info">0</td>
                                    <td class="empty"></td>
                                </tr>
                                <tr>
                                    <th>정지상태</th>
                                    <td class="profile-info"><div class="active" style="display: inline-block">정상</div></td>
                                    <td class="empty"></td>
                                </tr>
                            </table>
                            <button type="button" class="warning">경고주기</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
	
		<script src="adminNav.js"></script>
        <script src="adminModal.js"></script>
    </body>
</html>
