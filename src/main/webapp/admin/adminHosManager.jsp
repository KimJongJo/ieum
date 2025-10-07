<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Document</title>
        <script src="https://kit.fontawesome.com/b5ec955390.js" crossorigin="anonymous"></script>

        <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/admin.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/adminNav.css" />
        
        <!-- jquery -->
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script>
		    // HTML 페이지에서 선언, JSP에서 EL 치환됨
		    const contextPath = "${pageContext.request.contextPath}";
		    let curPage = ${managerList.curPage};
		    let allPage = ${managerList.allPage};
		    let curKeyword = ""; // 현재 검색어
		    let filter = "none"; // 정렬 기준 초기값
		    let state = "0"; // 회원 상태 초기값 0 -> 전체
		    let role = "allMember"; // 병원관리자 역할 초기값 -> allMember는 전체
		</script>
		<script src="./js/adminManagersModal.js"></script>
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
                    <div class="info2">
                        <div class="search-name">
                            <span class="search-name-span">병원 관리자 목록 조회</span>
                        </div>
                        <form class="search-bar">
                            <input type="text" placeholder="검색" class="search-bar-input" id="searchKeyword"/>
                            <button class="search-bar-icon" type="button" id="searchBtn">
                                <i class="fa-solid fa-magnifying-glass"></i>
                            </button>

                            <select id="selectFilter" class="search-select">
                                <option value="none">정렬</option>
                                <option value="u_no">관리자 번호</option>
                                <option value="h_nm">병원이름</option>
                                <option value="created_at">가입일</option>
                            </select>
                        </form>
                        <div>
	                        <div class="filter-div">
	                            <div class="filter-radio">
	                                <input id="allMember" type="radio" name="role" value="allMember" class="role" checked />
	                                <label for="allMember" class="label">
	                                    <span class="filter-span">전체</span>
	                                </label>
	                            </div>
	                            <div class="filter-radio">
	                                <input id="doctor" type="radio" name="role" value="DOCTOR" class="role"  />
	                                <label for="doctor" class="label">
	                                    <span class="filter-span">의사</span>
	                                </label>
	                            </div>
	                            <div class="filter-radio">
	                                <input id="manager" type="radio" name="role" value="MANAGER" class="role"  />
	                                <label for="manager" class="label">
	                                    <span class="filter-span">병원관리자</span>
	                                </label>
	                            </div>
	                        </div>
                        	<div class="filter-div">
	                            <div class="filter-radio">
	                                <input id="all" type="radio" name="filter" value="0" class="state"  checked />
	                                <label for="all" class="label">
	                                    <span class="filter-span">전체</span>
	                                </label>
	                            </div>
	                            <div class="filter-radio">
	                                <input id="active" type="radio" name="filter" value="1" class="state"  />
	                                <label for="active" class="label">
	                                    <span class="filter-span">정상</span>
	                                </label>
	                            </div>
	                            <div class="filter-radio">
	                                <input id="stop" type="radio" name="filter" value="4" class="state"  />
	                                <label for="stop" class="label">
	                                    <span class="filter-span">휴직상태</span>
	                                </label>
	                            </div>
	                            <div class="filter-radio">
	                                <input id="hide" type="radio" name="filter" value="5" class="state"  />
	                                <label for="hide" class="label">
	                                    <span class="filter-span">퇴직상태</span>
	                                </label>
	                            </div>
	                        </div>
	                        
                        </div>
                        
                        <div class="table-div"   id="tableSetting">
                        <table class="table">
                        	<thead>
                        		<tr>
	                                <th style="width: 100px">관리자 번호</th>
	                                <th style="width: 100px">분류</th>
	                                <th style="width: 100px">이름</th>
	                                <th style="width: 150px">병원이름</th>
	                                <th>이메일</th>
	                                <th style="width: 100px">가입일</th>
	                                <th style="width: 100px">상태</th>
	                            </tr>
                        	</thead>
                        	<tbody>
                        		<c:choose>
									<c:when test="${empty managerList.list}">
										<tr>
											<td colspan="7">병원관리자가 존재하지 않습니다.</td>
										</tr>
									</c:when>
									<c:otherwise>
									<c:forEach var="manager" items="${managerList.list}">
										<tr class="userInfo" data-value="${manager.uNo}">
											<td>${manager.uNo}</td>
											<td>
												<c:choose>
													<c:when test="${manager.userType == 'DOCTOR'}">
														의사
													</c:when>
													<c:otherwise>
														병원관리자
													</c:otherwise>
												</c:choose>
											</td>
											<td>${manager.username}</td>
											<td>${manager.hNm}</td>
											<td>${manager.email}</td>
											<td>${manager.createdAt}</td>
											<td>
												<div class="state-div">
													<c:if test="${manager.stateCode == 1}">
														<div class="active">정상</div>
													</c:if>
													<c:if test="${manager.stateCode == 4}">
														<div class="leave">휴직</div>
													</c:if>
													<c:if test="${manager.stateCode == 5}">
														<div class="retired">퇴직</div>
													</c:if>
												</div>
											</td>
										</tr>
									</c:forEach>
									</c:otherwise>
								</c:choose>
                        	</tbody>
                        </table>
                        </div>
                       <c:if test="${not empty managerList.list}">
						<div class="page-div">
							<button class="page previous" type="button">
								<i class="fa-solid fa-angle-left"></i>
							</button>
							<!-- 페이지 번호 반복 -->
							    <c:forEach var="i" begin="${managerList.startPage}" end="${managerList.endPage}">
							        <c:choose>
							            <c:when test="${i == managerList.curPage}">
							                <button value="${i}" class="cur-page" type="button">${i}</button>
							            </c:when>
							            <c:otherwise>
							                <button value="${i}" class="page move-page" type="button">${i}</button>
							            </c:otherwise>
							        </c:choose>
							    </c:forEach>
						  
							<button class="page next-page" type="button">
								<i class="fa-solid fa-angle-right"></i>
							</button>
						</div>
				  	</c:if>
                        
                        <div class="modal-profile" id="modal-profile">
                        <div class="profile">
                            <div class="profile-header">
                                <span>ID : <span id="userNo"></span></span>
                                <i class="fa-solid fa-xmark"></i>
                            </div>
                            <div class="profile-name-div"><span class="profile-name" id="userName"> 김종조 </span></div>
                            <div class="profile-img-div">
                                <img id="userImg" src="../image/일반회원.png" class="profile-img" alt="" />
                            </div>
                            <table class="profile-table">
                             	<tr>
                                    <th>소속</th>
                                    <td class="profile-info" id="hosName">중랑구보건소</td>
                                    <td class="empty"></td>
                                </tr>
                                 <tr class="major-tr">
                                  
                                </tr>
                                <tr>
                                    <th>분류</th>
                                    <td class="profile-info" id="userType">접수담당자</td>
                                    <td class="empty"></td>
                                </tr>
                                <tr>
                                    <th>이메일</th>
                                    <td class="profile-info" id="emailTd">desk1614@gmail.com</td>
                                    <td class="empty"></td>
                                </tr>
                                <tr>
                                    <th>가입일</th>
                                    <td class="profile-info" id="createTd">2025-08-31</td>
                                    <td class="empty"></td>
                                </tr>
                                <tr>
                                    <th>상태</th>
                                    <td class="profile-info"><div id="stateDiv" class="active" style="display: inline-block">정상</div></td>
                                    <td class="empty"></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="${pageContext.request.contextPath}/admin/js/adminModal.js"></script>
    </body>
</html>
