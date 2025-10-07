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
		    let curPage = ${hosList.curPage};
		    let allPage = ${hosList.allPage};
		    let curKeyword = ""; // 현재 검색어
		    let filter = "none"; // 정렬 기준 초기값
		    let state = "ACTIVE"; // 회원 상태 초기값 0 -> 전체
		</script>
		
		
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
                            <input type="text" placeholder="검색" class="search-bar-input" id="searchKeyword"/>
                            <button class="search-bar-icon" type="button" id="searchBtn">
                                <i class="fa-solid fa-magnifying-glass"></i>
                            </button>

                            <select name="filter" id="selectFilter" class="search-select">
                                <option value="none">정렬</option>
                                <option value="h_no">병원 ID</option>
                                <option value="h_nm">병원명</option>
                                <option value="h_address">지역/주소</option>
                                <option value="category_no">병원유형</option>
                                <option value="h_created">등록일</option>
                                <option value="h_updated">최근수정일</option>
                            </select>
                        </form>
                        <div class="filter-div">
                            <div class="filter-radio">
                                <input id="all" type="radio" value="allHos" name="filter" class="state"/>
                                <label for="all" class="label">
                                    <span class="filter-span">전체</span>
                                </label>
                            </div>
                            <div class="filter-radio">
                                <input id="active" type="radio" name="filter" value="ACTIVE" class="state" checked />
                                <label for="active" class="label">
                                    <span class="filter-span">운영중</span>
                                </label>
                            </div>
                            <div class="filter-radio">
                                <input id="stop" type="radio" name="filter" value="INACTIVE" class="state" />
                                <label for="stop" class="label">
                                    <span class="filter-span">운영중지</span>
                                </label>
                            </div>
                        </div>
						<div class="table-div">
                        <table class="table" id="tableSetting">
                        	<thead>
                        		<tr>
	                                <th style="width: 100px">병원 ID</th>
	                                <th style="width: 100px">병원명</th>
	                                <th style="width: 300px">지역/주소</th>
	                                <th>병원유형</th>
	                                <th style="width: 150px">연락처</th>
	                                <th style="width: 100px">등록일</th>
	                                <th style="width: 100px">최근수정일</th>
	                            </tr>
                        	</thead>
                        	<tbody>
                        		<c:choose>
									<c:when test="${empty hosList.list}">
										<tr>
											<td colspan="6">병원이 존재하지 않습니다.</td>
										</tr>
									</c:when>
									<c:otherwise>
									<c:forEach var="hos" items="${hosList.list}">
										<tr class="trHover" data-value="${hos.hNo}">
											<td>${hos.hNo}</td>
											<td>${hos.hNm}</td>
											<td>${hos.hAddress}</td>
											<td>${hos.category}</td>
											<td>${hos.hTel}</td>
											<td>${hos.hCreated}</td>
											<td>${hos.hUpdated}</td>
										</tr>
									</c:forEach>
									</c:otherwise>
								</c:choose>
                        		
                        	</tbody>
                            
                        </table>
                        </div>
                        <c:if test="${not empty hosList.list}">
						<div class="page-div">
							<button class="page previous" type="button">
								<i class="fa-solid fa-angle-left"></i>
							</button>
							<!-- 페이지 번호 반복 -->
							    <c:forEach var="i" begin="${hosList.startPage}" end="${hosList.endPage}">
							        <c:choose>
							            <c:when test="${i == hosList.curPage}">
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
                        <div class="modal-hospital" id="modal-hospital">
                            <div class="hospital">
                                <div class="hospital-header">
                                    <i class="fa-solid fa-xmark"></i>
                                </div>
                                <div class="hospital-name-div"><span class="hospital-name" id="hosName"> 중랑구보건소 </span></div>
                                <table class="hospital-table">
                                    <tr>
                                        <th>병원 ID</th>
                                        <td class="hospital-info" id="hosNo">10203</td>
                                    </tr>
                                    <tr>
                                        <th>연락처</th>
                                        <td class="hospital-info" id="hosTel">02-1234-5678</td>
                                    </tr>
                                    <tr>
                                        <th>병원유형</th>
                                        <td class="hospital-info" id="hosCategory">병원</td>
                                    </tr>
                                    <tr>
                                        <th>주소</th>
                                        <td class="hospital-info" id="hosAddress">서울시 중랑구 어쩌구 저쩌구</td>
                                    </tr>
                                    <tr>
                                        <th>사업자등록번호</th>
                                        <td class="hospital-info" id="hosReNo">123-12-12345</td>
                                    </tr>
                                </table>
                                <div id="map" class="hospital-map"></div>
                                <div class="hospital-btn-div">
                                    <button id="checkBtn" class="hospital-btn-update">확인</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
		<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${kakaoKey}&libraries=services"></script>
		<script src="./js/adminHospitalsModal.js"></script>
    </body>
</html>
