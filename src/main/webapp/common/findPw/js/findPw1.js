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
    	
    	var userId = $("#userId").val().trim();
        var emailId = $("#firstEmail").val().trim();
        var emailAdd;
    	if(userId === ""){ // 아이디를 입력 안했을때
    		alert("아이디를 입력해주세요");
    		emailAuthState = false;
    		return;
    	}
    	
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
        
        // 1️⃣ 아이디+이메일 존재 확인
        alert("인증 코드가 이메일로 전송되었습니다.");
        $.ajax({
            url: "/ieum/auth/checkIdAndEmail",
            type: "POST",
            data: { userId, email ,type:"findPw"},
            dataType: "json",
            success: function(response) {
                    if(response.success) {
                        emailAuthState = true;
                    } else {
                        alert(response.message);
                        emailAuthState = false;
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
        if(!emailAuthState){
            alert("아이디와 이메일을 입력해서 이메일을 전송해주세요");
            return;
        }
        
        var emailId = $("#firstEmail").val().trim();
        var emailAdd = $("#directInput").prop("disabled") ? $("#select").val() : $("#directInput").val().trim();
        var email = emailId + "@" + emailAdd;

        $.ajax({
            url: "/ieum/auth/checkEmailCode",
            type: "POST",
            data: { userId : $("#userId").val(),
            	email: email,
            	code : $("#authCode").val(),
            	type: "findPw"},
            dataType: "json",
            success: function(response) {
                if(response.success) {
                	
                	// 이메일 인증 성공했을때 모든 정보를 비활성화
                	$("#userId, #firstEmail, #directInput").prop("readonly", true);
                	$("#select").prop("disabled", true);
                    alert(response.message);
                    $("#change-pw").show();
                } else {
                    alert(response.message);
                }
            },
            error: function(err) {
                console.log(err);
            }
        });
    });
    
    var pwCheck = {
    		pw : false,
    		pwCh : false
    }
    
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
    		        $("#pw2-i").removeClass("fa-check span-check").addClass("fa-xmark span-x");
    		        pwCheck.pwCh = false;
    		    } else {
    		        $("#pw2-i").removeClass("fa-xmark span-x").addClass("fa-check span-check");
    		        pwCheck.pwCh = true;
    		    }
    		}

            if(value === "") {
                $("#pw-span").css("display", "none");
                pwCheck.pw = false;
            } else if(pattern.test(value)) {
                $("#pw-span").css("display", "block");
                $("#pw-i").removeClass("fa-xmark span-x").addClass("fa-check span-check");
                pwCheck.pw = true;
            } else {
                $("#pw-span").css("display", "block");
                $("#pw-i").removeClass("fa-check span-check").addClass("fa-xmark span-x");
                pwCheck.pw = false;
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
                pwCheck.pwCh = false;
            } else if(pattern.test(value) && pw === value) {
                $("#pw2-span").css("display", "block");
                $("#pw2-i").removeClass("fa-xmark span-x").addClass("fa-check span-check");
                pwCheck.pwCh = true;
            } else {
                $("#pw2-span").css("display", "block");
                $("#pw2-i").removeClass("fa-check span-check").addClass("fa-xmark span-x");
                pwCheck.pwCh = false;
            }
        });
    });
    
    
    
    // 1️⃣ 비밀번호 변경
    $("#changePwBtn").click(function () {
		
        var allTrue = true;
    	
        // 객체의 모든 값을 확인
        $.each(pwCheck, function(key, value) {
            if (!value) {
                allTrue = false;
                return false; // false 반환하면 $.each 종료
            }
        });

        if (!allTrue) {
        	console.log(pwCheck);
            alert("새 비밀번호 설정을 다시 확인해주세요");
        }
    	
        $.ajax({
            url: "/ieum/auth/changePw",
            type: "POST",
            data: { userId : $("#userId").val(),
            	password : $("#pw").val()},
            dataType: "json",
            success: function(response) {
                if(response.success) {
                	window.location.href="/ieum/findPw2";
                } else {
                    alert(response.message);
                }
            },
            error: function(err) {
                console.log(err);
            }
        });
    });
	        