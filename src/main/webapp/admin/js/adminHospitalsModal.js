$(document).ready(function(){
    const hosModal = $('.modal-hospital');

    // 전역 변수로 현재 페이지와 전체 페이지 관리
    

    // info-btn 클릭 이벤트 위임 (동적 생성 대응)
    $(document).on("click", ".trHover", function() {
        var value = $(this).data("value");
        

        $.ajax({
            url: "/ieum/requestHos",
            type: "POST",
            data: { hNo: value },
            dataType: 'json',
            success: function(res) {
                if(res.success) {
					
                    const object = res.object;

                    $("#hosName").text(object.hNm);
					$("#hosNo").text(object.hNo);
					
                    $("#hosTel").text(object.hTel);
                    $("#hosCategory").text(object.category);
                    $("#hosAddress").text(object.hAddress);
                    $("#hosReNo").text(object.hosReNo);
                    console.log(object);
                    
                    // 지도를 생성해서 현재 위치를 보여줘야함
                	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				    mapOption = { 
				        center: new kakao.maps.LatLng(object.hLocationY, object.hLocationX), // 지도의 중심좌표
				        level: 3 // 지도의 확대 레벨
				    };
				
					var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
					
					// 마커가 표시될 위치입니다 
					var markerPosition  = new kakao.maps.LatLng(33.450701, 126.570667); 
					
					// 마커를 생성합니다
					var marker = new kakao.maps.Marker({
					    position: markerPosition
					});
					
					// 마커가 지도 위에 표시되도록 설정합니다
					marker.setMap(map);
					
                } else {
                    console.log("에러 : 존재하지 않는 번호");
                }
            },
            error: function(err) {
                console.log(err);
            }
            
            
            
            
        });

        hosModal.css("display", "flex");
    });

    // 모달 닫기
    $(".fa-xmark").click(function() {
        hosModal.css("display", "none");
    });
    
    $("#checkBtn").click(function() {
		hosModal.css("display", "none");
	})

    


	// 검색 버튼 클릭
	$("#searchBtn").click(function() {
	    curKeyword = $("#searchKeyword").val().trim(); // 검색어 저장
	    loadPage(1, curKeyword, filter, state); // 검색은 항상 1페이지부터
	});
	
	// 페이지 이동 버튼 클릭 (동적 생성)
	$(document).on("click", ".move-page", function() {
	    loadPage(Number($(this).val()), curKeyword, filter, state); // 현재 검색어 유지
	});
	
	// 이전/다음 버튼 클릭
	$(document).on("click", ".prev-page", function() {
	    if(curPage > 1) loadPage(curPage - 1, curKeyword, filter, state);
	});
	$(document).on("click", ".next-page", function() {
	    if(curPage < allPage) loadPage(curPage + 1, curKeyword, filter, state);
	});
	
	$("#selectFilter").on("change", function(){
		curKeyword = $("#searchKeyword").val().trim(); // 검색어 저장
		filter = $("#selectFilter").val();
		loadPage(1, curKeyword, filter, state); // 정렬 필터 사용
	})
	
	// 상태 필터
	$(".state").click(function(){
		state = $(this).val();
		loadPage(1, curKeyword, filter, state)
	})
	
	// loadPage 함수
	function loadPage(pageNum, keyword, filter, state) {
	    $.ajax({
	        url: "/ieum/hospitalList/page",
	        type: "POST",
	        data: { page: pageNum, keyword: keyword, filter:filter, status:state },
	        dataType: "json",
	        success: function(res) {
	            curPage = res.object.curPage;
	            allPage = res.object.allPage;
	
	            // 테이블 갱신
	            if(res.object.list.length == 0){
					$("#tableSetting tbody").html(
						`<tr>
							<td colspan="7">검색 결과에 맞는 병원 정보가 없습니다.</td>
						</tr>`
					);
					
					$(".page-div").html("");
				}else{
					let rows = "";
		            res.object.list.forEach(item => {
						
		                rows += `
		                    <tr  class="trHover" data-value="${item.hNo}">
		                        <td>${item.hNo}</td>
								<td>${item.hNm}</td>
								<td>${item.hAddress}</td>
								<td>${item.category}</td>
								<td>${item.hTel}</td>
								<td>${item.hCreated}</td>
								<td>${item.hUpdated}</td>
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
