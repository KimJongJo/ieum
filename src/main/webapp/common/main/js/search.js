function formSubmit(action, name, value) {
	const form = document.createElement("form");
	form.method = "POST";
	form.action = action;

	const input = document.createElement("input");
	input.type = "hidden";
	input.name = name;
	input.value = value;

	form.appendChild(input);
	document.body.appendChild(form);
	form.submit();
}
function goNoticeDetail(no){
	formSubmit('/ieum/notice', "nNo", no);
}
function goCommuDetail(no) {
	location.href=`/ieum/comDetail?no=${no}`
}
function searchKeyword() {
	const keyword=$("#searchInput").val();
	location.href = `/ieum/search?keyword=${keyword}`;
}
$(document).ready(function() {
	const keyword = $(".keyword").text().trim();
    if (!keyword) return;

    // 검색결과 텍스트가 들어있는 요소들 선택
    const targets = $(".result-title, .result-content");

    targets.each(function() {
        const html = $(this).html();
        const regex = new RegExp(`(${keyword})`, "gi"); // 대소문자 구분 없이 매칭
        const newHtml = html.replace(regex, `<span class="keyword">$1</span>`);
        $(this).html(newHtml);
    });
	$("#searchBtn").on("click", function() {
		searchKeyword();
	})
	$("#searchInput").on("keypress", function(e) {
		if (e.which === 13) {
			e.preventDefault();
			searchKeyword();
		}
	});
	$(".tabs .tab").on("click", function() {
		// 모든 탭에서 active 제거
		$(".tabs .tab").removeClass("active");
		// 클릭한 탭에 active 추가
		$(this).addClass("active");
		const tabText = $(this).text().trim();
		$(".notices-section").show();
		$(".community-section").show();
		if (tabText == "공지사항") $(".community-section").hide();
		if (tabText == "커뮤니티") $(".notices-section").hide();
	});
});