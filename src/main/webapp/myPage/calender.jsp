<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>건강이음</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/myPage/css/calender.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/myPage/css/calender2.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/myPage/css/diagnosisHistory.css" />
<%-- <script src="${pageContext.request.contextPath}/myPage/css/calender.js"></script> --%>
<!-- <link
	href="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.15/index.global.min.css"
	rel="stylesheet"> -->
	
	
<script
	src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.15/index.global.min.js"></script>


</head>
<body>
<c:import url="/common/header/header.jsp" charEncoding="UTF-8"/>

    <!-- ✅ 중헤더 바로 밑에 텍스트 -->
	<div id="section-title">
		<div>
			<span>나만의 캘린더</span>
		</div>
	</div>
	<!-- Main -->
    <div class="main-container">
    <!-- Sidebar -->
        <div class="container-two">
            <div class="sidebar">
                <div class="sidebar-header">
                    건강이음<br>마이페이지
                </div>
                <div class="welcome">
                    <strong>*환영합니다*<br>최지성 회원님</strong>
                    <span>심원의방</span>
                </div>
                <div class="sidebar-body">
                     <ul>
					    <a href="/ieum/pInfo"><li><button type="button">나의 기본 정보</button></li></a>
					    <a href="/ieum/myPage/reservation/list"><li><button type="button">예약 내역</button></li></a>
						<a href="/ieum/myPage/diagnosisHistory"><li><button type="button">진단 이력</button></li></a>
					    <a href="/ieum/myCom"><li><button type="button">나의 커뮤니티</button></li></a>
					    <a href="/ieum/black"><li><button type="button">차단 목록</button></li></a>
					    <a href="/ieum/myPage/diary?page=1"><li><button type="button">다이어리</button></li></a>
						<a href="/ieum/hosFavorite"><li><button type="button">즐겨찾는 병원</button></li></a>
					</ul>
                </div>
            </div>
        </div>
        <!-- 오른쪽: 콘텐츠 (캘린더 + 진단 + 커뮤니티 세로 정렬) -->
    <div class="right-content">
	<%-- <c:import url="/common/calender/calender.jsp" charEncoding="UTF-8"/> --%>
	<div id="calendar"></div>
    <!-- 최근 진단 이력 -->
    <div class="container-three">
    
        <div id="diagnosis1">
            <div id="recent">최근 진단 이력</div>
            <button id="btn1">
                <img id="Heart1" src="${pageContext.request.contextPath}/img/버튼.png" alt="좋아요" width="15" height="15"/>
            </button>
        </div>
        
            
        <div id="diagnosis-box">
            <div id="box1">
                <div class="box-item">진단 일시</div>
                <div class="box-item">진단 명</div>
                <div class="box-item">결과요약</div>
                <div class="box-item">상세보기</div>
            </div>
            <c:if test="${showDIaListToUser !=null}">
            <div id="box2">
                <div class="box-item">${showDIaListToUser.rDate}</div>
                <div class="box-item">${showDIaListToUser.diagnosisName}</div>
                <div class="box-item">${showDIaListToUser.testSummary}</div>
                <div class="box-item">
                    <button id="btn2" value="${showDIaListToUser.diaNo}">진단 결과 보기</button>
                </div>
	            </div>
	            <div id="doc-comment">
	            	${showDIaListToUser.doctorComment}
	            </div>
	            <div id="upload">
	                <div>${showDIaListToUser.hNm}</div>
	                <div>${showDIaListToUser.rDate}</div>
	            </div>
			</c:if>
        </div>
		
        <div id="community-box">
            <div id="diagnosis2">
                <div id="recent">최근 커뮤니티</div>
                <button id="btn3">
                    <img id="Heart1" src="${pageContext.request.contextPath}/img/버튼.png" alt="좋아요" width="15" height="15"/>
                </button>
            </div>
            <c:if test="${not empty myComList}">
            <div class="frame" data-commu-no="${myComList.commuNo}"
            onclick="location.href='${pageContext.request.contextPath}/comDetail?no=${myComList.commuNo}'">
            <button type="submit" class="hidden-submit" style="display:none;"></button>
                <!-- 상단: 닉네임 + 카테고리 -->
			        <div class="frame-top">
			            <div class="text-wrapper-1">
			            	<c:out value="${myComList.nickName}" default="익명"/>
			            </div>
			            <div class="text-wrapper-2">
			            	<c:out value="${myComList.categoryName}" default="카테고리"/>
			            </div>
			        </div>

                <!-- 제목 및 본문 -->
			        <div class="overlap-group">
			            <div class="title"><c:out value="${myComList.commuTitle}"/></div>
			            <p class="p">
			            	<c:out value="${myComList.commuContent}" escapeXml="false"/>
			            </p>
			        </div>
			
			        <!-- 업로드 날짜 -->
			        <div class="text-wrapper-3">
			        	<fmt:formatDate value="${myComList.commuCreated}" pattern="yyyy-MM-dd"/>
			        </div>

                <!-- 액션 아이콘 (오른쪽 아래) -->
			        <div class="actions">
				            <span class="action-item">
				            <input type="hidden" name="commuNo" value="${myComList.commuNo}"/>
				            <button type="submit" class="heart-button">
				                <span class="heart1">
								    <c:choose>
								        <c:when test="${myComList.likedByUserCom}">
								        	 <img id="Heart1" src="${pageContext.request.contextPath}/img/빨간하트.png" alt="좋아요" width="15" height="15"/>
								        </c:when>
								        <c:otherwise>
								        	<img id="Heart1" src="${pageContext.request.contextPath}/img/횐색하트.png" alt="좋아요" width="15" height="15"/>
								        </c:otherwise>
								    </c:choose>
								</span>
				                <span class="action-count">
				                	<c:out value="${myComList.empathy}" />
				                </span>
				                </button>
				            </span>
			            <span class="action-item">
			                💬 <span class="action-count"><c:out value="${myComList.commuComment}" /></span>
			            </span>
			            <span class="action-item">
			                🔗 <span class="action-count"><c:out value="${myComList.commuViews}" /></span>
			            </span>
			        </div>
            </div>
            </c:if>
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
                                                <td class="td user-td" id="uNm"></td>
                                                <td class="th user-th th2">성별</td>
                                                <td class="td user-td" id="gender"></td>
                                                <td class="th user-th th2">생년월일</td>
                                                <td class="td user-td table-right" id="birthDate"></td>
                                            </tr>
                                        </table>
                                        <div><span>진단/진료상세</span></div>
                                        <table class="diagnosis-table">
                                            <tr>
                                                <td class="th diagnosis-th diagnosis-left" style="height: 40px">진단명</td>
                                                <td class="diagnosis-td diagnosis-right" id="diaName"></td>
                                            </tr>
                                            <tr>
                                                <td class="th diagnosis-th">증상</td>
                                                <td class="diagnosis-td" id="sym"></td>
                                            </tr>
                                            <tr>
                                                <td class="th diagnosis-th" style="height: 200px">주요검사 결과 요약</td>
                                                <td class="diagnosis-td" id="summary"></td>
                                            </tr>
                                            <tr>
                                                <td class="th diagnosis-th" style="height: 165px">처치/수술내용</td>
                                                <td class="diagnosis-td" id="treatment"></td>
                                            </tr>
                                            <tr>
                                                <td class="th diagnosis-th diagnosis-left-down">처방전</td>
                                                <td class="diagnosis-td diagnosis-right-down" id="pre"></td>
                                            </tr>
                                        </table>
                                    </div>
                                    <!-- 오른쪽 내용 -->
                                    <div class="right-div">
                                        <div><span>의사 정보</span></div>
                                        <div class="doctor-info">
                                            <img src="../image/병원관리자.png" alt="" class="doc-img" id="docImg"/>
                                            <table class="doctor-table">
                                                <tr>
                                                    <td class="th doctor-th">담당의사</td>
                                                    <td class="doctor-td doctor-first" id="mNm"></td>
                                                </tr>
                                                <tr>
                                                    <td class="th doctor-th">진료 일시</td>
                                                    <td class="doctor-td" id="rDate"></td>
                                                </tr>
                                                <tr>
                                                    <td class="th doctor-th">전공</td>
                                                    <td class="doctor-td" id="major"></td>
                                                </tr>
                                                <tr>
                                                    <td class="th doctor-th">진료 병원</td>
                                                    <td class="doctor-td doctor-last" id="hNm"></td>
                                                </tr>
                                            </table>
                                        </div>
                                        <div><span>의사의 말</span></div>
                                        <table class="comment-table">
                                            <tr>
                                                <td class="th comment-th" style="width: 180px">내용</td>
                                                <td class="comment-td" id="docComment"></td>
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
	 <c:import url="/common/footer/footer.html" charEncoding="UTF-8"/>
</body>
</html>


