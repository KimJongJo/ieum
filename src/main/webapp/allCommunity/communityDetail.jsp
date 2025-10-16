<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>건강이음</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/modal.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/allCommunity/css/communityDetail.css" />
<script src="https://kit.fontawesome.com/8d48045bdd.js"></script>
	<c:if test="${userType == 'ADMIN'}">
		<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/admin/css/admin.css">
	</c:if>
<%-- <script src="${pageContext.request.contextPath}/allCommunity/js/communityDetail.js"></script> --%>
<script type="text/javascript">
const contextPath = '${contextPath}'; // JS에서 사용할 contextPath
$(function () {
    /* 댓글 메뉴 토글 */
    $(document).on('click', '.comment-box .menu-button', function (e) {
        e.stopPropagation();
        $('.userMenu').hide();
        $(this).closest('.comment-box').find('.userMenu').css('display', 'flex');
    });
    $(document).on('click', function (e) {
        if ($(e.target).closest('.userMenu, .menu-button').length === 0) {
            $('.userMenu').hide();
        }
    });
    

    /* // 게시글 하트 색 변경
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

  //댓글 하트 색 변경
	$('.comment-action-item').click(function(e){
	    e.preventDefault(); // 버튼 기본 submit 막기
	    let form = $(this).closest('form');
	    let commeNo = form.find('input[name="commeNo"]').val();
	    let countSpan = form.find('.comment-action-count');
	    let heartSpan = form.find('.heart1');
	
	    $.post(form.attr('action'), {commeNo: commeNo}, function(data){
	        countSpan.text(data.newCount);
	        if (data.liked) {
	            heartSpan.html('<img class="heart1-img" src="' + '${pageContext.request.contextPath}/img/빨간하트.png' + '" width="15" height="15"/>');
	        } else {
	            heartSpan.html('<img class="heart1-img" src="' + '${pageContext.request.contextPath}/img/횐색하트.png' + '" width="15" height="15"/>');
	        }
	    }, "json");
	}); */
	
	 // 게시글 공감
    $('.actions form').submit(function(e){
        e.preventDefault();
        let form = $(this);
        let commuNo = form.find('input[name="commuNo"]').val();
        let countSpan = form.find('.action-count');
        let heartSpan = form.find('.heart');

        $.post(form.attr('action'), {commuNo: commuNo}, function(data){
            if(data.error){
                alert(data.error); // ✅ 로그인 안내 alert
                return;
            }
            countSpan.text(data.newCount);
            if (data.liked) {
                heartSpan.html('<img src="' + contextPath + '/img/빨간하트.png" width="15" height="15"/>');
            } else {
                heartSpan.html('<img src="' + contextPath + '/img/횐색하트.png" width="15" height="15"/>');
            }
        }, "json");
    });

	// 댓글 공감
	$('.comment-action-item').click(function(e){
	    e.preventDefault();
	    let form = $(this).closest('form');
	    let commeNo = form.find('input[name="commeNo"]').val();
	    let countSpan = form.find('.comment-action-count');
	    let heartSpan = form.find('.heart1');

	    $.post(form.attr('action'), {commeNo: commeNo}, function(data){
	        if(data.error){
	            alert(data.error); // ✅ 비로그인 안내
	            return;
	        }
	        countSpan.text(data.newCount);
	        if (data.liked) {
	            heartSpan.html('<img class="heart1-img" src="' + contextPath + '/img/빨간하트.png" width="15" height="15"/>');
	        } else {
	            heartSpan.html('<img class="heart1-img" src="' + contextPath + '/img/횐색하트.png" width="15" height="15"/>');
	        }
	    }, "json");
	});
	

    /* 삭제 버튼 클릭 → 모달 표시 */
    $(document).on('click', '#btn-delete', function(e) {
        e.preventDefault();
        const commuNo = $(this).data('communo');  // 클릭한 게시글 번호 저장
        $('#completeModal').data('communo', commuNo).show();
    });
    
 // 모달 삭제 버튼 클릭 시
    $('#modalOkComplete').click(function() {
        const commuNo = $('#completeModal').data('communo'); // 모달에 저장된 게시글 번호
        $.post("${pageContext.request.contextPath}/delComDetail", { commuNo: commuNo })
         .done(function() {
             // 삭제 후 페이지 이동
             window.location.href = "${pageContext.request.contextPath}/myCom";
         })
         .fail(function() {
             alert("다른 사용자의 게시물은 삭제 할 수 없습니다.");
         });
    });


    /* 모달 닫기 */
   $('#modalCloseComplete, #modalCancelComplete, #modalCloseBlockCom').click(function() {
    $('#completeModal').hide();
});
    
    
// 신고하기 메뉴 클릭 시
   $(document).on('click', '.userMenu .menu-item1:contains("신고하기")', function (e) {
       e.preventDefault();
       var commentBox = $(this).closest('.comment-box');
       var commeNo = commentBox.attr('data-comme-no'); // 댓글 번호 가져오기
       
       // hidden input에 값 설정
       $('#reportCommeNo').val(commeNo);

       $('#blockReportModal').show();
   });
   
// 신고하기 모달 AJAX 처리
   $('#reportForm').submit(function(e){
       e.preventDefault(); // 기본 submit 막기
       var form = $(this);
       var commeNo = $('#reportCommeNo').val();

       $.post(form.attr('action'), { commeNo: commeNo }, function(data){
           alert(data.message); // 서버에서 받은 메시지 출력
           if(data.success){
               $('#blockReportModal').hide();  // 성공하면 모달 닫기

               // ✅ 신고 메뉴 비활성화
               $('.comment-box[data-comme-no="' + commeNo + '"] .menu-item1')
                   .addClass('disabled')  // CSS로 회색 처리 가능
                   .off('click');          // 클릭 이벤트 제거
           }
       }, "json")
       .fail(function(){
           alert("서버 오류 발생");
       });
   });
   
   
   $('#modalClosereportBlock, #modalCancelreportBlock').click(function() {
	    $('#blockReportModal').hide();
	});
	
    
    /* 댓글 차단 모달 */
$(document).on('click', '.userMenu .menu-item2:contains("댓글차단")', function (e) {
    e.preventDefault();
    var commentBox = $(this).closest('.comment-box');
    var commuNo = "${community.commuNo}";
    var commeNo = commentBox.attr('data-comme-no'); 
    var blockedNo = commentBox.find('.comNick span').attr('data-no');

    $('#blockCommuNo').val(commuNo);
    $('#blockCommeNo').val(commeNo);
    $('#blockBlockedNo').val(blockedNo);
    $('#blockModal').show();
});
    
//댓글 차단 모달에서 "차단" 버튼 클릭 시 AJAX 처리
$('#blockCommentForm').submit(function(e){
    e.preventDefault(); // 기본 submit 막기
    var form = $(this);
    var commuNo = $('#blockCommuNo').val();
    var commeNo = $('#blockCommeNo').val();
    var blockedNo = $('#blockBlockedNo').val();

    $.post(form.attr('action'), { commuNo: commuNo, commeNo: commeNo, blockedNo: blockedNo })
     .done(function(data){
         if(data.success){
             // 해당 댓글 DOM 제거
             // $('.comment-box[data-comme-no="'+commeNo+'"]').remove();  // 기존 DOM 제거는 필요 없으면 주석 처리
             
             // 페이지 자동 새로고침
             location.reload();  
         } else {
             alert("자신의 댓글은 차단 할 수 없습니다.");
         }
     })
     .fail(function(){
         alert("서버 오류 발생");
     });
});  
    
    
    /* 모달 닫기 */
    $('#modalCloseBlock, #modalCancelBlock').click(function() {
        $('#blockModal').hide();
    });
    
    /* 관리 메뉴 숨기기 */
    $('.hide-if-user').hide();

});
</script>
</head>
<body>
	<c:import url="/common/header/header.jsp" charEncoding="UTF-8"/>

    <div class="community">
        <div class="post-header">
            <h2>
            	<c:out value="${category.categoryName}" default="카테고리"/>
            </h2>
        </div>
        <div class="Title">
            <div id="title">
            	<c:out value="${community.commuTitle}"/>
            </div>
            <div id="btn1">
            <c:if test="${member.uNo==community.uNo}">
	            <button onclick="location.href='/ieum/comDetailMo?no=${community.commuNo}'" id="btn-update">수정</button>
	            <button type="button" id="btn-delete" data-communo="${community.commuNo}">삭제</button>
	        </c:if>
	        
	        </div>
        </div>
        <div id="san"></div>
		<!-- 본인 작성한곳 -->       
        <div id="nickANDdate">
            <div id="nickName">
            	<c:out value="${member.nickName}" default="익명"/>
            </div>
            <div id="data">
            	<fmt:formatDate value="${community.commuCreated}" pattern="yyyy-MM-dd"/>
            </div>
        </div>
        <div id="content" style="white-space: pre-wrap; word-wrap: break-word; margin: 0;"><c:out value="${fn:trim(community.commuContent)}" escapeXml="false"/></div>
        <div class="actions">
        			<form action="${pageContext.request.contextPath}/comEmpathy" method="post">
					  	<input type="hidden" name="commuNo" value="${community.commuNo}"/>				    
					    <button type="submit" class="action-item">
					        <span class="heart">
							    <c:choose>
							        <c:when test="${community.likedByUser}">
							        	 <img id="Heart" src="${pageContext.request.contextPath}/img/빨간하트.png" alt="좋아요" width="15" height="15"/>
							        </c:when>
							        <c:otherwise>
							        	<img id="Heart" src="${pageContext.request.contextPath}/img/횐색하트.png" alt="좋아요" width="15" height="15"/>
							        </c:otherwise>
							    </c:choose>
							</span>
					         <span class="action-count"><c:out value="${community.empathy}" /></span>
					    </button>
				    </form>
				    <span class="action-item">
				        💬 <span class="action-count"><c:out value="${community.commuComment}" /></span>
				    </span>
				    <span class="action-item">
				        <img id="Heart1" src="${pageContext.request.contextPath}/img/조회수.png" alt="좋아요" width="15" height="15"/> <span class="action-count"><c:out value="${community.commuViews}" /></span>
				    </span>
				</div>
        <div id="san"></div>

		<!-- 댓글 달리는 장소 -->        
        <c:forEach var="comment" items="${comments}" varStatus="status">
        
         <c:if test="${blockedList == null or not blockedList.contains(comment.commeNo)}">
         
	        <div class="comment-box" data-comme-no="${comment.commeNo}">
			    <div class="comment-row">
			        <div class="row1">
			            <div class="number">${status.count}</div><!-- 번호 카운트 되는 구간 -->
			            <div class="comNick">
			            	<span data-no="${comment.uNo}">	
			            		<c:out value="${comment.nickName}"/>
			            	</span>
			            </div>
			            <div id="date">
			            	<fmt:formatDate value="${comment.comCreated}" pattern="yyyy-MM-dd"/>
			            </div>
			            <!-- 점 3개 버튼 -->
			            <div class="menu-button">⋯</div>
			        </div>
			        <div id="comment">
			            <c:out value="${comment.comContent}" escapeXml="false"/>
			        </div>
			        <form action="${pageContext.request.contextPath}/commeEmpathy" method="post">
			        <input type="hidden" name="commeNo" value="${comment.commeNo}"/>
			        	<button type="submit" class="comment-action-item">
					        <span class="heart1">
							    <c:choose>
							        <c:when test="${comment.likedByUserCom}">
							        	 <img id="Heart1" src="${pageContext.request.contextPath}/img/빨간하트.png" alt="좋아요" width="15" height="15"/>
							        </c:when>
							        <c:otherwise>
							        	<img id="Heart1" src="${pageContext.request.contextPath}/img/횐색하트.png" alt="좋아요" width="15" height="15"/>
							        </c:otherwise>
							    </c:choose>
							</span> 				        
					        <span class="comment-action-count">
					        	<c:out value="${comment.comEmpathy}"/>
					        </span>
						</button>
					</form>
			    </div>
			    <!-- ✅ 이 위치가 중요!!  comment-box 안쪽에 userMenu 삽입 -->
			    <div class="userMenu">
			        <div class="menu-item1">신고하기</div>
				    <div class="menu-item2">댓글차단</div>
			    </div>
			</div>	
		</c:if>
		</c:forEach>
		
        <div id="comment-write-box">
        <form id="comDetail" action="${pageContext.request.contextPath}/comDetail" method="post">
        	<input type="hidden" name="commuNo" value="${community.commuNo}" />
             <!-- 로그인한 사용자 닉네임 표시만, 전송하지 않음 -->
              <input type="hidden" name="uNo" value="${member.uNo}" />
        	<div id="comment-name">
			    <c:choose>
			        <c:when test="${not empty loginUser}">
			            <c:out value="${loginUser.nickName}" />
			        </c:when>
			        <c:otherwise>
			            익명
			        </c:otherwise>
			    </c:choose>
			</div>
            <textarea id="comment-write" name="content" maxlength="1000"></textarea>
            <div id="btn2">
                <button id="btn2-registration">등록</button>
            </div>
        </form>   
        </div>
        <div class="btn-container">
	        <button type="button" onclick="location.href='${pageContext.request.contextPath}/allComList'">목록</button>
	    </div>
    </div>
    
    
    	<!-- -------------------------------------------------------------------------------------------------------------------------------------- -->
    
    <!-- ✅ 삭제 모달 추가 (처음에는 숨김) -->
	<div class="modal-main-div" id="completeModal" style="display:none;">
	    <div class="modal-div-over">
	        <div class="modal-header-div">
	            <span class="modal-header-div-span">알림</span>
	            <button type="button" class="x-button" id="modalCloseBlockCom">✖</button>
	        </div>
	        <div class="modal-content-div">
	            <span class="modal-content-div-span">삭제 하시겠습니까?</span>
	        </div>
	        <div class="modal-div-under">
	            <div class="modal-btn-div">
	                <button class="modal-btn-left modal-btn" id="modalCancelComplete">취소</button>
	                <button class="modal-btn-right modal-btn" id="modalOkComplete">삭제</button>
	            </div>
	        </div>
	    </div>
	</div>

	<!-- ✅ 차단 모달 추가 -->
	<div class="modal-main-div" id="blockReportModal" style="display:none;">
	    <div class="modal-div-over">
	        <div class="modal-header-div">
	            <span class="modal-header-div-span">알림</span>
	            <button type="button" class="x-button" id="modalClosereportBlock">✖</button>
	        </div>
	        <div class="modal-content-div">
	            <span class="modal-content-div-span">신고 하시겠습니까?</span>
	        </div>
	        <div class="modal-div-under">
	            <div class="modal-btn-div">
	                <button type="button" class="modal-btn-left modal-btn" id="modalCancelreportBlock">취소</button>
	                <!-- <button type="button" class="modal-btn-right modal-btn" id="modalOkreportBlock">신고</button> -->
	                <!-- ✅ 신고 form 추가 -->
                <form id="reportForm" action="${pageContext.request.contextPath}/declaration" method="post" style="display:inline;">
                    <input type="hidden" name="commeNo" id="reportCommeNo" />
                    <button type="submit" class="modal-btn-right modal-btn" id="modalOkreportBlock">신고</button>
                </form>
	            </div>
	        </div>
	    </div>
	</div>
	
	<!-- ✅ 차단 모달 추가 -->
	<div class="modal-main-div" id="blockModal" style="display:none;">
	    <div class="modal-div-over">
	        <div class="modal-header-div">
	            <span class="modal-header-div-span">알림</span>
	            <button type="button" class="x-button" id="modalCloseBlock">✖</button>
	        </div>
	        <div class="modal-content-div">
	            <span class="modal-content-div-span">댓글을 차단 하시겠습니까?</span>
	        </div>
	        <div class="modal-div-under">
	            <div class="modal-btn-div">
	                <button type="button" class="modal-btn-left modal-btn" id="modalCancelBlock">취소</button>
	                <!-- form으로 POST 전송 -->
                <form id="blockCommentForm" action="${pageContext.request.contextPath}/blackCom" method="post" style="display:inline;">
                    <input type="hidden" name="commuNo" id="blockCommuNo" />
                    <input type="hidden" name="commeNo" id="blockCommeNo" />
                    <input type="hidden" name="blockedNo" id="blockBlockedNo" />
                    <button type="submit" class="modal-btn-right modal-btn" id="modalOkBlock">차단</button>
                </form>
	            </div>
	        </div>
	    </div>
	</div>



	
<c:import url="../common/footer/footer.html" charEncoding="UTF-8"/>
</body>
</html>


