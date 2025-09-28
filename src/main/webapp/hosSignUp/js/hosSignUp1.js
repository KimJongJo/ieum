 var requestUserInfo = {
	 requestName : false,
	 requestTel : false,
	 requestEmail : false
 }
 // 성명
$(function() {
    $("#requestName").on("change", function() {  // 입력 감지
        var value = $(this).val();
        var pattern = /^[가-힣]{2,5}$/; // 한글 2~5자

		if(value === "") {
			 $("#requestName-span").css("display", "none");
			 requestUserInfo.requestName = false;
        } else if(pattern.test(value)) {
			$("#requestName-span").css("display", "block");
            $("#requestName-i").removeClass("fa-xmark span-x").addClass("fa-check span-check");
            requestUserInfo.requestName = true;
        } else {
			$("#requestName-span").css("display", "block");
            $("#requestName-i").removeClass("fa-check span-check").addClass("fa-xmark span-x");
            requestUserInfo.requestName = false;
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
            requestUserInfo.requestTel = false;
        } else if(pattern.test(tel1) && pattern.test(tel2)) {
            $("#tel-span").css("display", "block");
            $("#tel-i").removeClass("fa-xmark span-x").addClass("fa-check span-check");
            requestUserInfo.requestTel = true;
        } else {
            $("#tel-span").css("display", "block");
            $("#tel-i").removeClass("fa-check span-check").addClass("fa-xmark span-x");
            requestUserInfo.requestTel = false;
        }
    }

    $("#inputTel1, #inputTel2").on("change", checkTel);
});



// 셀렉트가 변경될때마다
$("#select").on("change", function() {
	if($(this).val() === "direct"){ // 직접입력 이라면 input창 활성화
		$("#directInput").prop("disabled", false);	
	}else{
		$("#directInput").prop("disabled", true); // 아니면 비활성화	
	}
	
})

var emailAuthState = false;
// 전송 버튼을 눌렀을 때
$("#mailSendBtn").click(function () {
	
    var emailId = $("#firstEmail").val().trim();
    var emailAdd;
	
	if(emailId === ""){ // 이메일을 입력 안했을때
		alert("이메일을 입력해주세요");
		emailAuthState = false;
		return;
	}
	
	// 이메일 도메인 선택/직접 입력 처리
    if ($("#directInput").prop("disabled")) { 
        emailAdd = $("#select").val(); // select 사용
    } else { 
        var directVal = $("#directInput").val().trim();
        if(directVal === "") {
            alert("이메일 주소를 입력해주세요");
            emailAuthState = false;
            return;
        }
        emailAdd = directVal; // 직접 입력
    }

    var email = emailId + "@" + emailAdd;

    
    $("#mailSendBtn").prop("disabled", true);
    
    $.ajax({
        url: "/ieum/auth/requestHosEmail",
        type: "POST",
        data: { email ,type:"requestHos"},
        dataType: "json",
        success: function(response) {
                if(response.success) {
                    alert("인증 코드가 이메일로 전송되었습니다.");
                } else {
                    alert(response.message);
                }
                $("#mailSendBtn").prop("disabled", false);
            },
            error: function(err) {
                console.log(err);
                $("#mailSendBtn").prop("disabled", false);
            }
        });
	
	})
	
	

$("#codeCheckBtn").click(function () {
    
    var emailId = $("#firstEmail").val().trim();
    var emailAdd = $("#directInput").prop("disabled") ? $("#select").val() : $("#directInput").val().trim();
    var email = emailId + "@" + emailAdd;

    $.ajax({
        url: "/ieum/auth/checkEmailCode",
        type: "POST",
        data: {email: email,
        	code : $("#authCode").val(),
        	type:"requestHos"},
        dataType: "json",
        success: function(response) {
            if(response.success) {
            	
            	// 이메일 인증 성공했을때 모든 정보를 비활성화
            	$("#firstEmail, #directInput, #requestName, #inputTel1, #inputTel2").prop("readonly", true);
            	$("#code-input").val("다음 절차를 진행해주세요");
            	$("#select, #code-input, #codeCheckBtn, #mailSendBtn").prop("disabled", true);
            	
                alert(response.message);
	            $("#email-span").css("display", "block");
	            $("#email-i").removeClass("fa-xmark span-x").addClass("fa-check span-check");
	            requestUserInfo.requestEmail = true;
            } else {
                alert(response.message);
            }
        },
        error: function(err) {
            console.log(err);
        }
    });

});




$("#nextBtn").click(function(e) { // 클릭 시 확인
    var allTrue = true;
	
    // 객체의 모든 값을 확인
    $.each(requestUserInfo, function(key, value) {
        if (!value) {
            allTrue = false;
            return false; // false 반환하면 $.each 종료
        }
    });

    if (!allTrue) {
        e.preventDefault();
        alert("정보입력을 다시 확인해주세요");
    }
});