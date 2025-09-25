<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>건강이음</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="../css/header.css"></link>
<link rel="stylesheet" href="../css/header.css"></link>
<link rel="stylesheet" href="css/allCommunityList.css"></link>
<script src="js/allCommunityList.js"></script>
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
	                <button id="write">작성하기</button>
	            </div>
	        </div>
	
	        <!-- ✅ box를 버튼 아래로 -->
		    <div class="boxes">
		        <div class="box">
		            <div class="text-wrapper-1">닉네임</div>
		            <div class="text-wrapper-2">취업/진로</div>
		        </div>
		        <div class="overlap-group">
		            <div class="div">요즘 너무 힘듭니다</div>
		            <p class="p">안녕하세요 20대 초반 남자이구여 현재 같은 어쩌구 저쩌구...</p>
		        </div>
		        <div class="text-wrapper-3">2025-09-22</div>
		        <div class="actions">
				    <span class="action-item">
				        ❤️ <span class="action-count">50</span>
				    </span>
				    <span class="action-item">
				        💬 <span class="action-count">0</span>
				    </span>
				    <span class="action-item">
				        🔗 <span class="action-count">90</span>
				    </span>
				</div>
		    </div>
		    <div class="boxes">
		        <div class="box">
		            <div class="text-wrapper-1">닉네임</div>
		            <div class="text-wrapper-2">학업/고시</div>
		        </div>
		        <div class="overlap-group">
		            <div class="div">요즘 너무 힘듭니다</div>
		            <p class="p">안녕하세요 20대 초반 남자이구여 현재 같은 어쩌구 저쩌구...</p>
		        </div>
		        <div class="text-wrapper-3">2026-09-22</div>
		        <div class="actions">
				    <span class="action-item">
				        ❤️ <span class="action-count">20</span>
				    </span>
				    <span class="action-item">
				        💬 <span class="action-count">0</span>
				    </span>
				    <span class="action-item">
				        🔗 <span class="action-count">15</span>
				    </span>
				</div>
		    </div>
		    <div class="boxes">
		        <div class="box">
		            <div class="text-wrapper-1">닉네임</div>
		            <div class="text-wrapper-2">부부관계</div>
		        </div>
		        <div class="overlap-group">
		            <div class="div">요즘 너무 힘듭니다</div>
		            <p class="p">안녕하세요 20대 초반 남자이구여 현재 같은 어쩌구 저쩌구...</p>
		        </div>
		        <div class="text-wrapper-3">2027-09-22</div>
		        <div class="actions">
				    <span class="action-item">
				        ❤️ <span class="action-count">15</span>
				    </span>
				    <span class="action-item">
				        💬 <span class="action-count">0</span>
				    </span>
				    <span class="action-item">
				        🔗 <span class="action-count">100</span>
				    </span>
				</div>
		    </div>
	    </div>
    </div>
 <c:import url="../common/footer/footer.html" charEncoding="UTF-8"/>
</body>
</html>