var userInfo = {
	userName : false,
	nickname : false,
	userEmail:false,
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




$(function(){
	$("#emailSend").click(function() {
	    
	    
	    let email = $("#email").val().trim();
        let regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/; // 기본적인 이메일 정규식

        if (!regex.test(email)) {
            alert("이메일 형식인지 확인해주세요");
            return;
        }

		$("#emailSend").prop("disabled", true); // 클릭 시 먼저 비활성화

	    $.ajax({
	        url: "/ieum/auth/sendEmailCode",
	        type: "GET",
	        data: { email: $("#email").val() },
	        dataType: "json",
	        success: function(response) {
	        	
	            if (response.success) {
					alert("인증 코드가 이메일로 전송되었습니다.");
	                // 이메일 사용 가능 -> 코드 전송 요청
	                $.ajax({
	                    url: "/ieum/auth/sendEmailCode",
	                    type: "POST",
	                    data: { email: email},
	                    dataType: "json",
	                    success: function(response) {
	                        if (response.success) {
	                        $("#emailSend").prop("disabled", false); // 전송 끝나면 버튼 풀기
	                        }
	                           
	                    },
	                    error: function(error) {
	                        console.log("에러 " + error);
	                        $("#emailSend").prop("disabled", false); // 에러 시 버튼 풀기
	                    }
	                });
	            } else {
	                alert("이미 사용중인 이메일 입니다.");
	                $("#emailSend").prop("disabled", false); // 여기서 풀어줌
	            }
	        },
	        error: function(error) {
	            console.log("에러 " + error);
	            $("#emailSend").prop("disabled", false); // 에러 시 버튼 풀기
	        }
	    });
	});

	
	$("#emailAuthCheck").click(function () { // 이메일 인증 코드 비교하는거
		
		if($("#emailCode").val().trim() === ""){
			alert("인증코드를 입력해주세요");
			return;
		}
		
		$.ajax({
			
			url:"/ieum/auth/checkEmailCode",
			type:"POST",
			data:{email: $("#email").val(),
				code : $("#emailCode").val(),
				type:"signUp" 	
			},
				
			dataType: "json",
			success:function(response){
				
				$("#email-span").css("display", "block");
				if(response.success){
					userInfo.userEmail = true;
					alert("인증되었습니다.");
					$("#emailCode").prop("disabled", true);
            		$("#email-i").removeClass("fa-xmark span-x").addClass("fa-check span-check");
				}else{
					userInfo.userEmail = false;
            		$("#email-i").removeClass("fa-check span-check").addClass("fa-xmark span-x");
					alert(response.message);
				}
				
			},
			error:function(error){
				console.log("에러" + error);
				nextPageLoad = false;
			}
			
			
		})
	})
	
	$("#email").on("input", function () { // 인증이 된 상태인데 이메일을 다시 입력하려고 할때 기본 값으로 되돌림
		$("#emailCode").prop("disabled", false);
		userInfo.userEmail = false;
		$(".auth-icon").css("display", "none");
		$("#email-check-comment").text("이메일을 인증해주세요")
	})
	
	
})











$("#signUp-btn").click(function(e) {
    var allTrue = true;
    var firstFalseItem = "";

    // 키를 한국어 이름으로 매핑
    const keyMap = {
        userName: "성명",
        nickname: "닉네임",
        userEmail: "이메일",
        userAdd: "주소",
    };


    $.each(userInfo, function(key, value) {
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



















