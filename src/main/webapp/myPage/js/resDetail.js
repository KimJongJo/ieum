
//병원 상세
$(document).off("click", "#goHosdetail").on("click", "#goHosdetail", function(e) {
	e.preventDefault(); // a 태그나 기본 동작 막기
	const parent = $(this).closest(".hosinf");
	const hNo = parent.data("hno");

	$.post("/ieum/hospital/detail",
		{
			action: "goHosDetail",
			hNo: hNo
		})
		.done(function() {
			window.location.href = "/ieum/hospital/detail?hNo=" + hNo;
		})
		.fail(function(err) {
			console.error("병원 선택 POST 실패:", err);
			alert("병원 선택에 실패했습니다. 다시 시도해주세요.");
		});

});


//예약취소 모달
$(document).on("click", "#cancelBtn", function(e) {
	e.preventDefault();
	$("#deleteRes").show();
});

//모달 닫기
$("#xBtn, #modalKeepRes").on("click", function() {
	$("#deleteRes").hide();
});

//예약취소
$(document).off("click", "#modalCancelRes").on("click", "#modalCancelRes", function(e) {
	e.preventDefault(); // a 태그나 기본 동작 막기
	const parent = $(".rescom");
	const rNo = parent.data("rno");
	$.post("/ieum/myPage/reservation/cancel", {
		rNo: rNo
	})
		.done(function() {
			window.location.href = "/ieum/myPage/reservation/cancel";
		})
		.fail(function() {
			alert("예약 취소 실패");
		});
});

//예약변경
$("#updateBtn").off("click").on("click", function() {
	const parent = $(".right");
	const rNo = parent.data("rno");
	const hNo = parent.data("hno");
	
	console.log(rNo);
	console.log(hNo);

	$.post("/ieum/reservation/detail",
		{
			rNo: rNo,
			action: "resUpdate"
		})
		.done(function() {
			
			$.post("/ieum/hospital/detail",
			{
				
			})
			
			window.location.href = "/ieum/hospital/detail?hNo=" + hNo
		})
		.fail(function() {
			alert("예약변경 실패");
		});

});














