const container = document.querySelector("#hospitalCarousel");
const cards = Array.from(container.querySelectorAll(".list-center"));
const btnLeft = document.querySelector("#moveLeft");
const btnRight = document.querySelector("#moveRight");

let metrics = calcMetrics();
let currentIndex = 0;
let isAnimating = false;

function calcMetrics() {
  if (!cards.length) return { cardWidth: 0, visibleCount: 1, maxIndex: 0 };
  const card = cards[0];
  const style = getComputedStyle(card);
  const marginLR = parseFloat(style.marginLeft) + parseFloat(style.marginRight);
  const cardWidth = card.offsetWidth + marginLR;
  const visibleCount = Math.max(1, Math.floor(container.clientWidth / cardWidth));
  const maxIndex = Math.max(0, cards.length - visibleCount);
  return { cardWidth, visibleCount, maxIndex };
}

function updateButtons() {
  btnLeft.classList.toggle("disabled", currentIndex === 0);
  btnRight.classList.toggle("disabled", currentIndex >= metrics.maxIndex);
}

function cardLeftPos(i) {
  const card = cards[i];
  return card.offsetLeft; // container.scrollLeft 기준 absolute left
}

function scrollToIndex(i) {
  i = Math.max(0, Math.min(metrics.maxIndex, i));
  currentIndex = i;
  const targetLeft = Math.round(cardLeftPos(currentIndex));
  isAnimating = true;
  container.scrollTo({ left: targetLeft, behavior: "smooth" });
  // 스크롤 종료 후 버튼 상태 업데이트
  setTimeout(() => {
    isAnimating = false;
    updateButtons();
  }, 300); // 애니메이션 시간과 동일하게
}

// 클릭 이벤트
btnLeft.addEventListener("click", () => {
  if (isAnimating || currentIndex === 0) return;
  scrollToIndex(currentIndex - 1);
});
btnRight.addEventListener("click", () => {
  if (isAnimating || currentIndex >= metrics.maxIndex) return;
  scrollToIndex(currentIndex + 1);
});

// 창 리사이즈 시 메트릭 재계산 및 위치 보정
window.addEventListener("resize", () => {
  metrics = calcMetrics();
  if (currentIndex > metrics.maxIndex) currentIndex = metrics.maxIndex;
  container.scrollLeft = Math.round(cardLeftPos(currentIndex));
  updateButtons();
});

// 초기 상태
metrics = calcMetrics();
updateButtons();


function fetchRecRes (page = 1) {
	const formData = new FormData(serachRec);
	formData.append("page", page);
	
	fetch(serachRec.action, {
		method:"post",
		body: serachRec
	})
	.then(res => res.json())
	.then(data => {
		
	})
}

















