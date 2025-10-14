
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

$.ajax({
		url: "/ieum/myPage/reservation/detail",
		type: "POST",
		async: false,
		data: { rNo: rNo,
			action: "resUpdate" },
		dataType: "json",
		success: function(data) {
			$.ajax({
				url:"/ieum/hospital/detail",
				type:"POST",
				data: {
					hNo: hNo,
					mNo: data.mNo,
					rDate: data.rDate,
					rTime: data.rTime,
					rContent: data.rContent,
					action:"activeRes"
				},
				dataType: "json",
				success: function(data){
					localStorage.setItem("resData", JSON.stringify(data));
					window.location.href = "/ieum/hospital/detail?hNo="+hNo;
				}
				
			});
		},
		error: function(error) {
			console.error("검색 실패:", error);
			alert("검색 중 오류가 발생했습니다.");
		}
	});

});











