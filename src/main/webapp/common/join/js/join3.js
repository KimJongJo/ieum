let nextPageLoad = false; // 다음 페이지를 이동해도 되는지
        
$(function(){
	$("#emailSend").click(function() {
	    $("#emailSend").prop("disabled", true); // 클릭 시 먼저 비활성화

	    $.ajax({
	        url: "/ieum/auth/sendEmailCode",
	        type: "GET",
	        data: { email: $("#inputEmail").val() },
	        dataType: "json",
	        success: function(response) {
	        	
	            if (response.success) {
					alert("인증 코드가 이메일로 전송되었습니다.");
	                // 이메일 사용 가능 -> 코드 전송 요청
	                $.ajax({
	                    url: "/ieum/auth/sendEmailCode",
	                    type: "POST",
	                    data: { email: $("#inputEmail").val()},
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
		
		$.ajax({
			
			url:"/ieum/auth/checkEmailCode",
			type:"POST",
			data:{email: $("#inputEmail").val(),
				code : $("#inputAuthCode").val(),
				type:"signUp" 	
			},
				
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
	
	$("#nextPageBtn").click(function(e) { // 이메일 인증도 안하고 다음 페이지로 넘어가려고 할 때
		if(!nextPageLoad){
			e.preventDefault();
			alert("본인확인을 위한 이메일 인증을 해주세요");
		}
	})
	
})