
//다가오는 예약 리스트 넘기기
const carousel = document.getElementById("hospitalCarousel");

document.getElementById("btnLeft").addEventListener("click", () => {
	carousel.scrollBy({ left: -300, behavior: "smooth" });
});

document.getElementById("btnRight").addEventListener("click", () => {
	carousel.scrollBy({ left: 300, behavior: "smooth" });
});