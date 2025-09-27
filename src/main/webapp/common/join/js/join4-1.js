var userInfo = {
	userName : false,
	nickname : false,
	birthDate : false,
	userId : false,
	userPw : false,
	userTel : false,
	userAdd : false
}


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



$("#signUp-btn").click(function(e) { // 클릭 시 확인
    var allTrue = true;
	
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


















