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
<script src="https://kit.fontawesome.com/8d48045bdd.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/modal.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/allCommunity/css/allCommunityList.css" />
	<c:if test="${userType == 'ADMIN'}">
		<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/admin/css/admin.css">
	</c:if>
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


$(document).ready(function() {
    $('.hide-if-user').hide();
});
</script>

<style>
/* 전체 레이아웃 */
body {
    margin: 0;
    font-family: 'Arial', sans-serif;
    background-color: #ffffff;
}


/* ✅ 메인 영역 - 1280px 중앙 고정 */
.main-container {
    width: 1280px;
    margin: 20px auto 0 auto; 
    display: flex;
    gap: 40px;
    align-items: flex-start; /* 높이 정렬 */
}

/* 사이드바 */
.sidebar {
    width: 195px;
    height: 550px;
    border: 1px solid #ccc;
    border-radius: 8px;
    overflow: hidden;
}
.sidebar-header {
    background-color: #4356B3;
    color: white;
    font-size: 18px;
    font-weight: bold;
    text-align: center;
    height: 114px;
    display: flex;
    flex-direction: column;
    justify-content: center;
    line-height: 1.6;
}
.welcome {
    background-color: #e9ebf5;
    text-align: left;
    padding: 15px 15px;
    border-bottom: 1px solid #ccc;
}
.welcome strong {
    display: block;
    font-size: 14px;
    margin-bottom: 6px;
}
.welcome span {
    font-size: 12px;
    color: #555;
}
.sidebar-body ul {
    list-style: none;
    padding: 0;
    margin: 0;
}
.sidebar-body ul li {
    padding: 0; /* li 자체 여백 제거 */
    border-top: 1px solid #ccc;
}

.sidebar-body ul li button {
    width: 100%; /* li 전체 넓이 차지 */
    height: 48px; /* 기존 li 높이와 동일 */
    line-height: 48px;
    text-align: left;
    font-size: 14px;
    border: none;
    background-color: #fff;
    cursor: pointer;
    padding: 0 16px; /* 기존 li 좌우 여백 유지 */
}

.sidebar-body ul li button:hover {
    background-color: #f7f7f7;
}

/* 클릭 시 살짝 눌리는 효과 */
.sidebar-body ul li button:active {
    transform: translateY(2px);
    filter: brightness(90%);
}

/* 섹션 타이틀 */
#section-title {
    width: 800px;
    font-size: 20px;
    color: #333;
    margin: 20px auto 0 auto;
    font-weight: 700;
    background-color: #fff;
    display: flex;
    justify-content: space-between;
}

    
    /* category-box 왼쪽 끝 정렬 */
    .community-box {
        width: 497px;          /* 2열 배치 */
        border: 1px solid #ccc;
        border-radius: 8px;
        padding: 10px;
        background-color: #f9f9f9;
        box-sizing: border-box;
        display: flex;
        flex-direction: column;
        gap: 5px;
    }
    .category-title {
        font-weight: bold;
        text-align: center;
        border-bottom: 1px solid #ccc;
        padding-bottom: 5px;
        margin-bottom: 10px;
    }
    .community-list {
        width: 1020px;        /* 2열 기준 */
        display: flex;
        flex-wrap: wrap;       /* 여러 줄로 배치 */
        gap: 20px;
        margin: 20px auto;
    }

    .community-box .meta {
        font-size: 12px;
        color: #555;
        display: flex;
        justify-content: space-between;
    }

    .community-box .content {
        font-size: 14px;
        font-weight: bold;
        color: #333;
    }

    .category-list li {
        margin: 5px 0;
        display: flex;
        align-items: center;
    }
    .category-list label {
        margin-left: 5px;
        cursor: pointer;
    }

    .boxes {
	    position: relative;
	    background-color: #ffffff;
	    border-radius: 15px;
	    border: 2px solid #d9d9d9;
	    padding: 15px;
	    box-sizing: border-box;
	    min-height: 150px; /* 높이 통일(선택) */
	    display: flex;
	    flex-direction: column;
	    gap: 10px;
	}
	
	/* ✅ 게시글 2열 그리드 */
	.community-grid {
	    display: grid;
	    grid-template-columns: repeat(2, 1fr); /* 2열 */
	    gap: 20px 30px; /* 행 간격 / 열 간격 */
	    max-width: 1020px;  /* 버튼 영역과 맞춤 */
	    margin-left: 20px;
	}

    .box {
        display: flex;
        align-items: center;/* 좌-우 분리 */
        justify-content: space-between;
        gap: 10px; /* 닉네임과 카테고리 사이 간격 */
    }

        /* 상단: 닉네임 + 카테고리 */
    .community-box {
        display: flex;
        justify-content: space-between; /* 좌우 분리 */
        align-items: center;
    }

    /* 닉네임 */
    .text-wrapper-1 {
        font-family: "Inter-Regular", Helvetica;
        font-size: 12px;
        color: #000;
    }

    /* 카테고리 */
    .text-wrapper-2 {
        font-family: "Inter-Regular", Helvetica;
        font-size: 14px;
        color: #000;
        font-weight: bold;
        margin-left: 0;
    }
    /* 제목 및 본문 */
    .overlap-group {
        display: flex;
        flex-direction: column;
        gap: 5px;
    }

    .title {
        font-family: "Noto Sans-Medium", Helvetica;
        font-weight: 500;
        font-size: 18px;
        color: #000;
    }

    .p {
        font-family: "Inter-Regular", Helvetica;
        font-size: 14px;
        color: #000;
        margin: 0;
        display: -webkit-box;       /* flex-like box */
	    -webkit-line-clamp: 2;      /* 최대 2줄 */
	    -webkit-box-orient: vertical;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: normal;
        max-width: 100ch; /* 약 20글자 */
        width: 450px;
    }


    /* 업로드 날짜 */
        .text-wrapper-3 {
        font-family: "Inter-Regular", Helvetica;
        font-size: 12px;
        color: #000;
        }

    .actions {
	    /* position: absolute;
	    bottom: 10px;
	    right: 15px;
	    display: flex;
	    gap: 10px;
	    font-size: 14px; */
	    display: flex;
    gap: 10px;        /* 아이템 간격 */
    font-size: 14px;
    position: static; /* 기존 absolute 제거 */
	}
	
	/* ✅ 날짜 + 액션 한 줄 배치 */
.bottom-info {
    display: flex;
    justify-content: space-between;  /* 좌(날짜) ↔ 우(액션) */
    align-items: center;             /* 세로 가운데 정렬 */
    margin-top: auto;                /* 위쪽 여백(선택) */
}
	
	.action-item {
	    display: flex;
	    align-items: center;
	    gap: 2px;          /* 아이콘과 숫자 사이 간격 */
	    width: 50px;        /* 3자리 기준 고정 */
	}
	
	.action-item span.action-count {
	    display: inline-block;
	    min-width: 20px;   /* 숫자 자리 고정 */
	    text-align: left;  /* 숫자 왼쪽 정렬 */
	}


    .sort-buttons {
        display: flex;
        justify-content: space-between; /* 좌-우 분리 */
        align-items: center;
        margin: 0 0 15px 20px;
        width: 100%;
        max-width: 1020px; /* 게시글 박스와 맞춤 */
    }

    .right-container {
        flex: 1; /* 카테고리 옆 공간을 전부 차지 */
        display: flex;
        flex-direction: column;
    }

    .left-buttons {
        display: flex;
        gap: 10px;
    }

    .right-button {
        display: flex;
    }

    .sort-buttons button {
        width: 80px;
        height: 30px;
        border-radius: 15px;
        border: 1px solid #ccc;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 14px;
        cursor: pointer;
        margin: 5px;
        background-color: #f9f9f9;
        transition: 0.2s;
    }
    
    /* 마우스 올렸을 때 */
	.sort-buttons button:hover {
	    background-color: #e6e6e6;
	}
	
	/* 클릭 시 눌리는 효과 */
	.sort-buttons button:active {
	    transform: translateY(2px);
	    filter: brightness(90%);
	}

    /* 마우스 올렸을 때 */
    #latest:hover, #empathy:hover, #by-view:hover, #write:hover {
        background-color: #e6e6e6;
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

    <c:import url="/common/header/header.jsp" charEncoding="UTF-8"/>

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
	                <!-- <button id="latest">최신순</button>
	                <button id="empathy">공감순</button>
	                <button id="by-view">조회순</button> -->
	                <a href="${pageContext.request.contextPath}/allComList?sort=latest"><button id="latest">최신순</button></a>
				    <a href="${pageContext.request.contextPath}/allComList?sort=empathy"><button id="empathy">공감순</button></a>
				    <a href="${pageContext.request.contextPath}/allComList?sort=view"><button id="by-view">조회순</button></a>
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
			            <div class="title">
						    <c:choose>
						        <c:when test="${fn:length(allComList.commuTitle) > 20}">
						            <c:out value="${fn:substring(allComList.commuTitle, 0, 20)}..."/>
						        </c:when>
						        <c:otherwise>
						            <c:out value="${allComList.commuTitle}"/>
						        </c:otherwise>
						    </c:choose>
						</div>
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