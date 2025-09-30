$(document).ready(function(){
    const hosDetailModal = $('.modal-hospital-detail');

    // info-btn 클릭 이벤트 위임 (동적 생성 대응)
    $(document).on("click", ".info-btn", function() {
        const hNo = $(this).val();

        $.ajax({
            url: "/ieum/requestInfo",
            type: "POST",
            data: { hNo: hNo },
            dataType: 'json',
            success: function(res) {
                if(res.success) {
                    const object = res.object;

                    $("#hosName").text(object.hNm);
                    $("#requestName").text(object.applicantName);
                    $("#reqeustTel").text(object.applicantTel);
                    $("#requestEmail").text(object.applicantEmail);
                    $("#hosAddress").text(object.hAddress);
                    $("#reNo").text(object.hosReNo);

                    $("#pdf-frame").attr("src", contextPath + "/" + object.hosReFilePath);
                    $("#addHos").val(object.hNo);
                    $("#delHos").val(object.hNo);
                } else {
                    console.log("에러 : 존재하지 않는 번호");
                }
            },
            error: function(err) {
                console.log(err);
            }
        });

        hosDetailModal.css("display", "flex");
    });

    // 모달 닫기
    $(".fa-xmark").click(function() {
        hosDetailModal.css("display", "none");
    });

    // move-page 클릭 이벤트 위임
    $(document).on("click", ".move-page", function() {
        loadPage($(this).val());
    });

    // 페이지 로드 함수
    function loadPage(pageNum) {
        $.ajax({
            url: "/ieum/requestHos/page",
            type: "POST",
            data: { page: pageNum },
            dataType: "json",
            success: function(res) {
                // 1) 테이블 갱신
                let rows = "";
                res.object.list.forEach(item => {
                    rows += `
                        <tr>
                            <td>${item.hNo}</td>
                            <td>${item.hNm}</td>
                            <td>${item.hAddress}</td>
                            <td>${item.hTel}</td>
                            <td>${item.hCreated}</td>
                            <td>
                                <button value="${item.hNo}" class="info-btn">정보</button>
                            </td>
                        </tr>
                    `;
                });
                $("#tableSetting tbody").html(rows);

                // 2) 페이지네이션 갱신
                let pageHtml = `<button class="page prev-page" type="button"><i class="fa-solid fa-angle-left"></i></button>`;
                for (let i = res.object.startPage; i <= res.object.endPage; i++) {
                    if (i === res.object.curPage) {
                        pageHtml += `<button value="${i}" class="cur-page" type="button">${i}</button>`;
                    } else {
                        pageHtml += `<button value="${i}" class="page move-page" type="button">${i}</button>`;
                    }
                }
                pageHtml += `<button class="page next-page" type="button"><i class="fa-solid fa-angle-right"></i></button>`;
                $(".page-div").html(pageHtml);
            },
            error: function(err) {
                console.log(err);
            }
        });
    }

    // 승인 버튼
    $("#addHos").click(function() {
        $.ajax({
            url:"/ieum/admin/approve",
            type:"POST",
            data:{hNo:$("#addHos").val()},
            dataType:"json",
            success:function(res){
                if(res.success){
                    alert("병원이 등록되었습니다.");
                    window.location.reload();
                }else{
                    console.log(res.success);
                }
            },
            error:function(err){
                console.log(err);
            }
        });
    });

});
