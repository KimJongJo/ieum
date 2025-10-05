$(document).ready(function(){
    const userModal = $('.modal-profile');
    

    // 전역 변수로 현재 페이지와 전체 페이지 관리
    

    // info-btn 클릭 이벤트 위임 (동적 생성 대응)
    $(document).on("click", ".userInfo", function() {
        var value = $(this).data("value");
        

        $.ajax({
            url: "/ieum/requestManager",
            type: "POST",
            data: { uNo: value },
            dataType: 'json',
            success: function(res) {
                if(res.success) {
					
                    const object = res.object;
                    var role = "";
                    var major = "";
                    if(object.userType == 'DOCTOR'){
						role = "의사";
						major = object.major;
						$(".major-tr").html(
							`
							<th>전공</th>
                            <td class="profile-info">` + major +`</td>
                            <td class="empty"></td>
							`
						)
					}else{
						role = "병원관리자";
					}

                    $("#userName").text(object.username);
                    // 이미지 경로 변경
					$("#userImg").attr("src", contextPath + "/" + object.imgFile);
					$("#userNo").text(object.uNo);
					$("#hosName").text(object.hNm);
                    $("#emailTd").text(object.email);
                    $("#createTd").text(object.createdAt);
                    $("#userType").text(role);
                    
                    
                    if(object.stateCode == 1){
						$("#active2").prop("checked", true);
					}else if(object.stateCode == 2){
						$("#hide2").prop("checked", true);
					}else{
						$("#stop2").prop("checked", true);
					}
                    
                    $("#saveBtn").val(object.uNo);
                } else {
                    console.log("에러 : 존재하지 않는 번호");
                }
            },
            error: function(err) {
                console.log(err);
            }
        });

        userModal.css("display", "flex");
    });

    // 모달 닫기
    $(".fa-xmark").click(function() {
        userModal.css("display", "none");
    });

    


	// 검색 버튼 클릭
	$("#searchBtn").click(function() {
	    curKeyword = $("#searchKeyword").val().trim(); // 검색어 저장
	    loadPage(1, curKeyword, filter, state, role); // 검색은 항상 1페이지부터
	});
	
	// 페이지 이동 버튼 클릭 (동적 생성)
	$(document).on("click", ".move-page", function() {
	    loadPage(Number($(this).val()), curKeyword, filter, state); // 현재 검색어 유지
	});
	
	// 이전/다음 버튼 클릭
	$(document).on("click", ".prev-page", function() {
	    if(curPage > 1) loadPage(curPage - 1, curKeyword, filter, state, role);
	});
	$(document).on("click", ".next-page", function() {
	    if(curPage < allPage) loadPage(curPage + 1, curKeyword, filter, state, role);
	});
	
	$("#selectFilter").on("change", function(){
		curKeyword = $("#searchKeyword").val().trim(); // 검색어 저장
		filter = $("#selectFilter").val();
		loadPage(1, curKeyword, filter, state, role); // 정렬 필터 사용
	})
	
	// 상태 필터
	$(".state").click(function(){
		state = $(this).val();
		loadPage(1, curKeyword, filter, state, role)
	})
	
	// 역할 필터
	$(".role").click(function(){
		role = $(this).val();
		loadPage(1, curKeyword, filter, state, role)
	})
	
	
	
	// loadPage 함수
	function loadPage(pageNum, keyword, filter, state, role) {
		
	    $.ajax({
	        url: "/ieum/managerList/page",
	        type: "POST",
	        data: { page: pageNum, keyword: keyword, filter:filter, state:state, role:role },
	        dataType: "json",
	        success: function(res) {
	            curPage = res.object.curPage;
	            allPage = res.object.allPage;
	
	            // 테이블 갱신
	            if(res.object.list.length == 0){
					$("#tableSetting tbody").html(
						`<tr>
							<td colspan="7">검색 결과에 맞는 병원관리자 정보가 없음</td>
						</tr>`
					);
					
					$(".page-div").html("");
				}else{
					let rows = "";
		            res.object.list.forEach(item => {
						let rows1 = "";
						if(item.stateCode == 1){
							rows1 = `<div class="active">정상</div>`;
						}else if(item.stateCode == 4){
							rows1 = `<div class="leave">휴직</div>`;
						}else{
							rows1 = `<div class="retired">퇴직</div>`;
						}
						
						let row2 = "";
						if(item.userType == "DOCTOR"){
							row2 = `의사`;
						}else{
							row2 = `병원관리자`;
						}
						
						
		                rows += `
		                    <tr class="userInfo" data-value="${item.uNo}">
		                        <td>${item.uNo}</td>
		                        <td>` +
				                        row2 +
		                        `</td>
		                        <td>${item.username}</td>
		                        <td>${item.hNm}</td>
		                        <td>${item.email}</td>
		                        <td>${item.createdAt}</td>
		                        <td>
		                        	<div class="state-div">` +
		                        		rows1 +
		                        	`</div>
		                        </td>
		                    </tr>
		                `;
		            });
		            $("#tableSetting tbody").html(rows);
		            
		            curPage = res.object.curPage;
					allPage = res.object.allPage;
		
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



});
