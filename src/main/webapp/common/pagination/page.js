$(document).ready(function() {
	// 페이지네이션 클릭 이벤트
	$(".pagination button").on("click", function() {
		const pageNum = $(this).text();

		if ($.isNumeric(pageNum)) { // 숫자 버튼 클릭 시
			$(".pagination button").removeClass("active");
			$(this).addClass("active");
		}
	});
});