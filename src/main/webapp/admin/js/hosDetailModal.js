$(document).ready(function(){
    const hosDetailModal = $('.modal-hospital-detail');

    // 전역 변수로 현재 페이지와 전체 페이지 관리
    

    // info-btn 클릭 이벤트 위임 (동적 생성 대응)
    $(document).on("click", ".info-btn", function() {
        const hNo = $(this).val();

        $.ajax({
            url: "/ieum/requestInfo",
            type: "POST",
            data: { hNo: hNo },
            dataType: 'json',
            success: function(res) {
                if(res.success) {
                    const object = res.object;

                    $("#hosName").text(object.hNm);
                    $("#requestName").text(object.applicantName);
                    $("#reqeustTel").text(object.applicantTel); // 오타 확인: requestTel
                    $("#requestEmail").text(object.applicantEmail);
                    $("#hosAddress").text(object.hAddress);
                    $("#reNo").text(object.hosReNo);

                    $("#pdf-frame").attr("src", contextPath + "/" + object.hosReFilePath);
                    $("#addHos").val(object.hNo);
                    $("#delHos").val(object.hNo);
                } else {
                    console.log("에러 : 존재하지 않는 번호");
                }
            },
            error: function(err) {
                console.log(err);
            }
        });

        hosDetailModal.css("display", "flex");
    });

    // 모달 닫기
    $(".fa-xmark").click(function() {
        hosDetailModal.css("display", "none");
    });

    


	// 검색 버튼 클릭
	$("#searchBtn").click(function() {
	    curKeyword = $("#searchKeyword").val().trim(); // 검색어 저장
	    loadPage(1, curKeyword, filter); // 검색은 항상 1페이지부터
	});
	
	// 페이지 이동 버튼 클릭 (동적 생성)
	$(document).on("click", ".move-page", function() {
	    loadPage(Number($(this).val()), curKeyword, filter); // 현재 검색어 유지
	});
	
	// 이전/다음 버튼 클릭
	$(document).on("click", ".prev-page", function() {
	    if(curPage > 1) loadPage(curPage - 1, curKeyword, filter);
	});
	$(document).on("click", ".next-page", function() {
	    if(curPage < allPage) loadPage(curPage + 1, curKeyword, filter);
	});
	
	$("#selectFilter").on("change", function(){
		curKeyword = $("#searchKeyword").val().trim(); // 검색어 저장
		filter = $("#selectFilter").val();
		loadPage(1, curKeyword, filter); // 정렬 필터 사용
	})
	
	// loadPage 함수
	function loadPage(pageNum, keyword, filter) {
	    $.ajax({
	        url: "/ieum/requestHos/page",
	        type: "POST",
	        data: { page: pageNum, keyword: keyword, filter:filter },
	        dataType: "json",
	        success: function(res) {
	            curPage = res.object.curPage;
	            allPage = res.object.allPage;
	
	            // 테이블 갱신
	            if(res.object.list.length == 0){
					$("#tableSetting tbody").html(
						`<tr>
							<td colspan="6">검색 결과에 맞는 병원 정보가 없음</td>
						</tr>`
					);
				}else{
					let rows = "";
		            res.object.list.forEach(item => {
		                rows += `
		                    <tr>
		                        <td>${item.hNo}</td>
		                        <td>${item.hNm}</td>
		                        <td>${item.hAddress}</td>
		                        <td>${item.hTel}</td>
		                        <td>${item.hCreated}</td>
		                        <td><button value="${item.hNo}" class="info-btn">정보</button></td>
		                    </tr>
		                `;
		            });
		            $("#tableSetting tbody").html(rows);
		
		            // 페이지네이션 갱신
		            let pageHtml = `<button class="page prev-page" type="button"${curPage === 1 ? ' disabled' : ''}><i class="fa-solid fa-angle-left"></i></button>`;
		            for (let i = res.object.startPage; i <= res.object.endPage; i++) {
		                if (i === curPage) {
		                    pageHtml += `<button value="${i}" class="cur-page" type="button">${i}</button>`;
		                } else {
		                    pageHtml += `<button value="${i}" class="page move-page" type="button">${i}</button>`;
		                }
		            }
		            pageHtml += `<button class="page next-page" type="button"${curPage === allPage ? ' disabled' : ''}><i class="fa-solid fa-angle-right"></i></button>`;
		            $(".page-div").html(pageHtml);
				}
	            
	        },
	        error: function(err) {
	            console.log(err);
	        }
	    });
	}


    // 승인 버튼
    $("#addHos").click(function() {
		var approve = false;
        $.ajax({
            url:"/ieum/admin/approve",
            type:"POST",
            data:{hNo:$("#addHos").val()},
            dataType:"json",
            success:function(res){
                if(res.success){
                    alert("병원이 등록되었습니다.");
                    loadPage(curPage,$("#searchKeyword").val() ,$("#selectFilter").val()); // 전체 reload 대신 현재 페이지 갱신
                    hosDetailModal.css("display", "none");
                    
                    $.ajax({
						url:"/ieum/admin/sendHosAuthCode",
						type:"POST",
						data:{hNo:$("#addHos").val(),
							email:$("#requestEmail").text()},
						dataType:"json",
						success:function(res){
							if(res.success){
								console.log("이메일 전송 완료");
							}else{
								console.log("이메일 전송 실패");
							}
						},
						error:function(err){
							console.log(err);
						}
					})
                }else{
                    console.log(res.success);
                }
            },
            error:function(err){
                console.log(err);
            }
        });

    });
    
        // 거부 버튼
    $("#delHos").click(function() {
        $.ajax({
            url:"/ieum/admin/reject",
            type:"POST",
            data:{hNo:$("#delHos").val()},
            dataType:"json",
            success:function(res){
                if(res.success){
                    alert("병원등록이 거부되었습니다.");
                    loadPage(curPage, $("#searchKeyword").val() ,$("#selectFilter").val()); // 전체 reload 대신 현재 페이지 갱신
                    hosDetailModal.css("display", "none");
                }else{
                    console.log(res.success);
                }
            },
            error:function(err){
                console.log(err);
            }
        });
    });

});
