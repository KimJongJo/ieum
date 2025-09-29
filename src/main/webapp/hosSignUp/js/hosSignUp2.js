var hosInf = {
	hosImg:false,
	hosName:false,
	hosCategory:false,
	hosAddr:false,
	hosTel:false,
	hosReNo:false,
	hosReFile:false
}

function searchAddr() {
    new daum.Postcode({
        oncomplete: function(data) {
            var addr = '';

            if (data.userSelectedType === 'R') {
                addr = data.roadAddress;
            } else {
                addr = data.jibunAddress;
            }

            document.getElementById("postcode").value = data.zonecode;
            document.getElementById("address-auto").value = addr;
            document.getElementById("address-detail").focus();

            var addauto = document.getElementById("address-auto");
            var adddetail = document.getElementById("address-detail");
            var addSpan = document.getElementById("address-span");
            var addi = document.getElementById("address-i");

            if (addauto.value === "" || adddetail.value === "") {
                addSpan.style.display = "none";
                hosInf.hosAddr = false; // hosInf 선언 필요
            } else {
                addSpan.style.display = "block";
                addi.classList.remove("fa-xmark", "span-x");
                addi.classList.add("fa-check", "span-check");
                hosInf.hosAddr = true; // hosInf 선언 필요
            }

            // 주소 → 좌표 변환
            var geocoder = new kakao.maps.services.Geocoder();
            var address = addauto.value; // 괄호 제거

            geocoder.addressSearch(address, function(result, status) {
                if (status === kakao.maps.services.Status.OK) {
                    var lat = result[0].y;
                    var lng = result[0].x;
                    console.log("위도:", lat, "경도:", lng);
                    
                    document.getElementById("hos_y").value = lat;
                    document.getElementById("hos_x").value = lng;

                    // map 객체가 이미 생성되어 있어야 함
                    if (typeof map !== "undefined") {
                        var marker = new kakao.maps.Marker({
                            map: map,
                            position: new kakao.maps.LatLng(lat, lng)
                        });
                    }
                } else {
                    console.log("좌표 변환 실패");
                }
            });
        }
    }).open();
}

 // 병원명
$(function() {
    $("#hosName").on("change", function() {  // 입력 감지
        var value = $(this).val();
        var pattern = /^[가-힣a-zA-Z0-9\s\-\&]{2,50}$/;

		if(value === "") {
			 $("#hosName-span").css("display", "none");
			 hosInf.hosName = false;
        } else if(pattern.test(value)) {
			$("#hosName-span").css("display", "block");
            $("#hosName-i").removeClass("fa-xmark span-x").addClass("fa-check span-check");
            hosInf.hosName = true;
        } else {
			$("#hosName-span").css("display", "block");
            $("#hosName-i").removeClass("fa-check span-check").addClass("fa-xmark span-x");
            hosInf.hosName = false;
        }
    });
});

// 병원 전화번호
$(function() {
    function checkTel() {
        var tel1 = $("#inputTel1").val().trim();
        var tel2 = $("#inputTel2").val().trim();
        var tel3 = $("#inputTel3").val().trim();

        var pattern1 = /^0\d{1,2}$/;   // 지역번호
        var pattern2 = /^\d{3,4}$/;    // 가운데 번호
        var pattern3 = /^\d{4}$/;      // 마지막 번호

        if(tel1 === "" || tel2 === "" || tel3 === "") {
            $("#tel-span").css("display", "none");
            $("#tel-i").removeClass("fa-check span-check fa-xmark span-x");
            hosInf.hosTel = false;
        } else if(pattern1.test(tel1) && pattern2.test(tel2) && pattern3.test(tel3)) {
            $("#tel-span").css("display", "block");
            $("#tel-i").removeClass("fa-xmark span-x").addClass("fa-check span-check");
            hosInf.hosTel = true;
        } else {
            $("#tel-span").css("display", "block");
            $("#tel-i").removeClass("fa-check span-check").addClass("fa-xmark span-x");
            hosInf.hosTel = false;
        }
    }

    $("#inputTel1, #inputTel2, #inputTel3").on("change", checkTel);
});


// 사업자 등록 번호
$(function() {
    function checkTel() {
		
        var requestNo1 = $("#requestNo1").val().trim();
        var requestNo2 = $("#requestNo2").val().trim();
        var requestNo3 = $("#requestNo3").val().trim();
        var pattern1 = /^\d{3}$/;
        var pattern2 = /^\d{2}$/;
        var pattern3 = /^\d{5}$/;

        if(requestNo1 === "" || requestNo2 === "" || requestNo3 === "") {
            $("#requestNo-span").css("display", "none");
            $("#requestNo-i").removeClass("fa-check span-check fa-xmark span-x"); // 상태 초기화
            hosInf.hosReNo = false;
        } else if(pattern1.test(requestNo1) && pattern2.test(requestNo2) && pattern3.test(requestNo3)) {
            $("#requestNo-span").css("display", "block");
            $("#requestNo-i").removeClass("fa-xmark span-x").addClass("fa-check span-check");
            hosInf.hosReNo = true;
        } else {
            $("#requestNo-span").css("display", "block");
            $("#requestNo-i").removeClass("fa-check span-check").addClass("fa-xmark span-x");
            hosInf.hosReNo = false;
        }
    }

    $("#requestNo1, #requestNo2, #requestNo3").on("change", checkTel);
});



// 병원사진
$(function() {
    const $imgInput = $('#imgInput');
    const $imgSelectBtn = $('#imgSelectBtn');
    const $imgFileName = $('#imgFileName');
    const $preview = $('#preview');
    const $statusSpan = $("#hosImg-span");
    const $statusIcon = $("#hosImg-i");

    // 버튼 클릭 시 파일 선택창 열기
    $imgSelectBtn.on('click', function() {
        $imgInput.click();
    });

    // 파일 선택 시 처리
    $imgInput.on('change', function() {
        const file = this.files[0];

        if (file) {
            // ✅ 허용 확장자 검사
            const allowedExtensions = [".jpg", ".jpeg", ".png", ".gif"];
            const fileName = file.name.toLowerCase();
            const isValid = allowedExtensions.some(ext => fileName.endsWith(ext));

            if (!isValid) {
                alert("이미지 파일만 업로드 가능합니다!");
                // 선택 취소 처리
                $imgInput.val(""); 
                $imgFileName.text("선택된 파일 없음");
                $preview.attr('src', '').hide();
                hosInf.hosImg = false;

                $statusSpan.css("display", "block");
                $statusIcon.removeClass("fa-check span-check").addClass("fa-xmark span-x");
                return; // 여기서 함수 종료
            }

            // ✅ 정상 이미지 처리
            $imgFileName.text(file.name);
            $preview.attr('src', URL.createObjectURL(file)).show();
            hosInf.hosImg = true;

            $statusSpan.css("display", "block");
            $statusIcon.removeClass("fa-xmark span-x").addClass("fa-check span-check");
        } else {
            // 파일 없을 때 처리
            $imgFileName.text("선택된 파일 없음");
            $preview.attr('src', '').hide();
            hosInf.hosImg = false;

            $statusSpan.css("display", "block");
            $statusIcon.removeClass("fa-check span-check").addClass("fa-xmark span-x");
        }
    });
});






// 사업자등록증 
$(function() {
    const $fileInput = $('#fileInput');
    const $customBtn = $('#selectFileBtn');
    const $fileName = $('#fileName');
    const $statusSpan = $("#fileInput-span");
    const $statusIcon = $("#fileInput-i");

    // 버튼 클릭 시 파일 선택창 열기
    $customBtn.on('click', function() {
        $fileInput.click();
    });

    // 파일 선택 시 처리
    $fileInput.on('change', function() {
        const files = this.files;
        const file = files.length > 0 ? files[0] : null;

        // 파일 이름 표시
        $fileName.text(file ? file.name : "선택된 파일 없음");

        // 상태 표시 (체크/엑스 아이콘)
        $statusSpan.css("display", "block");

        if (file) {
            const fileName = file.name.toLowerCase();
            const isPdf = fileName.endsWith(".pdf");

            if (isPdf) {
                $statusIcon.removeClass("fa-xmark span-x").addClass("fa-check span-check");
                hosInf.hosReFile = true;
            } else {
                $statusIcon.removeClass("fa-check span-check").addClass("fa-xmark span-x");
                hosInf.hosReFile = false;
                alert("PDF 파일만 업로드 가능합니다.");
                $fileInput.val(""); // 잘못된 파일 선택 시 input 초기화
                $fileName.text("선택된 파일 없음");
            }
        } else {
            $statusIcon.removeClass("fa-check span-check").addClass("fa-xmark span-x");
            hosInf.hosReFile = false;
        }
    });
});



// 병원 주소
$(function() {
    $("#address-detail").on("change", function() {  // 입력 감지
        var value = $(this).val();
     	var address = $("#address-auto").val();
     	
		if(value === "" || address === "") {
            $("#address-span").css("display", "none");
            hosInf.hosAddr = false;
        } else {
            $("#address-span").css("display", "block");
            $("#address-i").removeClass("fa-xmark span-x").addClass("fa-check span-check");
            hosInf.hosAddr = true;
        }
    });
});


// 병원 카테고리
$(function() {
	$("#hosCate").on("change", function(){
		if($("#hosCate").val() !== "none"){
			$("#hosCate-span").css("display", "block");
            $("#hosCate-i").removeClass("fa-xmark span-x").addClass("fa-check span-check");
            hosInf.hosCategory = true;
		}else{
			$("#hosCate-span").css("display", "block");
            $("#hosCate-i").removeClass("fa-check span-check").addClass("fa-xmark span-x");
            hosInf.hosCategory = false;
		}
	})
})


$("#signUp-btn").click(function(e) {
    var allTrue = true;
    var firstFalseItem = "";

    // 키를 한국어 이름으로 매핑
    const keyMap = {
        hosImg: "병원사진",
        hosName: "병원이름",
        hosCategory: "병원 카테고리",
        hosAddr: "병원 주소",
        hosTel: "전화번호",
        hosReNo: "사업자등록번호",
        hosReFile: "사업자등록증"
    };

    $.each(hosInf, function(key, value) {
        if (!value) {
            allTrue = false;
            firstFalseItem = keyMap[key]; // 첫 번째 false 항목 저장
            return false; // $.each 종료
        }
    });

    if (!allTrue) {
        e.preventDefault();
        alert("정보입력을 다시 확인해주세요\n누락된 항목: " + firstFalseItem);
    }
});


