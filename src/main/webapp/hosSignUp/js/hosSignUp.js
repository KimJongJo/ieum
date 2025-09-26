function searchAddr() {

            new daum.Postcode({
                oncomplete: function (data) {

                    var addr = ''; // 주소 변수

                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById("postcode").value = data.zonecode;
                    document.getElementById("address-auto").value = addr;
                    // 커서를 상세주소 필드로 이동한다.
                    document.getElementById("address-detail").focus();
                }
            }).open();
        }