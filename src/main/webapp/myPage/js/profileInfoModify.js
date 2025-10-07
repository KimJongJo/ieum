window.addEventListener('DOMContentLoaded', () => {
    const uploadBtn = document.getElementById('uploadBtn');
    const profileInput = document.getElementById('profileInput');

    // 업로드 버튼 클릭 시 파일 선택 창 열기
    uploadBtn.addEventListener('click', function() {
        profileInput.click();
    });

    // 파일 선택 시 미리보기 적용
    profileInput.addEventListener('change', function(event) {
        const file = event.target.files[0];
        if (!file) return;

        const reader = new FileReader();
        reader.onload = function(e) {
            document.querySelector('#profile-preview img').src = e.target.result;
        }
        reader.readAsDataURL(file);

    });

    // 기존 '관리 메뉴' 숨기기 코드
    const manageMenu = document.querySelector('.menu span:nth-child(5)');
    if (manageMenu) manageMenu.style.display = 'none';
});

// 다음 우편번호 찾기
function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            var addr = '';
            if (data.userSelectedType === 'R') {
                addr = data.roadAddress;
            } else {
                addr = data.jibunAddress;
            }
            document.getElementById("address").value = addr;
            document.getElementById("detailAddress").focus();
        }
    }).open();
}


window.addEventListener('DOMContentLoaded', () => {
    // '관리 메뉴' 요소 선택
    const manageMenu = document.querySelector('.menu span:nth-child(5)');
    if (manageMenu) {
        manageMenu.style.display = 'none'; // 메뉴 숨기기
    }
});