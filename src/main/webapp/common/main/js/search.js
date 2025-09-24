$(document).ready(function() {
	$(".tabs .tab").on("click", function() {
		// 모든 탭에서 active 제거
		$(".tabs .tab").removeClass("active");
		// 클릭한 탭에 active 추가
		$(this).addClass("active");
		const tabText = $(this).text().trim();
		$(".notices-section").show();
		$(".community-section").show();
		console.log("선택탭", tabText);
		if (tabText == "공지사항") $(".community-section").hide();
		if (tabText == "커뮤니티") $(".notices-section").hide();
	});
});