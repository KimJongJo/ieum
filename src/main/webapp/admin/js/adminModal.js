const modalProfile = document.getElementById("modal-profile");
const closeBtn = modalProfile.querySelector(".fa-xmark"); // 닫기 아이콘

// 모달 열기 함수
function openModal() {
    modalProfile.style.display = "flex"; // 모달 보이기
    document.body.style.overflow = "hidden"; // 스크롤 막기
}

// 모달 닫기 함수
function closeModal() {
    modalProfile.style.display = "none"; // 모달 숨기기
    document.body.style.overflow = ""; // 스크롤 허용
}

// 예: 테이블에서 클릭 시 모달 열기 (임의 예시)
document.querySelectorAll(".userInfo").forEach((td) => {
    td.addEventListener("click", () => {
        openModal();
    });
});

// 닫기 버튼 클릭 시
closeBtn.addEventListener("click", closeModal);
