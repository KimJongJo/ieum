// 모달 요소
const modalProfile = document.getElementById("modal-dia3");
const modalProfile2 = document.getElementById("modal-dia2");

// 닫기 버튼
const closeBtn2 = modalProfile2.querySelector(".patientInfoX");
const closeBtn3 = document.getElementById("more-dia2-x");

// 환자정보 보기 클릭 시 modalProfile2 열기
document.querySelectorAll(".show-pInfo-btn").forEach(btn => {
    btn.addEventListener("click", (e) => {
        e.stopPropagation(); // td 이벤트 전파 막기
        modalProfile2.style.display = "flex";
        document.body.style.overflow = "hidden";
    });
});

// 진단서 보기 클릭 시 modalProfile 열기
$(document).on("click", ".show-dia-btn", function(e) {
    e.stopPropagation(); // td 이벤트 전파 막기
    
    $.ajax({
		url:"/ieum/hosManager/pastDia",
		type:"POST",
		data:{dNo:$(this).val()},
		dataType:"json",
		success:function(res){
			if(res.success){
				var object = res.object;
				console.log(object);
				// 진단서 채우기
				$("#dia2pNo").text(object.pNo);
				$("#dia2birthDate").text(object.birthDate);
				$("#dia2uTel").text(object.uTel);
				$("#dia2username").text(object.pNm);
				$("#dia2gender").text(object.gender);
				$("#dia2uAddress").text(object.uAddress);
				
				$("#dia2dNo").text(object.diaNo);
				$("#dia2rDate").text(object.rDate);
				$("#dia2hNm").text(object.hNm);
				$("#dia2mName").text(object.mNm);
				$("#dia2major").text(object.major);
				$("#dia2hAddress").text(object.hAddress);
				
				$("#dia2diaName").text(object.diaName);
				$("#dia2sym").text(object.sym);
				$("#dia2summary").text(object.summary);
				$("#dia2treatment").text(object.treatment);
				$("#dia2pre").text(object.pre);
				$("#dia2").text(object.docComment);
				
				
				$("#modal-dia3").css("display", "flex");
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




closeBtn2.addEventListener("click", () => {
    modalProfile2.style.display = "none";
    document.body.style.overflow = "";
});

closeBtn3.addEventListener("click", () => {
    modalProfile.style.display = "none";
    document.body.style.overflow = "";
});
