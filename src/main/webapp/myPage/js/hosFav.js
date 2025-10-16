let loading = false;
let endReached = false;
let curPge = 1;
let allPage = 1;
function delFav(no) {
	const scrollPos = $(window).scrollTop();
	console.log("scroll", scrollPos);
	 $.post("/ieum/favorite/toggle", { hNo: no })
        .done(function(res) {
            // 리스트 재조회
            loadHospitals(1, false);
            // 재조회 완료 후 스크롤 위치 복원
            $(document).one("ajaxStop", function() {
                $(window).scrollTop(scrollPos);
            });
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
function loadHospitals(page = 1, appendMode) {
	if (loading) return;
	loading = true;

	// appendMode가 false면 초기화
	if (!appendMode) {
		$("#hospitalList").empty();
	}

	$.ajax({
		url: "/ieum/hosFavorite",
		async: true,
		method: "POST",
		dataType: 'json',
		data: { page: page },
		success: function(data) {
			allCnt = data.pageInfo.allCnt;
			curPge = data.pageInfo.curPage;
			allPage = data.pageInfo.allPage;
			if (allCnt === 0 && !appendMode) {
				$("#hospitalList").append(`
					<div class="list-box2">
            <div class="icon2"><i class="fa-solid fa-circle-exclamation"></i></div>
            <span class="t1">즐겨찾기 한 병원이 없습니다.</span>
        </div>
					`);
			} else {
				data.favList.forEach(fav => {
					const locaHtml = fav.transferInfo ? `
						<div class="hos-loca">
								<div class="icon3">
									<i class="fa-solid fa-bus"></i>
								</div>
								${fav.transferInfo}
							</div>` : '';
					$("#hospitalList").append(`
                    <div class="list-box" data-hno="${fav.hNo}">
					<div class="right3">
						<img class="hosf" src="/ieum/${fav.hosImgFilePath}/${fav.hosImgFileName}" />
						<div class="infodetail">
							<div class="hos-category">${fav.categoryName}</div>
							<div class="hos-name">${fav.hNm}</div>
							${locaHtml}
						</div>
					</div>
					<div class="fav">
				<button type="button" class="fav-btn ${fav ? 'active' : ''}" onclick="delFav(${fav.hosNo})">
					<div class="i" >
					<i class="fa${fav ? 's' : 'r'} fa-star"></i>
					</div>
				</button >
			</div >
				</div>
				</div>
                `);
				});

				$("#loadMore").empty();
				$("#goTop").empty();

				if (curPge < allPage) {
					$("#goTop").append(`
					<div class= "loadmore"> <button class="btn-cir-w">
						맨위로<i class="fa-solid fa-angle-up"></i></button></div>
						`)
					$("#loadMore").append(`
					<div class="loadmore"><button class="btn-cir-b">
           				 더보기<i class="fa-solid fa-chevron-down"></i></button></div>`)
				} else {
					$("#goTop").append(`
					<div class="loadmore"><button class="btn-cir-w">
           				 맨위로<i class="fa-solid fa-angle-up"></i></button></div>
					`)
				}
			}

			loading = false;
		},
		error: function(err) {
			console.log(err);
			loading = false;
		}
	});
}

$(document).ready(() => {

	// 초기 로드
	loadHospitals(1, false);

	//더보기 버튼
	$("#loadMore").on("click", function() {
		if (curPge < allPage) {
			loadHospitals(curPge + 1, true);
		}
	});

	//맨위로 버튼
	$("#goTop").on("click", function() {
		$('html, container').animate({ scrollTop: 0 }, 'slow');
	});

});





