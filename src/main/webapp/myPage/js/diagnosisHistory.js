const modalProfile = document.getElementById("modal-div");
            const closeBtn = modalProfile.querySelector(".fa-xmark"); // 닫기 아이콘

            // 모달 열기 함수
            function openModal() {
                modalProfile.style.display = "flex"; // 모달 보이기
                document.body.style.overflow = "hidden"; // 스크롤 막기
                
            }

            // 모달 닫기 함수
            function closeModal() {
                modalProfile.style.display = "none"; // 모달 숨기기
                document.body.style.overflowY = ""; // 스크롤 허용
                
            }

            // 예: 테이블에서 클릭 시 모달 열기 (임의 예시)
            document.querySelectorAll(".btn2").forEach((td) => {
                td.addEventListener("click", () => {
                    openModal();
                });
            });

            // 모달 배경 클릭 시 모달 닫기
            modalProfile.addEventListener("click", (e) => {
                // 모달 안쪽(.profile) 클릭은 무시
                if (e.target === modalProfile) {
                    closeModal();
                }
            });

            document.getElementById("check").addEventListener("click", () => {
                closeModal();
            });

            // 닫기 버튼 클릭 시
            closeBtn.addEventListener("click", closeModal);