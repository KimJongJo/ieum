
$(document).ready(function() {

	//실제 유저 입력 토글
	$("#actUser").hide();

	$("#actBtn").on("click", function() {
		$("#actUser").slideToggle(400);

	});

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
					alert("예약 완료!");
					window.location.href = "/ieum/reservation/summary";
				} else {
					alert("예약 실패!");
				}
			})
			.fail(function(err) {
				console.error("예약 실패:", err);
			});
	});


});