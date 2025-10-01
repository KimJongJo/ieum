<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>건강이음</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/modal.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/allCommunity/css/allCommunityList.css" />
<script src="${pageContext.request.contextPath}/allCommunity/js/allCommunityList.js"></script>

</head>
<body>

    <c:import url="../common/header/header.html" charEncoding="UTF-8"/>

    <!-- Section Title -->
    <div id="section-title">
        <span>모든 커뮤니티</span>
    </div>

    <!-- 메인 컨테이너: 1280px 중앙 고정 -->
    <div class="main-container">
        <div class="category-box">
        <div class="category-title">카테고리</div>
        <ul class="category-list">
            <li><input type="radio" name="category" id="all"><label for="all">모든 사연</label></li>
            <li><input type="radio" name="category" id="baby"><label for="baby">육아/출산</label></li>
            <li><input type="radio" name="category" id="finance"><label for="finance">금전/사업</label></li>
            <li><input type="radio" name="category" id="lgbt"><label for="lgbt">LGBT</label></li>
            <li><input type="radio" name="category" id="child"><label for="child">자아/성격</label></li>
            <li><input type="radio" name="category" id="love"><label for="love">연애</label></li>
            <li><input type="radio" name="category" id="divorce"><label for="divorce">이별/이혼</label></li>
            <li><input type="radio" name="category" id="crime"><label for="crime">성범죄</label></li>
            <li><input type="radio" name="category" id="pets"><label for="pets">펫로스</label></li>
            <li><input type="radio" name="category" id="study"><label for="study">학업/고시</label></li>
            <li><input type="radio" name="category" id="sex"><label for="sex">성생활</label></li>
            <li><input type="radio" name="category" id="social"><label for="social">대인관계/따돌림</label></li>
            <li><input type="radio" name="category" id="appearance"><label for="appearance">외모</label></li>
            <li><input type="radio" name="category" id="health"><label for="health">신체건강</label></li>
            <li><input type="radio" name="category" id="mental"><label for="mental">정신건강</label></li>
            <li><input type="radio" name="category" id="family"><label for="family">가족</label></li>
            <li><input type="radio" name="category" id="job"><label for="job">취업/진로</label></li>
            <li><input type="radio" name="category" id="marriage"><label for="marriage">부부관계</label></li>
            <li><input type="radio" name="category" id="work"><label for="work">직장</label></li>
            <li><input type="radio" name="category" id="etc"><label for="etc">기타</label></li>
        </ul>
        </div>

         <!-- 👉 오른쪽 영역 전체 -->
	     <div class="right-container">
	        <!-- 버튼 영역 -->
	        <div class="sort-buttons">
	            <div class="left-buttons">
	                <button id="latest">최신순</button>
	                <button id="empathy">공감순</button>
	                <button id="by-view">조회순</button>
	            </div>
	            
	            <div class="right-button">
	                <a href="write"><button id="write">작성하기</button></a>
	            </div>
	        </div>
	            <!-- ✅ 게시글 2열 컨테이너 추가 -->
    	<div class="community-grid">
			<c:forEach var="allComList" items="${allComList}" varStatus="status">
			
		        <!-- ✅ box를 버튼 아래로 -->
			    <div class="boxes"
			    onclick="location.href='${pageContext.request.contextPath}/comDetail?no=${allComList.commuNo}'">
			        <div class="box">
			            <div class="text-wrapper-1">
			            	<c:out value="${allComList.nickName}" default="익명"/>
			            </div>
			            <div class="text-wrapper-2">
			            	<c:out value="${allComList.categoryName}" default="카테고리"/>
			            </div>
			        </div>
			        <div class="overlap-group">
			            <div class="div"></div>
			            <p class="p">
			            	<c:out value="${allComList.commuContent}" escapeXml="false"/>
			            </p>
			        </div>
					<!-- ✅ 날짜 + 액션 묶음 -->
					<div class="bottom-info">
					    <div class="text-wrapper-3">
					        <fmt:formatDate value="${allComList.commuCreated}" pattern="yyyy-MM-dd"/>
					    </div>
					    <div class="actions">
					        <span class="action-item">
					            ❤️ <span class="action-count"><c:out value="${allComList.empathy}" /></span>
					        </span>
					        <span class="action-item">
					            💬 <span class="action-count"><c:out value="${allComList.commuComment}" /></span>
					        </span>
					        <span class="action-item">
					            🔗 <span class="action-count"><c:out value="${allComList.commuViews}" /></span>
					        </span>
					    </div>
					</div>
					<button type="submit" style="position:absolute; top:0; left:0; width:100%; height:100%; opacity:0; cursor:pointer; border:none; background:none;"></button>
			    </div>
			    </form>
		    </c:forEach>
		    </div>
	    </div>
    </div>
 	<c:import url="../common/footer/footer.html" charEncoding="UTF-8"/>
</body>
</html>