
const modalProfile2 = document.getElementById("modal-dia2");
const closeBtn2 = document.getElementById("p-info-div"); // 닫기 아이콘

// 모달 열기 함수
function openModal() {
    modalProfile2.style.display = "flex"; // 모달 보이기
    document.body.style.overflow = "hidden"; // 스크롤 막기
}

// 모달 닫기 함수
function closeModal() {
    modalProfile2.style.display = "none"; // 모달 숨기기
    document.body.style.overflow = ""; // 스크롤 허용
}

// 예: 테이블에서 클릭 시 모달 열기 (임의 예시)
document.querySelectorAll(".search-user-btn").forEach((td) => {
    td.addEventListener("click", () => {
        openModal();
    });
});



// 모달 배경 클릭 시 모달 닫기
/*modalProfile.addEventListener("click", (e) => {
    // 모달 안쪽(.profile) 클릭은 무시
    if (e.target === modalProfile) {
        closeModal();
    }
});*/

// 닫기 버튼 클릭 시
closeBtn2.addEventListener("click", closeModal);

