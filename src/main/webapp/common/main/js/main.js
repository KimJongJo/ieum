$(document).ready(function() {
	const hospitalList = $(".hospital-list");
	const leftBtn = $(".hospital-btn-left");
	const rightBtn = $(".hospital-btn-right");

	const scrollStep = 218; // 카드 + 간격 너비
	leftBtn.on("click", function() {
		hospitalList.animate(
			{ scrollLeft: hospitalList.scrollLeft() - scrollStep },
			400
		);
	});

	rightBtn.on("click", function() {
		hospitalList.animate(
			{ scrollLeft: hospitalList.scrollLeft() + scrollStep },
			400
		);
	});
});