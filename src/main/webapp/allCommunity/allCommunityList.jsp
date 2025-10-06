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
<script type="text/javascript">
window.addEventListener("pageshow", function(event) {
    if (event.persisted) {
        window.location.reload();
    }
});




$(function () {
	const $grid = $('.community-grid'); // 공통으로 선언

    // 최신순
    $('#latest').on('click', function () {
    const $boxes = $grid.children('.boxes').get();
    $boxes.sort(function (a, b) {
        const dateA = new Date($(a).find('.text-wrapper-3').text().trim());
        const dateB = new Date($(b).find('.text-wrapper-3').text().trim());
        const noA = parseInt($(a).find('input[name="commuNo"]').val(), 10);
        const noB = parseInt($(b).find('input[name="commuNo"]').val(), 10);

        // 날짜가 같으면 글번호로 정렬
        if (dateA.getTime() === dateB.getTime()) {
            return noB - noA;
        }
        return dateB - dateA;
    });
    $.each($boxes, function (_, box) {
        $grid.append(box);
    });
});

    // 공감순
    $('#empathy').on('click', function () {
        const $boxes = $grid.children('.boxes').get();
        $boxes.sort(function (a, b) {
            const countA = parseInt($(a).find('.actions .action-item:nth-child(1) .action-count').text(), 10);
            const countB = parseInt($(b).find('.actions .action-item:nth-child(1) .action-count').text(), 10);
            return countB - countA;
        });
        $.each($boxes, function (_, box) {
            $grid.append(box);
        });
    });

    // 조회순
    $('#by-view').on('click', function () {
        const $boxes = $grid.children('.boxes').get();
        $boxes.sort(function (a, b) {
            const countA = parseInt($(a).find('.actions .action-item:nth-child(3) .action-count').text(), 10);
            const countB = parseInt($(b).find('.actions .action-item:nth-child(3) .action-count').text(), 10);
            return countB - countA;
        });
        $.each($boxes, function (_, box) {
            $grid.append(box);
        });
    });

    // ✅ 카테고리 필터
    $('.category-list input[type="radio"]').on('change', function () {
        const selectedCategory = $(this).next().text().trim();
        $('.right-container .boxes').each(function () {
            const boxCategory = $(this).find('.text-wrapper-2').text().trim();
            if (selectedCategory === "모든 사연" || boxCategory === selectedCategory) {
                $(this).css('display', 'flex');
            } else {
                $(this).css('display', 'none');
            }
        });
    });

    // ✅ '관리 메뉴' 숨기기
    $('.menu span:nth-child(5)').hide();
});




// 게시글 하트 색 변경
$(function() {
    $('.actions form').submit(function(e){
        e.preventDefault(); // 새로고침 막기
        let form = $(this);
        let commuNo = form.find('input[name="commuNo"]').val();
        let countSpan = form.find('.action-count');
        let heartSpan = form.find('.heart'); // ❤️ 담는 곳

        $.post(form.attr('action'), {commuNo: commuNo}, function(data){
            // 공감 수 갱신
            countSpan.text(data.newCount);


            // 하트 이미지 갱신
            if (data.liked) {
                heartSpan.html('<img src="' + contextPath + '/img/빨간하트.png" alt="좋아요" width="15" height="15"/>');
            } else {
                heartSpan.html('<img src="' + contextPath + '/img/횐색하트.png" alt="좋아요" width="15" height="15"/>');
            }
        }, "json"); // JSON으로 받기
    });
});
</script>

<style>
.title {
        font-family: "Noto Sans-Medium", Helvetica;
        font-weight: 500;
        font-size: 18px;
        color: #000;
    }

.heart-button {
    background: none;       /* 버튼 배경 제거 */
    border: none;           /* 테두리 제거 */
    padding: 0;
    margin: 0;
    font-size: 14px;
    cursor: pointer;
    line-height: 1;

    display: inline-flex;   /* ✅ 내부 요소 가로 정렬 */
    align-items: center;    /* 세로 가운데 정렬 */
    gap: 4px;               /* 하트와 숫자 간격 */
}

.heart-button:focus {
    outline: none;          /* 클릭 시 파란 테두리 제거 */
}
.heart {
	    display: flex;           /* flex 컨테이너로 설정 */
	    justify-content: center; /* 가로 중앙 정렬 */
	    align-items: center;     /* 세로 중앙 정렬 */
	    height: 20px;            /* 필요에 따라 높이 조정 */
	}
	.heart1 img {
	    display: block;          /* 이미지 주변 여백 제거 */
	    max-width: 100%;         /* 영역 넘치지 않게 */
	    max-height: 100%;        /* 영역 넘치지 않게 */
	}
	
	#paging img {
    position: relative;
    vertical-align: middle; /* 중앙 정렬 유지 */
}

#arrow {
margin: 0 10px 0 10px;
}
</style>
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
			            <div class="title"><c:out value="${allComList.commuTitle}"/></div>
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
					        	<input type="hidden" name="commuNo" value="${allComList.commuNo}"/>
					            <button type="submit" class="heart-button">
					                <span class="heart1">
									    <c:choose>
									        <c:when test="${allComList.likedByUserCom}">
									        	 <img id="Heart1" src="${pageContext.request.contextPath}/img/빨간하트.png" alt="좋아요" width="15" height="15"/>
									        </c:when>
									        <c:otherwise>
									        	<img id="Heart1" src="${pageContext.request.contextPath}/img/횐색하트.png" alt="좋아요" width="15" height="15"/>
									        </c:otherwise>
									    </c:choose>
									</span>
				               		<span class="action-count"><c:out value="${allComList.empathy}" /></span>
				                </button>
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
			    
		    </c:forEach>
		    
		    
		    </div>
		    <div id="paging" style="text-align:center; margin:40px 0;">
		<c:choose>
			<c:when test="${pageInfo.curPage>1 }">
				<a href="${pageContext.request.contextPath}/allComList?page=${pageInfo.curPage-1}"><img id="arrow" src="${pageContext.request.contextPath}/img/입체왼쪽화살표.png" alt="좋아요" width="20" height="20"/></a>
			</c:when>
			<c:otherwise>
				<a><img id="arrow" src="${pageContext.request.contextPath}/img/입체왼쪽화살표.png" alt="좋아요" width="20" height="20"/></a>
			</c:otherwise>
		</c:choose>
	
		<c:forEach begin="${pageInfo.startPage}" end="${pageInfo.endPage}" step="1" var="page">
			<a href="${pageContext.request.contextPath}/allComList?page=${page}" class="${pageInfo.curPage == page? 'select' : 'btn'}">${page}</a>	
		</c:forEach>
			<c:choose>
			<c:when test="${pageInfo.curPage<pageInfo.allPage }">
				<a href="${pageContext.request.contextPath}/allComList?page=${pageInfo.curPage+1}"><img id="arrow" src="${pageContext.request.contextPath}/img/입체오른쪽화살표.png" alt="좋아요" width="20" height="20"/></a>
			</c:when>
			<c:otherwise>
				<a><img id="arrow" src="${pageContext.request.contextPath}/img/입체오른쪽화살표.png" alt="좋아요" width="20" height="20"/></a>
			</c:otherwise>
		</c:choose>
	</div>
	    </div>
    </div>
    
    
    
    
    
 	<c:import url="../common/footer/footer.html" charEncoding="UTF-8"/>
</body>
</html>