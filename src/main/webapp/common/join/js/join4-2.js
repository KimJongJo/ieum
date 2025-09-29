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


