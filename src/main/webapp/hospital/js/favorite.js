
function toggleFavorite(btn, hNo, wrapper = null) {
    $.post("/ieum/favorite/toggle", { hNo })
        .done(function(res) {
            // UI 토글
            btn.toggleClass("active", res.favorite);
            btn.find("i")
               .removeClass("fa-regular fa-solid")
               .addClass(res.favorite ? "fa-solid" : "fa-regular");

            // wrapper 존재 시 data 속성도 업데이트
            if (wrapper) {
                wrapper.data("favorite", res.favorite);
                wrapper.attr("data-favorite", res.favorite);
            }
        })
        .fail(function(xhr) {
            if (xhr.status === 401) {
                alert("로그인 후 이용해주세요.");
                window.location.href = "/ieum/login";
            } else {
                alert("즐겨찾기 처리 중 오류가 발생했습니다.");
            }
        });
}










