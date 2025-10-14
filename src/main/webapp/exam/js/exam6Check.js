document.addEventListener("DOMContentLoaded", function() {
    const form = document.querySelector("form");

    form.addEventListener("submit", function(e) {
        
        let allChecked = true;
        const totalQuestions = 30;
        

        for (let i = 1; i <= totalQuestions; i++) {
            const radios = document.getElementsByName("score" + i);
            let checked = false;

            for (let r of radios) {
                if (r.checked) {
                    checked = true;
                    break;
                }
            }

            if (!checked) {
                allChecked = false;
                alert("모든 문항을 선택해주세요.");
                break;
            }
        }

        if (!allChecked) {
            e.preventDefault(); // 폼 전송 막기
        }
    });
});