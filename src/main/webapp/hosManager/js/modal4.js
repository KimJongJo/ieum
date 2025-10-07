// 모달 요소
const modalProfile = document.getElementById("modal-dia3");
const modalProfile2 = document.getElementById("modal-dia2");

// 닫기 버튼
const closeBtn2 = modalProfile2.querySelector(".patientInfoX");
const closeBtn3 = document.getElementById("more-dia2-x");

$(document).on("click", ".show-pInfo-btn", function(e){
    e.stopPropagation();
    $("#modal-dia2").css("display","flex");
    $("body").css("overflow","hidden");
});

$(document).ready(function(){

	// 진단서 보기 클릭 시 modalProfile 열기
	$(document).on("click", ".show-dia-btn", function(e) {
	    e.stopPropagation(); // td 이벤트 전파 막기
	    
	    $.ajax({
			url:"/ieum/hosManager/pastDia",
			type:"POST",
			data:{dNo:$(this).val()},
			dataType:"json",
			success:function(res){
				if(res.success){
					var object = res.object;
					console.log(object);
					// 진단서 채우기
					$("#dia2pNo").text(object.pNo);
					$("#dia2birthDate").text(object.birthDate);
					$("#dia2uTel").text(object.uTel);
					$("#dia2username").text(object.pNm);
					$("#dia2gender").text(object.gender);
					$("#dia2uAddress").text(object.uAddress);
					
					$("#dia2dNo").text(object.diaNo);
					$("#dia2rDate").text(object.rDate);
					$("#dia2hNm").text(object.hNm);
					$("#dia2mName").text(object.mNm);
					$("#dia2major").text(object.major);
					$("#dia2hAddress").text(object.hAddress);
					
					$("#dia2diaName").text(object.diaName);
					$("#dia2sym").text(object.sym);
					$("#dia2summary").text(object.summary);
					$("#dia2treatment").text(object.treatment);
					$("#dia2pre").text(object.pre);
					$("#dia2").text(object.docComment);
					
					
					$("#modal-dia3").css("display", "flex");
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
	$("#searchKeyword").on("input", function(){
	curKeyword = $("#searchKeyword").val().trim(); // 검색어 저장
	})
	
	// 검색 버튼 클릭
	$("#searchBtn").click(function() {
	    curKeyword = $("#searchKeyword").val().trim(); // 검색어 저장
	    
	    loadPage(1, curKeyword, uNo, date); // 검색은 항상 1페이지부터
	});
	
	// 페이지 이동 버튼 클릭 (동적 생성)
	$(document).on("click", ".move-page", function() {
	    loadPage(Number($(this).val()), curKeyword, uNo, date); // 현재 검색어 유지
	});
	
	// 이전/다음 버튼 클릭
	$(document).on("click", ".prev-page", function() {
	    if(curPage > 1) loadPage(curPage - 1, curKeyword, uNo, date);
	});
	$(document).on("click", ".next-page", function() {
	    if(curPage < allPage) loadPage(curPage + 1, curKeyword, uNo, date);
	});
	
	// loadPage 함수
	function loadPage(pageNum, keyword, uNo, date) {
	    $.ajax({
	        url: "/ieum/pastResList/page",
	        type: "POST",
	        data: { page: pageNum, keyword: keyword, uNo : uNo ,date : date},
	        dataType: "json",
	        success: function(res) {
	            let list = res.object.list;
	            
	            if(list.length === 0){
	                $("#tableSetting tbody").html(
	                   `<tr>
							<td colspan="6">검색 결과에 맞는 환자 기록이 없습니다.</td>
						</tr>`
	                );
	                $(".page-div").html("");
	                return;
	            }
	
	            let rows = "";
	            list.forEach(item => {
					
	                rows += `
	                    <tr>
	                        <td class="reservation-table-td">${item.rNo}</td>
                            <td class="reservation-table-td">${item.pNm}</td>
                            <td class="reservation-table-td">${item.mNm}</td>
                            <td class="reservation-table-td">
                                <span>${item.date}</span>
                                /
                                <span>${item.time}</span>
                            </td>
                            <td><button value="${item.diaNo}" type="button" class="show-dia-btn">보기</button></td>
                    		<td><button value="${item.diaNo}" type="button" class="show-pInfo-btn" id="show-patient-info">보기</button></td>
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
	
	
});


const yearSelect = document.getElementById("year");
const monthSelect = document.getElementById("month");
const daySelect = document.getElementById("day");

const today = new Date();
const currentYear = today.getFullYear();
const currentMonth = today.getMonth() + 1;
const currentDay = today.getDate();

// 연도 채우기
for (let y = currentYear; y >= 2020; y--) {
    const option = document.createElement("option");
    option.value = y;
    option.textContent = y + "년";
    yearSelect.appendChild(option);
}

// 월 채우기
function updateMonths() {
    const selectedYear = parseInt(yearSelect.value);
    monthSelect.innerHTML = '<option value="none">월</option>';

    let maxMonth = 12;
    if (selectedYear === currentYear) {
        maxMonth = currentMonth;
    }

    for (let m = 1; m <= maxMonth; m++) {
        const option = document.createElement("option");
        option.value = m;
        option.textContent = m + "월";
        monthSelect.appendChild(option);
    }
}

// 일 채우기
function updateDays() {
    const y = parseInt(yearSelect.value);
    const m = parseInt(monthSelect.value);
    if (!y || !m) return;

    let daysInMonth;
    if (m === 2) {
        daysInMonth = y % 4 === 0 && (y % 100 !== 0 || y % 400 === 0) ? 29 : 28;
    } else if ([4, 6, 9, 11].includes(m)) {
        daysInMonth = 30;
    } else {
        daysInMonth = 31;
    }

    if (y === currentYear && m === currentMonth) {
        daysInMonth = currentDay;
    }

    daySelect.innerHTML = '<option value="none">일</option>';
    for (let d = 1; d <= daysInMonth; d++) {
        const option = document.createElement("option");
        option.value = d;
        option.textContent = d;
        daySelect.appendChild(option);
    }
}

// 선택 시 변수에 값 저장
yearSelect.addEventListener("change", () => {
    year = yearSelect.value;
    updateMonths();
    updateDays();
    date = "";
});

monthSelect.addEventListener("change", () => {
    month = monthSelect.value.padStart(2, '0'); // 한자리면 0 붙이기
    updateDays();
    date = "";
});

daySelect.addEventListener("change", () => {
    day = daySelect.value.padStart(2, '0'); // 한자리면 0 붙이기
    date = year + "-" + month + "-" + day;
});

// 초기화
updateMonths();
updateDays();


closeBtn2.addEventListener("click", () => {
    modalProfile2.style.display = "none";
    document.body.style.overflow = "";
});

closeBtn3.addEventListener("click", () => {
    modalProfile.style.display = "none";
    document.body.style.overflow = "";
});
