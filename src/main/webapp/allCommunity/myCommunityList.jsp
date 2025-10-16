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
<script src="https://kit.fontawesome.com/8d48045bdd.js"></script>
<script src="${pageContext.request.contextPath}/allCommunity/js/myCommunityList.js"></script>
</head>
<body>

	<c:import url="/common/header/header.jsp" charEncoding="UTF-8"/>

    <!-- Section Title -->
    <div id="section-title">
        <span>나의 커뮤니티</span>
    </div>

    <!-- Main -->
    <!-- a태그 <a href="/mypage"> -->
    <div class="main-container">
        <!-- Sidebar -->
        <div class="container-two">
            <div class="sidebar">
            	<a href="/ieum/calender">
                <div class="sidebar-header">
                    건강이음<br>마이페이지
                </div>
                </a>
                <div class="welcome">
                    <strong>*환영합니다*<br>${ uNm } 회원님
                  </strong> <span>${nickNm }</span>
                </div>
                <div class="sidebar-body">
                     <ul>
			        	<a href="/ieum/pInfo"><li><button type="button">나의 기본 정보</button></li></a>
						<a href="/ieum/myPage/reservation/list"><li><button type="button">예약 내역</button></li></a>
						<a href="/ieum/myPage/diagnosisHistory"><li><button type="button">진단 이력</button></li></a>					<a href="/ieum/myCom"><li><button type="button">나의 커뮤니티</button></li></a>
						<a href="/ieum/black"><li><button type="button">차단 목록</button></li></a>
						<a href="/ieum/myPage/diary?page=1"><li><button type="button">다이어리</button></li></a>
						<a href="/ieum/hosFavorite"><li><button type="button">즐겨찾는 병원</button></li></a>
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
            <!-- 작성한 게시판 -->
			<c:forEach var="myComList" items="${myComList}" varStatus="status">
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
			                <img id="Heart1" src="${pageContext.request.contextPath}/img/조회수.png" alt="좋아요" width="15" height="15"/> <span class="action-count"><c:out value="${myComList.commuViews}" /></span>
			            </span>
			        </div>
			                <!-- 숨겨진 버튼: 전체 frame 클릭 시 제출 -->
        			<button type="submit" style="position:absolute; top:0; left:0; width:100%; height:100%; opacity:0; cursor:pointer; border:none; background:none;"></button>
			    </div>
			</c:forEach>
            
            <!-- 댓글 작성한 곳 -->
            <c:forEach var="myCommeList" items="${myCommeList}" varStatus="status">
            <!-- 옵션 밑 새로운 영역 -->
            <div class="comment" data-commu-no="${myCommeList.commuNo}"
             onclick="location.href='${pageContext.request.contextPath}/comDetail?no=${myCommeList.commuNo}'">
     
                <!-- 상단: 닉네임 + 카테고리 -->
                <div class="comment-top">
                    <div class="nickName">
                    	<c:out value="${myCommeList.nickname}" default="익명"/>
                    </div>
                </div>

                <!-- 제목 및 본문 -->
                <div class="overlap-group">
                    <p class="p">
                    	<c:out value="${myCommeList.comContent}" escapeXml="false"/>
                    </p>
                </div>

                <!-- 업로드 날짜 -->
                <div class="text-wrapper-3">
                	<fmt:formatDate value="${myCommeList.comCreated}" pattern="yyyy-MM-dd"/>
                </div>

                <!-- 액션 아이콘 (오른쪽 아래) -->
                <div id="actions">
                    <span class="action-item">
                     <input type="hidden" name="commuNo" value="${myCommeList.commuNo}"/>
				        <button type="submit" class="heart-button">
				                <span class="heart1">
								    <c:choose>
								        <c:when test="${myCommeList.likedByUserCom}">
								        	 <img id="Heart1" src="${pageContext.request.contextPath}/img/빨간하트.png" alt="좋아요" width="15" height="15"/>
								        </c:when>
								        <c:otherwise>
								        	<img id="Heart1" src="${pageContext.request.contextPath}/img/횐색하트.png" alt="좋아요" width="15" height="15"/>
								        </c:otherwise>
								    </c:choose>
								</span>
							<span class="action-count"><c:out value="${myCommeList.comEmpathy}"/></span>
				        </button>				        
				    </span>
                </div>
            </div>
            </c:forEach>
            
            
            
            
            <c:forEach var="myEmpathy" items="${myEmpathy}" varStatus="status">

			    <input type="hidden" name="commu_no" class="commu_no" value="${myEmpathy.commuNo}" />
			    
			    <div class="frame1" data-commu-no="${myEmpathy.commuNo}"
			    	onclick="location.href='${pageContext.request.contextPath}/comDetail?no=${myEmpathy.commuNo}'">
			    <button type="submit" class="hidden-submit" style="display:none;"></button>
			        <!-- 상단: 닉네임 + 카테고리 -->
			        <div class="frame-top">
			            <div class="text-wrapper-1">
			            	<c:out value="${myEmpathy.nickName}" default="익명"/>
			            </div>
			            <div class="text-wrapper-2">
			            	<c:out value="${myEmpathy.categoryName}" default="카테고리"/>
			            </div>
			        </div>
			
			        <!-- 제목 및 본문 -->
			        <div class="overlap-group">
			            <div class="title"><c:out value="${myEmpathy.commuTitle}"/></div>
			            <p class="p">
			            	<c:out value="${myEmpathy.commuContent}" escapeXml="false"/>
			            </p>
			        </div>
			
			        <!-- 업로드 날짜 -->
			        <div class="text-wrapper-3">
			        	<fmt:formatDate value="${myEmpathy.commuCreated}" pattern="yyyy-MM-dd"/>
			        </div>
			
			        <!-- 액션 아이콘 (오른쪽 아래) -->
			        <div class="actions">
			            <span class="action-item">
			                 <img id="Heart1" src="${pageContext.request.contextPath}/img/빨간하트.png" alt="좋아요" width="15" height="15"/>
			                 <span class="action-count"><c:out value="${myEmpathy.empathy}" /></span>
			            </span>
			            <span class="action-item">
			                💬 <span class="action-count"><c:out value="${myEmpathy.commuComment}" /></span>
			            </span>
			            <span class="action-item">
			                <img id="Heart1" src="${pageContext.request.contextPath}/img/조회수.png" alt="좋아요" width="15" height="15"/> <span class="action-count"><c:out value="${myEmpathy.commuViews}" /></span>
			            </span>
			        </div>
			                <!-- 숨겨진 버튼: 전체 frame 클릭 시 제출 -->
        			<button type="submit" style="position:absolute; top:0; left:0; width:100%; height:100%; opacity:0; cursor:pointer; border:none; background:none;"></button>
			    </div>
			</c:forEach>
			
			
			
			<!-- 작성한 게시판 페이징 -->
<div class="paging comPaging" style="text-align:center; margin:40px 0;">
    <c:choose>
        <c:when test="${comPageInfo.curPage > 1}">
            <a href="${pageContext.request.contextPath}/myCom?comPage=${comPageInfo.curPage-1}&commentPage=${commentPageInfo.curPage}&heartPage=${heartPageInfo.curPage}">
                <img id="arrow" src="${pageContext.request.contextPath}/img/입체왼쪽화살표.png" width="20" height="20"/>
            </a>
        </c:when>
        <c:otherwise>
            <a>
                <img id="arrow" src="${pageContext.request.contextPath}/img/입체왼쪽화살표.png" width="20" height="20"/>
            </a>
        </c:otherwise>
    </c:choose>

    <c:forEach begin="${comPageInfo.startPage}" end="${comPageInfo.endPage}" var="page">
        <a href="${pageContext.request.contextPath}/myCom?comPage=${page}&commentPage=${commentPageInfo.curPage}&heartPage=${heartPageInfo.curPage}"
           class="${comPageInfo.curPage == page ? 'select' : 'btn'}">${page}</a>
    </c:forEach>

    <c:choose>
        <c:when test="${comPageInfo.curPage < comPageInfo.allPage}">
            <a href="${pageContext.request.contextPath}/myCom?comPage=${comPageInfo.curPage+1}&commentPage=${commentPageInfo.curPage}&heartPage=${heartPageInfo.curPage}">
                <img id="arrow" src="${pageContext.request.contextPath}/img/입체오른쪽화살표.png" width="20" height="20"/>
            </a>
        </c:when>
        <c:otherwise>
            <a>
                <img id="arrow" src="${pageContext.request.contextPath}/img/입체오른쪽화살표.png" width="20" height="20"/>
            </a>
        </c:otherwise>
    </c:choose>
</div>

<!-- 작성한 댓글 페이징 -->
<div class="paging commentPaging" style="text-align:center; margin:40px 0;">
    <c:choose>
        <c:when test="${commentPageInfo.curPage > 1}">
            <a href="${pageContext.request.contextPath}/myCom?comPage=${comPageInfo.curPage}&commentPage=${commentPageInfo.curPage-1}&heartPage=${heartPageInfo.curPage}">
                <img id="arrow" src="${pageContext.request.contextPath}/img/입체왼쪽화살표.png" width="20" height="20"/>
            </a>
        </c:when>
        <c:otherwise>
            <a>
                <img id="arrow" src="${pageContext.request.contextPath}/img/입체왼쪽화살표.png" width="20" height="20"/>
            </a>
        </c:otherwise>
    </c:choose>

    <c:forEach begin="${commentPageInfo.startPage}" end="${commentPageInfo.endPage}" var="page">
        <a href="${pageContext.request.contextPath}/myCom?comPage=${comPageInfo.curPage}&commentPage=${page}&heartPage=${heartPageInfo.curPage}"
           class="${commentPageInfo.curPage == page ? 'select' : 'btn'}">${page}</a>
    </c:forEach>

    <c:choose>
        <c:when test="${commentPageInfo.curPage < commentPageInfo.allPage}">
            <a href="${pageContext.request.contextPath}/myCom?comPage=${comPageInfo.curPage}&commentPage=${commentPageInfo.curPage+1}&heartPage=${heartPageInfo.curPage}">
                <img id="arrow" src="${pageContext.request.contextPath}/img/입체오른쪽화살표.png" width="20" height="20"/>
            </a>
        </c:when>
        <c:otherwise>
            <a>
                <img id="arrow" src="${pageContext.request.contextPath}/img/입체오른쪽화살표.png" width="20" height="20"/>
            </a>
        </c:otherwise>
    </c:choose>
</div>

<!-- 좋아요 누른 게시판 페이징 -->
<div class="paging heartPaging" style="text-align:center; margin:40px 0;">
    <c:choose>
        <c:when test="${heartPageInfo.curPage > 1}">
            <a href="${pageContext.request.contextPath}/myCom?comPage=${comPageInfo.curPage}&commentPage=${commentPageInfo.curPage}&heartPage=${heartPageInfo.curPage-1}">
                <img id="arrow" src="${pageContext.request.contextPath}/img/입체왼쪽화살표.png" width="20" height="20"/>
            </a>
        </c:when>
        <c:otherwise>
            <a>
                <img id="arrow" src="${pageContext.request.contextPath}/img/입체왼쪽화살표.png" width="20" height="20"/>
            </a>
        </c:otherwise>
    </c:choose>

    <c:forEach begin="${heartPageInfo.startPage}" end="${heartPageInfo.endPage}" var="page">
        <a href="${pageContext.request.contextPath}/myCom?comPage=${comPageInfo.curPage}&commentPage=${commentPageInfo.curPage}&heartPage=${page}"
           class="${heartPageInfo.curPage == page ? 'select' : 'btn'}">${page}</a>
    </c:forEach>

    <c:choose>
        <c:when test="${heartPageInfo.curPage < heartPageInfo.allPage}">
            <a href="${pageContext.request.contextPath}/myCom?comPage=${comPageInfo.curPage}&commentPage=${commentPageInfo.curPage}&heartPage=${heartPageInfo.curPage+1}">
                <img id="arrow" src="${pageContext.request.contextPath}/img/입체오른쪽화살표.png" width="20" height="20"/>
            </a>
        </c:when>
        <c:otherwise>
            <a>
                <img id="arrow" src="${pageContext.request.contextPath}/img/입체오른쪽화살표.png" width="20" height="20"/>
            </a>
        </c:otherwise>
    </c:choose>
</div>

            
        </div>
    </div>
    
    <c:import url="../common/footer/footer.html" charEncoding="UTF-8"/>
</body>
</html>

