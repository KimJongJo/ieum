// 모달 요소
const modalProfile = document.getElementById("modal-dia");
const modalProfile2 = document.getElementById("modal-dia2");

// 닫기 버튼
const closeBtn1 = modalProfile.querySelector(".diaWriteX");
const closeBtn2 = modalProfile2.querySelector(".patientInfoX");

// document(또는 공통 부모)에서 이벤트를 위임
$(document).on("click", ".write-btn", function(e) {
    // td 안의 .show-btn 클릭 시 모달이 열리지 않도록 방지
    if ($(e.target).hasClass("show-btn")) return;

    var rNo = $(this).val();
    $.ajax({
		url:"/ieum/hosManager/patientInfo",
		type:"POST",
		data:{rNo:rNo},
		dataType:"json",
		success:function(res){
			if(res.success){
				var object = res.object;
				var gender;
				if(object.gender == 'MALE'){
					gender = '남'
				} else{
					gender = '여'
				}
				
				// 값 채워넣기
				$("#pNo").text(object.pNo);
				$("#birthDate").text(object.birthDate);
				$("#uTel").text(object.uTel);
				$("#username").text(object.username);
				$("#gender").text(gender);
				$("#uAddress").text(object.uAddress);
				$("#dNo").text(object.diaNo);
				$("#rDate").text(object.rDate);
				$("#hNm").text(object.hNm);
				$("#mName").text(object.mNm);
				$("#major").text(object.major);
				$("#hAddress").text(object.hAddress);
				
				$(".modal-dia").css("display", "flex");
    			$("body").css("overflow", "hidden");
			}else{
				console.log(res.message);
			}
		},
		error:function(err){
			console.log(err);
		}
	})
    
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
