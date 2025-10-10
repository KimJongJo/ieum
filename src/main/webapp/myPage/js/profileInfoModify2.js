window.addEventListener('DOMContentLoaded', () => {
    const uploadBtn2 = document.getElementById('uploadBtn2');
    const profileInput2 = document.getElementById('profileInput2');

    // 업로드 버튼 클릭 시 파일 선택 창 열기
    uploadBtn2.addEventListener('click', function() {
        profileInput2.click();
    });

    // 파일 선택 시 미리보기 적용
    profileInput2.addEventListener('change', function(event) {
        const file = event.target.files[0];
        if (!file) return;

        const reader = new FileReader();
        reader.onload = function(e) {
            document.querySelector('#profile-preview2 img').src = e.target.result;
        }
        reader.readAsDataURL(file);
    });

    // 기존 '관리 메뉴' 숨기기 코드
    const manageMenu = document.querySelector('.menu span:nth-child(5)');
    if (manageMenu) manageMenu.style.display = 'none';
});


window.addEventListener('DOMContentLoaded', () => {
    // '관리 메뉴' 요소 선택
    const manageMenu = document.querySelector('.menu span:nth-child(5)');
    if (manageMenu) {
        manageMenu.style.display = 'none'; // 메뉴 숨기기
    }
});