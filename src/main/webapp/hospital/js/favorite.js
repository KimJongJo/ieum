

$(document).on("click", ".fav-btn", function () {
    const btn = $(this);
    const hNo = btn.closest(".share").data("hno");

    $.post("/ieum/favorite/toggle", { hNo })
        .done(function (res) {
            if (res.favorite) {
                btn.addClass("active");
                btn.find("i").removeClass("fa-regular").addClass("fa-solid");
            } else {
                btn.removeClass("active");
                btn.find("i").removeClass("fa-solid").addClass("fa-regular");
            }
        })
        .fail(function (xhr) {
            if (xhr.status === 401) {
                alert("로그인 후 이용해주세요.");
                window.location.href = "/ieum/login";
            } else {
                alert("즐겨찾기 처리 중 오류가 발생했습니다.");
            }
        });
});
