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
<link rel="stylesheet" href="${pageContext.request.contextPath}/allCommunity/css/myCommunityList.css" />
<script src="${pageContext.request.contextPath}/allCommunity/js/myCommunityList.js"></script>
</head>
<body>

	<c:import url="/common/header/header.html" charEncoding="UTF-8"/>

    <!-- Section Title -->
    <div id="section-title">
        <span>나의 기본 정보</span>
    </div>

    <!-- Main -->
    <!-- a태그 <a href="/mypage"> -->
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
				        <li><button type="button">예약 내역</button></li>
				        <li><button type="button">진단 이력</button></li>
				        <a href="/ieum/myCom"><li><button type="button">나의 커뮤니티</button></li></a>
				        <a href="/ieum/black"><li><button type="button">차단 목록</button></li></a>
				        <li><button type="button">다이어리</button></li>
				        <li><button type="button">즐겨찾는 병원</button></li>
				    </ul>
                </div>
            </div>
        </div>

        <!-- 오른쪽 컨테이너: 옵션 + 새로운 영역 세로 배치 -->
        <div class="right-container" style="display:flex; flex-direction:column; gap:20px;">
            <!-- Options 컨테이너 -->
            <div id="option-container">
                <button class="tab-commu">작성한 게시판</button>
                <button class="tab-comment">작성한 댓글</button>
                <button class="tab-heart">좋아요 누른 게시판</button>
            </div>
			<c:forEach var="myComList" items="${myComList}" varStatus="status">

			    <input type="hidden" name="commu_no" class="commu_no" value="${myComList.commuNo}" />
			    
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
			                ❤️ <span class="action-count"><c:out value="${myComList.empathy}" /></span>
			            </span>
			            <span class="action-item">
			                💬 <span class="action-count"><c:out value="${myComList.commuComment}" /></span>
			            </span>
			            <span class="action-item">
			                🔗 <span class="action-count"><c:out value="${myComList.commuViews}" /></span>
			            </span>
			        </div>
			                <!-- 숨겨진 버튼: 전체 frame 클릭 시 제출 -->
        			<button type="submit" style="position:absolute; top:0; left:0; width:100%; height:100%; opacity:0; cursor:pointer; border:none; background:none;"></button>
			    </div>
			</c:forEach>
            
            
            <!-- 옵션 밑 새로운 영역 -->
            <div class="comment">
                <!-- 상단: 닉네임 + 카테고리 -->
                <div class="comment-top">
                    <div class="nickName">
                    	<c:out value="${member.nickName}" default="익명"/>
                    </div>
                </div>

                <!-- 제목 및 본문 -->
                <div class="overlap-group">
                    <p class="p">
                    	<c:out value="${comment.comContent}" escapeXml="false"/>
                    </p>
                </div>

                <!-- 업로드 날짜 -->
                <div class="text-wrapper-3">
                	<fmt:formatDate value="${comment.comCreated}" pattern="yyyy-MM-dd"/>
                </div>

                <!-- 액션 아이콘 (오른쪽 아래) -->
                <div id="actions">
                    <span class="action-item">
				        ❤️ <span class="action-count"><c:out value="${comment.comEmpathy}"/></span>
				    </span>
                </div>
            </div>
        </div>
    </div>
    
    <c:import url="../common/footer/footer.html" charEncoding="UTF-8"/>
</body>
</html>


