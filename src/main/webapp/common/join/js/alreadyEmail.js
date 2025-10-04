
// 병합하기를 눌렀을 때 비밀번호를 입력하는 추가 칸을 만들기
$("#mixAcc").click(function() {
	$(".main-div").css("height", "430px");
	$("#pw-input-div").css("display", "block");
})

// 비밀번호를 입력하고 병합하기를 눌렀을때의 기능을 처리
$("#mixAcc-btn").click(function() {
	if($("#password").val().trim() === ""){
		alert("비밀번호를 입력해주세요");
		return;
	}
	
	$.ajax({
		url:"/ieum/social/checkPw",
		type:"POST",
		data:{password:$("#password").val(),
		email:$("#email").val(),
		id:$("#id").val()},
		dataType:"json",
		success:function(res){
			if(res.success){
				alert("계정이 병합되었습니다.");
				window.location.href="/ieum/index";
			}else{
				alert("비밀번호가 일치하지 않습니다.");
				console.log("비밀번호가 틀림");
			}
		},
		error:function(err){
			console.log(err);
		}
	})
})