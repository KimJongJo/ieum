const yearSelect = document.getElementById("joinYear");
const monthSelect = document.getElementById("month");
const daySelect = document.getElementById("day");

const currentYear = new Date().getFullYear();

// 연도 채우기 (현재 연도부터 1900년까지 내림차순)
for (let y = currentYear; y >= 1900; y--) {
    const option = document.createElement("option");
    option.value = y;
    option.textContent = y + "년";
    yearSelect.appendChild(option);
}

// 월 채우기
for (let m = 1; m <= 12; m++) {
    const option = document.createElement("option");
    option.value = m;
    option.textContent = m + "월";
    monthSelect.appendChild(option);
}

// 일 채우는 함수
function updateDays() {
    const year = parseInt(yearSelect.value);
    const month = parseInt(monthSelect.value);

    if (!year || !month) return;

    let daysInMonth;
    if (month === 2) {
        daysInMonth = year % 4 === 0 && (year % 100 !== 0 || year % 400 === 0) ? 29 : 28;
    } else if ([4, 6, 9, 11].includes(month)) {
        daysInMonth = 30;
    } else {
        daysInMonth = 31;
    }

    daySelect.innerHTML = '<option value="none">일</option>';
    for (let d = 1; d <= daysInMonth; d++) {
        const option = document.createElement("option");
        option.value = d;
        option.textContent = d;
        daySelect.appendChild(option);
    }
}

yearSelect.addEventListener("change", updateDays);
monthSelect.addEventListener("change", updateDays);

const pw = document.getElementById("pw");
const pw2 = document.getElementById("pw2");
const pwch = document.getElementById("pwch");
const pwch2 = document.getElementById("pwch2");

pwch.addEventListener("click", () => {
    if (pw.type === "password") {
        pw.type = "text";
        pwch.textContent = "숨기기";
    } else {
        pw.type = "password";
        pwch.textContent = "보기";
    }
});

pwch2.addEventListener("click", () => {
    if (pw2.type === "password") {
        pw2.type = "text";
        pwch2.textContent = "숨기기";
    } else {
        pw2.type = "password";
        pwch2.textContent = "보기";
    }
});
            
            
 // 성명
$(function() {
    $("#userName").on("change", function() {  // 입력 감지
        var value = $(this).val();
        var pattern = /^[가-힣]{2,5}$/; // 한글 2~5자

		if(value === "") {
			 $("#username-span").css("display", "none");
			 userInfo.userName = false;
        } else if(pattern.test(value)) {
			$("#username-span").css("display", "block");
            $("#username-i").removeClass("fa-xmark span-x").addClass("fa-check span-check");
            userInfo.userName = true;
        } else {
			$("#username-span").css("display", "block");
            $("#username-i").removeClass("fa-check span-check").addClass("fa-xmark span-x");
            userInfo.userName = false;
        }
    });
});

// 생년월일

$(function() {
    $("#year, #month, #day").change(function() {
        var year = $("#year").val();
        var month = $("#month").val();
        var day = $("#day").val();


        if (year !== "none" && month !== "none" && day !== "none") {
            $("#birth-span").css("display", "block");
            $("#birth-i").removeClass("fa-xmark span-x").addClass("fa-check span-check");
            userInfo.birthDate = true;
        } else {
            $("#birth-span").css("display", "none");
            userInfo.birthDate = false;
        }
    });
});

// 비밀번호
$(function() {
    $("#pw").on("change", function() {  // 입력 감지
        var value = $(this).val();
        var pw2 = $("#pw2").val(); // 원래 비밀번호 값
        // 길이 8~16자, 허용 문자: 숫자, 영문 대소문자, ! @ # $ % ^ & *
        var pattern = /^[a-zA-Z0-9!@#$%^&*]{8,16}$/;

		// 비밀번호와 비밀번호 확인을 한 다음 다시 비밀번호를 수정할때
		if(pw2 !== "") { // 비밀번호 확인란이 입력된 경우만 비교
		    if(value !== pw2) {
		        userInfo.userPw = false;
		        $("#pw2-i").removeClass("fa-check span-check").addClass("fa-xmark span-x");
		    } else {
		        $("#pw2-i").removeClass("fa-xmark span-x").addClass("fa-check span-check");
		    }
		}

        if(value === "") {
            $("#pw-span").css("display", "none");
            userInfo.userPw = false;
        } else if(pattern.test(value)) {
            $("#pw-span").css("display", "block");
            $("#pw-i").removeClass("fa-xmark span-x").addClass("fa-check span-check");
            userInfo.userPw = true;
        } else {
            $("#pw-span").css("display", "block");
            $("#pw-i").removeClass("fa-check span-check").addClass("fa-xmark span-x");
            userInfo.userPw = false;
        }
    });
});



// 비밀번호 확인
$(function() {
    $("#pw2").on("change", function() {  // 입력 감지
        var value = $(this).val();
     	var pw = $("#pw").val(); // 원래 비밀번호 값
        // 길이 8~16자, 허용 문자: 숫자, 영문 대소문자, ! @ # $ % ^ & *
        var pattern = /^[a-zA-Z0-9!@#$%^&*]{8,16}$/;

        if(value === "") {
            $("#pw2-span").css("display", "none");
        } else if(pattern.test(value) && pw === value) {
            $("#pw2-span").css("display", "block");
            $("#pw2-i").removeClass("fa-xmark span-x").addClass("fa-check span-check");
        } else {
            $("#pw2-span").css("display", "block");
            $("#pw2-i").removeClass("fa-check span-check").addClass("fa-xmark span-x");
        }
    });
});

// 전화번호
$(function() {
    function checkTel() {
		
        var tel1 = $("#inputTel1").val().trim();
        var tel2 = $("#inputTel2").val().trim();
        var pattern = /^\d{4}$/;

        if(tel1 === "" || tel2 === "") {
            $("#tel-span").css("display", "none");
            $("#tel-i").removeClass("fa-check span-check fa-xmark span-x"); // 상태 초기화
            userInfo.userTel = false;
        } else if(pattern.test(tel1) && pattern.test(tel2)) {
            $("#tel-span").css("display", "block");
            $("#tel-i").removeClass("fa-xmark span-x").addClass("fa-check span-check");
            userInfo.userTel = true;
        } else {
            $("#tel-span").css("display", "block");
            $("#tel-i").removeClass("fa-check span-check").addClass("fa-xmark span-x");
            userInfo.userTel = false;
        }
    }

    $("#inputTel1, #inputTel2").on("change", checkTel);
});
            
var idCheck = false;

// 아이디 입력 감지
$(function() {
    $("#userId").on("input", function() {
        var value = $(this).val().trim(); // 공백 제거
        var pattern = /^[a-z0-9]{4,16}$/;
        
        $("#userId-span").css("display", "none");

        if(value === "") {
            idCheck = false;
            userInfo.userId = false;
            return; // 빈 값이면 여기서 종료
        }

        // 패턴 검사
        if(pattern.test(value)) {
            idCheck = true;
        } else {
            idCheck = false;
            userInfo.userId = false;
        }
    });
});

// 아이디 중복 체크 버튼
$("#check-id-btn").click(function(e){
    if(!idCheck) {
        alert("아이디 조건을 확인해주세요");
        return; // 조건 미달이면 AJAX 호출 안 함
    }

    $.ajax({
        url: "/ieum/auth/checkId",
        type:"POST",
        data: { userId: $("#userId").val() },
        dataType: "json",
        success: function(response){
            $("#userId-span").css("display", "block");

            if(response.success){
                alert("사용 가능한 아이디 입니다.");
                $("#userId-i").removeClass("fa-xmark span-x").addClass("fa-check span-check");
                userInfo.userId = true;
            } else {
                alert("이미 존재하는 아이디 입니다.");
                $("#userId-i").removeClass("fa-check span-check").addClass("fa-xmark span-x");
                userInfo.userId = false;
            }
        },
        error: function(error){
            console.log(error);
        }
    });
});            
            