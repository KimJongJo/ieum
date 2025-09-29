// 모달 요소
const modalProfile = document.getElementById("modal-dia");
const modalProfile2 = document.getElementById("modal-dia2");

// 닫기 버튼
const closeBtn1 = modalProfile.querySelector(".fa-xmark");
const closeBtn2 = modalProfile2.querySelector(".fa-xmark");

// td 클릭 시 modalProfile 열기
document.querySelectorAll(".write-btn").forEach(td => {
    td.addEventListener("click", (e) => {
        // td 안에 show-btn 클릭시 modal2가 열리는 것을 방지
        if(e.target.classList.contains("show-btn")) return;
        modalProfile.style.display = "flex";
        document.body.style.overflow = "hidden";
    });
});

// show-btn 클릭 시 modalProfile2 열기
document.querySelectorAll(".show-btn").forEach(btn => {
    btn.addEventListener("click", (e) => {
        e.stopPropagation(); // td 이벤트 전파 막기
        modalProfile2.style.display = "flex";
        document.body.style.overflow = "hidden";
    });
});

// 닫기 버튼 클릭 시 모달 닫기
closeBtn1.addEventListener("click", () => {
    modalProfile.style.display = "none";
    document.body.style.overflow = "";
});

closeBtn2.addEventListener("click", () => {
    modalProfile2.style.display = "none";
    document.body.style.overflow = "";
});
