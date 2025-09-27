var userInfo = {
	userName : false,
	nickname : false,
	birthDate : false,
	userId : false,
	userPw : false,
	userTel : false,
	userAdd : false
}


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

// 닉네임
$(function() {
    $("#nickName").on("change", function() {  // 입력 감지
        var value = $(this).val();
        var pattern = /^[가-힣a-zA-Z]{2,12}$/; // 한글 + 영어 2~12자
		console.log("eee");

         if(value === "") {
			 $("#nickname-span").css("display", "none");
			 userInfo.nickname = false;
        } else if(pattern.test(value)) {
			$("#nickName-span").css("display", "block");
            $("#nickName-i").removeClass("fa-xmark span-x").addClass("fa-check span-check");
            userInfo.nickname = true;
        } else {
			$("#nickName-span").css("display", "block");
            $("#nickName-i").removeClass("fa-check span-check").addClass("fa-xmark span-x");
            userInfo.nickname = false;
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
        // 길이 8~16자, 허용 문자: 숫자, 영문 대소문자, ! @ # $ % ^ & *
        var pattern = /^[a-zA-Z0-9!@#$%^&*]{8,16}$/;

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




// 주소
$(function() {
    $("#address-detail").on("change", function() {  // 입력 감지
        var value = $(this).val();
     	var address = $("#address-auto").val();
     	
		if(value === "" || address === "") {
            $("#address-span").css("display", "none");
            userInfo.userAdd = false;
        } else {
            $("#address-span").css("display", "block");
            $("#address-i").removeClass("fa-xmark span-x").addClass("fa-check span-check");
            userInfo.userAdd = true;
        }
    });
});

function searchAddr() {
	
    new daum.Postcode({
        oncomplete: function(data) {
        	
        	var addr = ''; // 주소 변수
        	
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
			if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }
            
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById("postcode").value = data.zonecode;
            document.getElementById("address-auto").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("address-detail").focus();
            
            var addauto = document.getElementById("address-auto");
			var adddetail = document.getElementById("address-detail");
			var addSpan = document.getElementById("address-span");
			var addi = document.getElementById("address-i");
			
			// 값이 비어있는지 확인
			if (addauto.value === "" || adddetail.value === "") {
			    addSpan.style.display = "none"; // display none
			    userInfo.userAdd = false;
			} else {
			    addSpan.style.display = "block"; // display block
			    addi.classList.remove("fa-xmark", "span-x"); // 기존 클래스 제거
			    addi.classList.add("fa-check", "span-check"); // 새 클래스 추가
			    userInfo.userAdd = true;
			}
            
        }
    }).open();
}




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


$("#signUp-btn").click(function(e) { // 클릭 시 확인
    var allTrue = true;
	
	console.log($("#address-auto").val());
    // 객체의 모든 값을 확인
    $.each(userInfo, function(key, value) {
        if (!value) {
            allTrue = false;
            return false; // false 반환하면 $.each 종료
        }
    });

    if (!allTrue) {
        e.preventDefault();
        alert("정보입력을 다시 확인해주세요");
        console.log(userInfo);
    }
});


















