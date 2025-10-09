$("#modifyHosInfo").click(function () {
    $("#modifyHosInfo").hide();
    $("#saveHosInfo").show();

    // 홈페이지주소 (box10)
    const hLink = $("#box10").text();
    $("#box10").html(`<input class="plusInput" type="text" id="hLinkInput" value="${hLink}" />`);

    // 오시는길 (box12)
    const transferInfo = $("#box12").text();
    $("#box12").html(`<textarea class="plusText" id="transferInput" rows="3">${transferInfo}</textarea>`);

    // 병원공지 (box16)
    const newsTitle = $("#box16").text();
    $("#box16").html(`<input class="plusInput" type="text" id="newsTitleInput" value="${newsTitle}" />`);

    // 공지내용 (box18)
    const newsContent = $("#box18").text();
    $("#box18").html(`<textarea class="plusText" id="newsContentInput" rows="4">${newsContent}</textarea>`);
});


$("#saveHosInfo").click(function () {
    // 입력된 값 가져오기
    const newLink = $("#hLinkInput").val();
    const newTransfer = $("#transferInput").val();
    const newTitle = $("#newsTitleInput").val();
    const newContent = $("#newsContentInput").val();

    // 다시 span 형태로 돌려놓기
    $("#box10").html(newLink);
    $("#box12").html(newTransfer);
    $("#box16").html(newTitle);
    $("#box18").html(newContent);

    // 버튼 상태 전환
    $("#saveHosInfo").hide();
    $("#modifyHosInfo").show();

    // 필요하다면 Ajax로 서버에 전송
    
    console.log($("#saveHosInfo").val());
    
    $.ajax({
        url: context + "/hosManager/updateHospitalInfo",
        type: "POST",
        data: {
			hNo:$("#saveHosInfo").val(),
            hLink: newLink,
            transferInfo: newTransfer,
            newsTitle: newTitle,
            newsContent: newContent
        },
        success: function(res){
            alert("수정 완료!");
        },
        error: function(){
            alert("수정 실패");
        }
    });
    
});
