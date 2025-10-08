$(document).ready(function() {
    const $modalProfile = $("#modal-div");

    // 모달 열기
    function openModal() {
        $modalProfile.css("display", "flex");
        $("body").css("overflow", "hidden");
    }

    // 모달 닫기
    function closeModal() {
        $modalProfile.hide();
        $("body").css("overflow-y", "");
    }

    // 동적 위임으로 버튼 클릭 시 모달 열기
    $(document).on("click", ".btn2", function() {
		
		$.ajax({
			url:"/ieum/myPage/diagnosisHistory",
			type:"POST",
			data:{diaNo:$(this).val()},
			dataType:"json",
			success:function(res){
				if(res.success){
					var object = res.object;
					// 환자 정보
					$("#uNm").text(object.uNm);
					$("#gender").text(object.gender);
					$("#birthDate").text(object.birthDate);
					// 진단/진료상세
					$("#diaName").text(object.diagnosisName);
					$("#sym").text(object.sympotoms);
					$("#summary").text(object.testSummary);
					$("#treatment").text(object.treatment);
					$("#pre").text(object.prescription);
					// 의사정보
					$("#docImg").attr("src", "/ieum/" + object.docFilePath + "/" + object.docFileName);
					$("#mNm").text(object.mNm);
					$("#rDate").text(object.rDate);
					$("#major").text(object.major);
					$("#hNm").text(object.hNm);
					// 의사의말
					$("#docComment").text(object.doctorComment);
					
					
				}else{
					console.log(res.message);
				}
			},
			error:function(err){
				console.log(err);
			}
		})
		
		
        openModal();
    });

    // 모달 배경 클릭 시 닫기
    $modalProfile.on("click", function(e) {
        if ($(e.target).is("#modal-div")) {
            closeModal();
        }
    });

    // 닫기 아이콘 클릭 시 닫기
    $modalProfile.on("click", ".fa-xmark", function() {
        closeModal();
    });

    // 확인 버튼 클릭 시 닫기
    $(document).on("click", "#check", function() {
        closeModal();
    });
    
    const $yearSelect = $("#year2");
    const $monthSelect = $("#month");
    const $daySelect = $("#day");

    const today = new Date();
    const currentYear = today.getFullYear();
    const currentMonth = today.getMonth() + 1;
    const currentDay = today.getDate();

    // 연도 채우기 (현재년도 ~ 2020)
    for(let y = currentYear; y >= 2020; y--){
        $yearSelect.append(`<option value="${y}">${y}년</option>`);
    }

    // 월 업데이트
    function updateMonths(){
        const selectedYear = parseInt($yearSelect.val());
        $monthSelect.html('<option value="none">월</option>');
        if(!selectedYear) return;

        const maxMonth = (selectedYear === currentYear) ? currentMonth : 12;
        for(let m = 1; m <= maxMonth; m++){
            $monthSelect.append(`<option value="${m}">${m}월</option>`);
        }
    }

    // 일 업데이트 (윤년 포함)
    function updateDays(){
        const y = parseInt($yearSelect.val());
        const m = parseInt($monthSelect.val());
        if(!y || !m) return;

        let daysInMonth;
        if(m === 2){
            // 윤년 계산
            daysInMonth = (y % 4 === 0 && (y % 100 !== 0 || y % 400 === 0)) ? 29 : 28;
        } else if([4,6,9,11].includes(m)){
            daysInMonth = 30;
        } else {
            daysInMonth = 31;
        }

        // 올해의 현재 달이면 오늘까지
        if(y === currentYear && m === currentMonth){
            daysInMonth = currentDay;
        }

        $daySelect.html('<option value="none">일</option>');
        for(let d = 1; d <= daysInMonth; d++){
            $daySelect.append(`<option value="${d}">${d}</option>`);
        }
    }

    // 이벤트 바인딩
    $yearSelect.on("change", function(){
        year = $(this).val();
        updateMonths();
        updateDays();
        date = "";
    });

    $monthSelect.on("change", function(){
        const val = $(this).val();
        month = (val !== "none") ? val.toString().padStart(2,'0') : "";
        updateDays();
        date = "";
    });

    $daySelect.on("change", function(){
        const val = $(this).val();
        day = (val !== "none") ? val.toString().padStart(2,'0') : "";
        date = year + "-" + month + "-" + day;
    });

    // 초기화
    updateMonths();
    updateDays();
    
    
    
    $("#searchDiaDate").click(function(){
		if(date === ""){
			alert("날짜를 선택해주세요");
			return;
		}
		
		offset = 0;
		
		//날짜를 가져와서 해당날짜에 있는 진단서 보여주기
		 $.ajax({
	        url: "/ieum/myPage/diaHistoryDate",
	        type: "POST",
	        data: { date: date, offset: offset, limit: limit },
	        dataType: "json",
	        success: function(res) {
	            const list = res.object.diaList;
	
	            if(res.success) {
	                if(list.length === 0) {
	                    $disListDiv.html(`<div class="noSearchDia">진단 이력이 존재하지 않습니다.</div>`);
	                    $("#loadMoreBtn").hide();
	                } else {
	                    let rows = "";
	                    list.forEach(item => {
	                        rows += `
	                        <div class="diagnosis-box">
	                            <div class="box1">
	                                <div class="box-item">진단 일시</div>
	                                <div class="box-item">진단 명</div>
	                                <div class="box-item">결과요약</div>
	                                <div class="box-item">상세보기</div>
	                            </div>
	                            <div class="box2">
	                                <div class="box-item">${item.rDate}</div>
	                                <div class="box-item">${item.diagnosisName}</div>
	                                <div class="box-item">${item.testSummary}</div>
	                                <div class="box-item">
	                                    <button class="btn2" value="${item.diaNo}">진단 결과 보기</button>
	                                </div>
	                            </div>
	                            <div class="doc-comment">${item.doctorComment}</div>
	                            <div class="upload">
	                                <div>${item.hNm}</div>
	                                <div>업로드 날짜</div>
	                            </div>
	                        </div>`;
	                    });
	                    $disListDiv.html(rows);
	
	                    // offset 증가
	                    offset += list.length;
	
	                    // 더보기 버튼 표시 여부
	                    if(res.object.hasMore) {
	                        $("#loadMoreBtn").show();
	                    } else {
	                        $("#loadMoreBtn").hide();
	                    }
	                }
	            } else {
	                console.log("조회 실패");
	            }
	        },
	        error: function(err) {
	            console.log(err);
	        }
	    });
		
	})
	
	let offset = 3;
	const limit = 3;
	const $disListDiv = $("#disListDiv");
	// 더보기 버튼 클릭 이벤트
    $(document).on("click", "#loadMoreBtn", function() {
        $.ajax({
            url: "/ieum/myPage/loadMoreDia", // 새 서블릿 URL
            type: "GET",
            data: { date:date, offset: offset, limit: limit },
            dataType: "json",
            success: function(res) {
				console.log(res.object.diaList);
                if (res.object.diaList && res.object.diaList.length > 0) {
                    // 기존 div에 새 데이터 추가
                    res.object.diaList.forEach(function(dia) {
                        let html = `
                        <div class="diagnosis-box">
                            <div class="box1">
                                <div class="box-item">진단 일시</div>
                                <div class="box-item">진단 명</div>
                                <div class="box-item">결과요약</div>
                                <div class="box-item">상세보기</div>
                            </div>
                            <div class="box2">
                                <div class="box-item">${dia.rDate}</div>
                                <div class="box-item">${dia.diagnosisName}</div>
                                <div class="box-item">${dia.testSummary}</div>
                                <div class="box-item">
                                    <button class="btn2" value="${dia.diaNo}">진단 결과 보기</button>
                                </div>
                            </div>
                            <div class="doc-comment">${dia.doctorComment}</div>
                            <div class="upload">
                                <div>${dia.hNm}</div>
                                <div>업로드 날짜</div>
                            </div>
                        </div>`;
                        $disListDiv.append(html);
                    });

                    // offset 증가
                    offset += res.object.diaList.length;

                    // 더 이상 데이터 없으면 버튼 숨김
                    if (!res.object.hasMore) {
                        $("#loadMoreBtn").hide();
                    }
                } else {
                    // 데이터 없으면 버튼 숨김
                    $("#loadMoreBtn").hide();
                }
            },
            error: function(err) {
                console.log(err);
            }
        });
    });
	
	

});
