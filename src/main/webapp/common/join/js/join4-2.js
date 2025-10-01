var userInfo = {
	userName : false,
	birthDate : false,
	userId : false,
	userPw : false,
	userTel : false,
	userHos : false
}






// 병원 검색 모달 열기
$("#open-modal").click(function() {
	$("#modal").css("display", "flex");
})

// 병원 검색 모달 닫기
$("#close-modal").click(function () {
	$("#modal").css("display", "none");
})

// 검색 결과가 새로 채워져도 동적으로 이벤트 주기
$(document).on("click", ".hosName", function() {
	    // 검색하고난다음 병원검색했을때의 결과창을 비운다.
	    $("#hosList").html("");
	    // 검색창도 똑같이 비운다
	    $("#hosName").val("");
	    // 그리고 마지막으로 모달창도 닫는다.
	    $("#modal").css("display", "none");
	    // 그리고 hNo를 hidden input value로 지정
	    $("#hNo").val($(this).attr("value"));
	    // 선택한 병원 이름을 채워준다.
	    $("#hosNameInput").val($(this).text());
	    // 소속병원 및 병원코드 인증 상태 변경
	    $("#hosAuth-span").css("display", "none");
	    userInfo.userHos = false;
	});


// 검색했을때 키워드를 통해 가져온 병원 목록 뿌리기
$("#hosName-search-btn").click(function () {
	// 공백이라면
	if($("#hosName").val().trim() === ""){
		alert("검색어를 입력해주세요");
		return;
	}
	
	$.ajax({
		url:"/ieum/join/hosList",
		type:"POST",
		data:{keyword:$("#hosName").val()},
		dataType:"json",
		success:function(res){
			if(res.success){
				let rows = "";
				// 성공
				res.object.forEach(item => {
					rows += `
						<div value="${item.hNo}" class="hosName">${item.hNm} (${item.city} ${item.gungu})</div>
					`
				})
				$("#hosList").html(rows);
			}else{
				// 실패
				console.log(res.message);
			}
		},
		error:function(err){
			// 에러
			console.log(err);
		}
		
	})
})

// 병원 키 인증하기
$("#hosAuth").click(function() {
	
	if($("#hosNameInput").val().trim() === ""){
		alert("병원 검색을 통해 소속병원을 등록해주세요");
		return;
	}
	
	$.ajax({
		url:"/ieum/auth/hospitalAuth",
		type:"POST",
		data:{hNo:$("#hNo").val(),
			authCode:$("#hosAuthCode").val().toUpperCase()},
		dataType:"json",
		success:function(res){
			$("#hosAuth-span").css("display", "block");
			if(res.success){
				alert("인증되었습니다.");
				$("#hosAuth-i").removeClass("fa-xmark span-x").addClass("fa-check span-check");
				userInfo.userHos = true;
			}else{
				alert("인증코드가 일치하지 않습니다.");
				$("#hosAuth-i").removeClass("fa-check span-check").addClass("fa-xmark span-x");
				userInfo.userHos = false;
			}
		},
		error:function(err){
			console.log(err);
		}
	})
})



$("#signUp-btn").click(function(e) {
    var allTrue = true;
    var firstFalseItem = "";

    // 키를 한국어 이름으로 매핑
    const keyMap = {
        userName: "성명",
        birthDate: "생년월일",
        userId: "아이디",
        userPw: "비밀번호",
        userTel: "전화번호",
        userHos: "소속병원 및 병원코드"
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









