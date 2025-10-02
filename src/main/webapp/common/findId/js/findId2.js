let nextPageLoad = false; // 다음 페이지를 이동해도 되는지
        
$(function(){
	$("#emailSend").click(function() {
	    $("#emailSend").prop("disabled", true); // 클릭 시 먼저 비활성화

 		alert("이메일이 전송되었습니다!");
        $.ajax({
            url: "/ieum/auth/sendEmailCode",
            type: "POST",
            data: { email: $("#inputEmail").val() },
            dataType: "json",
            success: function(response) {
                if (!response.success) {
                   alert("이메일 전송 실패했습니다.. 잠시 후 다시 요청해주세요");
                }
                $("#emailSend").prop("disabled", false); // 전송 끝나면 버튼 풀기
            },
            error: function(error) {
                console.log("에러 " + error);
                $("#emailSend").prop("disabled", false); // 에러 시 버튼 풀기
            }
        });
	            
	});

	
	$("#emailAuthCheck").click(function () { // 이메일 인증 코드 비교하는거
		
		$.ajax({
			
			url:"/ieum/auth/checkEmailCode",
			type:"POST",
			data:{email: $("#inputEmail").val(),
				code : $("#inputAuthCode").val(),
				type:"findId"},
			dataType: "json",
			success:function(response){
				
				
				if(response.success){
					$(".auth-icon").css("display", "block");
					$("#email-check-comment").text("인증이 완료되었습니다")
					alert(response.message);
					nextPageLoad = true; // 인증되었으니 다음 페이지로 가는걸 허락
				}else{
					alert(response.message);
					nextPageLoad = false; // 인증안됨 허락 못함
				}
				
			},
			error:function(error){
				console.log("에러" + error);
				nextPageLoad = false;
			}
			
			
		})
	})
	
	$("#inputEmail").on("input", function () { // 인증이 된 상태인데 이메일을 다시 입력하려고 할때 기본 값으로 되돌림
		nextPageLoad = false;
		$(".auth-icon").css("display", "none");
		$("#email-check-comment").text("이메일을 인증해주세요")
	})
	
	$("#nextPageBtn").click(function() { // 이메일 인증도 안하고 다음 페이지로 넘어가려고 할 때
		if(!nextPageLoad){
			alert("본인확인을 위한 이메일 인증을 해주세요");
		}else{
			window.location.href = "/ieum/findId2";
		}
	})
	
})