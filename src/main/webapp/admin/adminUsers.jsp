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
		    let curPage = ${userList.curPage};
		    let allPage = ${userList.allPage};
		    let curKeyword = ""; // 현재 검색어
		    let filter = "none"; // 정렬 기준 초기값
		    let state = "0"; // 회원 상태 초기값 0 -> 전체
		</script>
		<script src="./js/adminUsersModal.js"></script>
		
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
                            <input type="text" placeholder="검색" class="search-bar-input" id="searchKeyword"/>
                            <button class="search-bar-icon" type="button" id="searchBtn">
                                <i class="fa-solid fa-magnifying-glass"></i>
                            </button>

                            <select name="selectFilter"  id="selectFilter" class="search-select">
                                <option value="none">정렬</option>
                                <option value="u_no">회원번호</option>
                                <option value="created_at">가입일</option>
                                <option value="warning_count">경고수</option>
                            </select>
                        </form>
                        <div class="filter-div">
                            <div class="filter-radio">
                                <input id="all" type="radio" name="filter" value="0" class="state" checked />
                                <label for="all" class="label">
                                    <span class="filter-span">전체</span>
                                </label>
                            </div>
                            <div class="filter-radio">
                                <input id="active" type="radio" name="filter" value="1" class="state" />
                                <label for="active" class="label">
                                    <span class="filter-span">정상</span>
                                </label>
                            </div>
                            <div class="filter-radio">
                                <input id="stop" type="radio" name="filter" value="2" class="state" />
                                <label for="stop" class="label">
                                    <span class="filter-span">활동정지</span>
                                </label>
                            </div>
                            <div class="filter-radio">
                                <input id="hide" type="radio" name="filter" value="3" class="state" />
                                <label for="hide" class="label">
                                    <span class="filter-span">비활성화</span>
                                </label>
                            </div>
                        </div>
                        <div class="table-div">
                        <table class="table"  id="tableSetting">
	                        <thead>
	                        <tr>
	                                <th style="width: 100px">회원번호</th>
	                                <th style="width: 150px">이름</th>
	                                <th>이메일</th>
	                                <th style="width: 150px">가입일</th>
	                                <th style="width: 100px">경고수</th>
	                                <th style="width: 150px">정지상태</th>
	                            </tr>
	                        </thead>
	                        <tbody>
	                        	<c:choose>
								<c:when test="${empty userList.list}">
									<tr>
										<td colspan="6">회원이 존재하지 않습니다.</td>
									</tr>
								</c:when>
								<c:otherwise>
								<c:forEach var="user" items="${userList.list}">
									<tr class="userInfo" data-value="${user.uNo}">
										<td>${user.uNo}</td>
										<td>${user.username}</td>
										<td>${user.email}</td>
										<td>${user.createdAt}</td>
										<td>${user.warningCount}</td>
										<td>
											<div class="state-div">
												<c:if test="${user.stateCode == 1}">
													<div class="active">정상</div>
												</c:if>
												<c:if test="${user.stateCode == 2}">
													<div class="hide">비활성화</div>
												</c:if>
												<c:if test="${user.stateCode == 3}">
													<div class="stop">활동정지</div>
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
                        <c:if test="${not empty userList.list}">
						<div class="page-div">
							<button class="page previous" type="button">
								<i class="fa-solid fa-angle-left"></i>
							</button>
							<!-- 페이지 번호 반복 -->
							    <c:forEach var="i" begin="${userList.startPage}" end="${userList.endPage}">
							        <c:choose>
							            <c:when test="${i == userList.curPage}">
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
                                <span>ID : <span id="userNo">10203</span></span>
                                <i class="fa-solid fa-xmark"></i>
                            </div>
                            <div class="profile-name-div"><span class="profile-name" id="userName"></span></div>
                            <div class="profile-img-div">
                                <img id="userImg" class="profile-img" alt="" />
                            </div>
                            <table class="profile-table">
                                <tr>
                                    <th>이메일</th>
                                    <td class="profile-info" id="emailTd"></td>
                                    <td class="empty"></td>
                                </tr>
                                <tr>
                                    <th>가입일</th>
                                    <td class="profile-info" id="createTd"></td>
                                    <td class="empty"></td>
                                </tr>
                                <tr>
                                    <th>경고수</th>
                                    <td class="profile-info" id="warningCountTd"></td>
                                    <td class="empty"></td>
                                </tr>
                                <tr>
                                    <th>정지상태</th>
                                    <td rowspan=2 class="profile-info">
                                    	<div class="select-state">
										    <div class="user-ch-state">
										    	<label for="active2">
										    		<div class="active">정상</div>
										    	</label>
										        <input type="radio" name="state" id="active2" value="active"/>
										    </div>
										    <div class="user-ch-state">
										    	<label for="hide2">
										    		<div class="hide">비활성화</div>
										    	</label>
										        <input type="radio" name="state" id="hide2" value="hide"/>
										    </div>
										    <div class="user-ch-state">
										    	<label for="stop2">
										    		<div class="stop">활동정지</div>
										    	</label>
										        <input type="radio" name="state" id="stop2" value="stop"/>
										    </div>
										</div>
                                    </td>
                                </tr>
                            </table>
                            <button type="button" class="warning" id="saveBtn">저장</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
	
        <%-- <script src="${pageContext.request.contextPath}/admin/js/adminModal.js"></script> --%>
<!--         <script>
			// 클릭하면 선택 표시 적용
			const states = document.querySelectorAll('.user-ch-state');
			
			states.forEach(state => {
			    state.addEventListener('click', () => {
			        // 이전 선택 해제
			        states.forEach(s => s.classList.remove('selected'));
			        // 현재 선택
			        state.classList.add('selected');
			        // 라디오 버튼 체크
			        state.querySelector('input[type="radio"]').checked = true;
			    });
			});
		</script> -->
    </body>
</html>
