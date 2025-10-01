var userInfo = {
	userName : false,
	birthDate : false,
	userId : false,
	userPw : false,
	userTel : false,
	userHos : false
}



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


// 병원 검색 모달 열기
$("#open-modal").click(function() {
	$("#modal").css("display", "flex");
})

// 병원 검색 모달 닫기
$("#close-modal").click(function () {
	$("#modal").css("display", "none");
})

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
				// 성공
			}else{
				// 실패
			}
		},
		error:function(err){
			// 에러
			console.log(err);
		}
		
	})
})
