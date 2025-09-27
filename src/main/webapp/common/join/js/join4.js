            const yearSelect = document.getElementById("year");
            const monthSelect = document.getElementById("month");
            const daySelect = document.getElementById("day");

            const currentYear = new Date().getFullYear();

            // 연도 채우기 (현재 연도부터 1900년까지 내림차순)
            for (let y = currentYear; y >= 1900; y--) {
                const option = document.createElement("option");
                option.value = y;
                option.textContent = y + "년";
                yearSelect.appendChild(option);
            }

            // 월 채우기
            for (let m = 1; m <= 12; m++) {
                const option = document.createElement("option");
                option.value = m;
                option.textContent = m + "월";
                monthSelect.appendChild(option);
            }

            // 일 채우는 함수
            function updateDays() {
                const year = parseInt(yearSelect.value);
                const month = parseInt(monthSelect.value);

                if (!year || !month) return;

                let daysInMonth;
                if (month === 2) {
                    daysInMonth = year % 4 === 0 && (year % 100 !== 0 || year % 400 === 0) ? 29 : 28;
                } else if ([4, 6, 9, 11].includes(month)) {
                    daysInMonth = 30;
                } else {
                    daysInMonth = 31;
                }

                daySelect.innerHTML = '<option value="none">일</option>';
                for (let d = 1; d <= daysInMonth; d++) {
                    const option = document.createElement("option");
                    option.value = d;
                    option.textContent = d;
                    daySelect.appendChild(option);
                }
            }

            yearSelect.addEventListener("change", updateDays);
            monthSelect.addEventListener("change", updateDays);

            const pw = document.getElementById("pw");
            const pw2 = document.getElementById("pw2");
            const pwch = document.getElementById("pwch");
            const pwch2 = document.getElementById("pwch2");

            pwch.addEventListener("click", () => {
                if (pw.type === "password") {
                    pw.type = "text";
                    pwch.textContent = "숨기기";
                } else {
                    pw.type = "password";
                    pwch.textContent = "보기";
                }
            });

            pwch2.addEventListener("click", () => {
                if (pw2.type === "password") {
                    pw2.type = "text";
                    pwch2.textContent = "숨기기";
                } else {
                    pw2.type = "password";
                    pwch2.textContent = "보기";
                }
            });
            
            

            