// x 버튼
$("#checkModalX").click(function(){
	$("#checkModal").css("display", "none");
})

// 취소 버튼
$("#checkModalCancle").click(function() {
	$("#checkModal").css("display", "none");
})

// 완료 버튼
$("#diaConfirm").click(function() {
	
	$.ajax({
		url:"/ieum/hosManager/diaCompleted",
		type:"POST",
		data:{dNo:$("#diaConfirm").val()},
		dataType:"json",
		success:function(res){
			if(res.success){
				// 진료완료 모달창 끄기
				$("#checkModal").css("display", "none");
				// 완료됐다는 알림 보내주기
				alert("진료가 완료되었습니다.");
				// 화면 새로고침
				loadPage(1, curKeyword, uNo)
			}else{
				console.log(res.message);
			}
		},
		error:function(err){
			console.log(err);
		}
	})
	
})

// 진료 완료 버튼
$(document).on("click", ".complete", function(e) {
	
	// 클릭한 버튼과 같은 tr을 찾고
    let tr = $(this).closest("tr");
    
    if(tr.find(".diaState").val() === "COMPLETED"){
		$("#checkModal").css("display", "flex");
		$("#diaConfirm").val($(this).val());
		
	}else{
		alert("진단서를 작성해주세요");
	}
	
})

// document(또는 공통 부모)에서 이벤트를 위임
$(document).on("click", ".write-btn", function(e) {
    // td 안의 .show-btn 클릭 시 모달이 열리지 않도록 방지
    if ($(e.target).hasClass("show-btn")) return;

    var rNo = $(this).val();
    $.ajax({
		url:"/ieum/hosManager/patientInfo",
		type:"POST",
		data:{rNo:rNo},
		dataType:"json",
		success:function(res){
			if(res.success){
				var object = res.object;
				var gender;
				if(object.gender == 'MALE'){
					gender = '남'
				} else{
					gender = '여'
				}
				
				// 값 채워넣기
				$("#wrpNo").text(object.pNo);
				$("#wrbirthDate").text(object.birthDate);
				$("#wruTel").text(object.uTel);
				$("#wrusername").text(object.username);
				$("#wrgender").text(gender);
				$("#wruAddress").text(object.uAddress);
				$("#wrdNo").text(object.diaNo);
				$("#wrrDate").text(object.rDate);
				$("#wrhNm").text(object.hNm);
				$("#wrmName").text(object.mNm);
				$("#wrmajor").text(object.major);
				$("#wrhAddress").text(object.hAddress);
				
				$("#btn-cancellation").val(object.diaNo);
				$("#btn-complete").val(object.diaNo);
				
				
				// 진단/진료상세 채우기
				$("#wrdiaName").val(object.diaName);
				$("#wrsym").val(object.sym);
				$("#wrsummary").val(object.summary);
				$("#wrtreatment").val(object.treatment);
				$("#wrpre").val(object.pre);
				$("#wrdocComment").val(object.docComment);
				
				
				$(".modal-dia").css("display", "flex");
    			$("body").css("overflow", "hidden");
			}else{
				console.log(res.message);
			}
		},
		error:function(err){
			console.log(err);
		}
	})
    
});

// 임시저장일때
$("#btn-cancellation").click(function(){
	$.ajax({
		url:"/ieum/hosManager/temp-save",
		type:"POST",
		data:{dNo : $("#btn-cancellation").val(),
				diaName:$("#dwriaName").val(),
				sym:$("#wrsym").val(),
				summary:$("#wrsummary").val(),
				treatment:$("#wrtreatment").val(),
				pre:$("#wrpre").val(),
				docComment:$("#wrdocComment").val(),
				type:"temp-save"},
		dataType:"json",
		success:function(res){
			
			if(res.success){
				// 임시저장되었다는 알림
				alert("임시저장 되었습니다.");
				loadPage(1, curKeyword, uNo)
				$(".modal-dia").css("display", "none");
    			$("body").css("overflow", "auto");
			}else{
				console.log(res.message);
			}
		},
		error:function(err){
			console.log(err);
		}
	})
	
})

// 저장 버튼일때
$("#btn-complete").click(function(){
	$.ajax({
		url:"/ieum/hosManager/temp-save",
		type:"POST",
		data:{dNo : $("#btn-cancellation").val(),
				diaName:$("#dwriaName").val(),
				sym:$("#wrsym").val(),
				summary:$("#wrsummary").val(),
				treatment:$("#wrtreatment").val(),
				pre:$("#wrpre").val(),
				docComment:$("#wrdocComment").val(),
				type:"writeCompleted"},
		dataType:"json",
		success:function(res){
			if(res.success){
				// 저장되었다는 알림
				alert("저장 되었습니다.");
				loadPage(1, curKeyword, uNo)
				$(".modal-dia").css("display", "none");
    			$("body").css("overflow", "auto");
			}else{
				console.log(res.message);
			}
		},
		error:function(err){
			console.log(err);
		}
	})
})

$("#searchKeyword").on("input", function(){
	curKeyword = $("#searchKeyword").val().trim(); // 검색어 저장
})

// 검색 버튼 클릭
$("#searchBtn").click(function() {
    curKeyword = $("#searchKeyword").val().trim(); // 검색어 저장
    loadPage(1, curKeyword, uNo); // 검색은 항상 1페이지부터
});

// 페이지 이동 버튼 클릭 (동적 생성)
$(document).on("click", ".move-page", function() {
    loadPage(Number($(this).val()), curKeyword, uNo); // 현재 검색어 유지
});

// 이전/다음 버튼 클릭
$(document).on("click", ".prev-page", function() {
    if(curPage > 1) loadPage(curPage - 1, curKeyword, uNo);
});
$(document).on("click", ".next-page", function() {
    if(curPage < allPage) loadPage(curPage + 1, curKeyword, uNo);
});

// loadPage 함수
function loadPage(pageNum, keyword, uNo) {
    $.ajax({
        url: "/ieum/resList/page",
        type: "POST",
        data: { page: pageNum, keyword: keyword, uNo : uNo },
        dataType: "json",
        success: function(res) {
            let list = res.object.list;
            if(list.length === 0){
                $("#tableSetting tbody").html(
                   `<tr>
						<td colspan="7">검색 결과에 맞는 병원 정보가 없습니다.</td>
					</tr>`
                );
                $(".page-div").html("");
                return;
            }

            let rows = "";
            list.forEach(item => {
                let diaState;
                if(item.diaState === 'BASIC') diaState = '미작성';
                else if(item.diaState === 'WRITING') diaState = '작성중';
                else diaState = '작성완료';

                rows += `
                    <tr>
                        <td>${item.rNo}</td>
                        <td>${item.pNm}</td>
                        <td><button value="${item.rNo}" type="button" class="search-user-btn profileBtn"><i class="fa-solid fa-magnifying-glass"></i></button></td>
                        <td>${item.time}</td>
                        <td><button type="button" class="write-btn" value="${item.rNo}"><i class="fa-regular fa-pen-to-square"></i></button></td>
                        <td class="reservation-table-td">
                            <input class="diaState" type="hidden" value="${item.diaState}" />
                            ${diaState}
                        </td>
                        <td><button value="${item.diaNo}" class="status-btn complete">완료</button></td>
                    </tr>
                `;
            });
            $("#tableSetting tbody").html(rows);
            // 페이지네이션...
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
        },
        error: function(err) { console.log(err); }
    });
}
