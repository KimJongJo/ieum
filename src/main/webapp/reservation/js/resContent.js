
$(document).ready(function() {

	//실제 유저 입력 토글
	$("#actUser").hide();

	$("#actBtn").on("click", function() {
		$("#actUser").slideToggle(400);

	});
	
	//전화번호 입력 확인
	$("#actTel").css("letter-spacing", "2px").on("input", function(){
		const check = actTel($(this).val());
		$(this).val(check);
		
		if(check.length === 13){
			$(".checkI").addClass("active");
		}else{
			$(".checkI").removeClass("active");
		}
	});


	//전화번호 형식
	function actTel (str) {
		str = str.replace(/[^0-9]/g, '');
		var tmp = '';
		if (str.length < 4) {
			return str;
		} else if (str.length < 7) {
			tmp += str.substr(0, 3);
			tmp += '-';
			tmp += str.substr(3);
			return tmp;
		} else if (str.length < 11) {
			tmp += str.substr(0, 3);
			tmp += '-';
			tmp += str.substr(3, 3);
			tmp += '-';
			tmp += str.substr(6);
			return tmp;
		} else {
			tmp += str.substr(0, 3);
			tmp += '-';
			tmp += str.substr(3, 4);
			tmp += '-';
			tmp += str.substr(7);
			return tmp;
		}
	}


	//insert
	$("#resSubmit").on("click", function() {
		const actName = $("input[name='actName']").val();
		const actTel = $("input[name='actTel']").val();

		// 실제 정보 추가 입력
		const data = {
			mNo: $("#mNo").val(),
			rDate: $("#rDate").val(),
			rTime: $("#rTime").val(),
			rDay: $("#rDay").val(),
			rContent: $("#rContent").val(),
			actName: actName,
			actTel: actTel,
			action: "ResInsert"
		};

		$.post("/ieum/reservation/content", data)
			.done(function(res) {
				if (res === "success") {
					window.location.href = "/ieum/reservation/summary";
				} else {
					alert("예약 실패!");
				}
			})
			.fail(function(err) {
				console.error("예약 실패:", err);
			});
	});
	
	//content 수정
	$("#modiBtn").on("click", function(){
		
		$("#updateBtn").show();
		$("#modiBtn").hide();
		
		$("#readContent").hide();
		$("#modifyContent").show();
		
		
	});
	
	
	$("#updateBtn").on("click", function(){
			const modCon = $("textarea[name='modContent']").vavl();
			
			const data = {
				action: "modifyContent",
				modCon: modCon
			};
			
			$.post("/ieum/reservation/content", data)
			.done(function(res){
				if(res === "success"){
					alert("변경되었습니다.");
					location.reload();
				}
				
			})
			.fail(function(err) {
				console.log(err);
			});
			
		});


});