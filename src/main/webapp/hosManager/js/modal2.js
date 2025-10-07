
// const closeBtn2 = document.getElementById("p-info-div"); // 닫기 아이콘

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
$(document).on("click", ".search-user-btn", function() {
	
	$.ajax({
		url:"/ieum/hosManager/patientProfile",
		type:"POST",
		data:{rNo : $(this).val()},
		dataType:"json",
		success:function(res){
			if(res.success){
				
				var gender;
				if(res.object.gender == 'MALE'){
					gender = '남'
				}else{
					gender = '여'
				}
				
				var object = res.object;
				$("#infopNo").text(object.pNo);
				$("#infoBirthDate").text(object.birthDate);
				$("#infoTel").text(object.uTel);
				$("#infoUsername").text(object.username);
				$("#infoGender").text(gender);
				$("#infouAddress").text(object.uAddress);
				$("#content").text(object.content);
				
			}else{
				console.log(res.message);
			}
		},
		error:function(err){
			console.log(err);
		}
	})
	
	
    openModal();
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

