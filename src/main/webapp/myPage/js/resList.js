
//다가오는 예약 캐러셀
const container = document.querySelector("#hospitalCarousel");
const cards = Array.from(container.querySelectorAll(".list-center"));
const btnLeft = document.querySelector("#moveLeft");
const btnRight = document.querySelector("#moveRight");

let currentIndex = 0;

// 카드 폭 계산
const cardWidth = cards[0].offsetWidth;
const visibleCount = Math.floor(container.clientWidth / cardWidth);
const maxIndex = Math.max(0, cards.length - visibleCount);

// 버튼 상태 업데이트
function updateButtons() {
	btnLeft.disabled = currentIndex === 0;
	btnRight.disabled = currentIndex >= maxIndex;
}

// 스크롤 이동
function scrollToIndex(i) {
	currentIndex = Math.max(0, Math.min(maxIndex, i));
	container.scrollTo({ left: cardWidth * currentIndex, behavior: "smooth" });
	updateButtons();
}

// 버튼 클릭 이벤트
btnLeft.addEventListener("click", () => scrollToIndex(currentIndex - 1));
btnRight.addEventListener("click", () => scrollToIndex(currentIndex + 1));

// 초기 상태
updateButtons();



//지난 예약 검색 post
$(document).ready(function() {

	//초기 값
	loadRecListPage(1);

	//페이지 버튼
	$(document).on("click", ".move-page", function() {
		const page = $(this).val();
		loadRecListPage(page);
	});

	//이전버튼
	$(document).on("click", ".previous", function() {
		const curpage = parseInt($(".cur-page").attr("value"));
		if (curpage > 1) loadRecListPage(curpage - 1);
	});

	//다음버튼	
	$(document).on("click", ".next-page", function() {
		const curPage = parseInt($(".cur-page").attr("value"));
		const allPage = parseInt($("#pagination").data("allPage"));
		if (curPage < allPage) loadRecListPage(curPage + 1);
	});

	//검색버튼
	$("#searchBtn").on("click", function() {
		loadRecListPage(1);
	});

	// Enter 키로도 검색 가능
	$("#keyword").on("keypress", function(e) {
		if (e.which === 13) {
			loadRecListPage(1);
		}
	});


	//ajax로 페이지, 검색결과 가져오기
	function loadRecListPage(page) {
		const keyword = $("#keyword").val().trim();
		const sort = $("#sort").val() || "";

		console.log(keyword);

		$.ajax({
			type: "POST",
			url: "/ieum/myPage/reservation/list",
			data: {
				keyword: keyword,
				sort: sort,
				page: page
			},
			dataType: "json",
			success: function(data) {
				renderList(data.recRes);
				renderPagination(data);
			},
			error: function() {
				alert("데이터 로딩 중 오류가 발생하였습니다.")
			}

		});
	}

	//목록 렌더링
	function renderList(list) {
		const container = $("#recResList-container");
		container.empty();

		if (list.length === 0) {
			container.append(`
		<div class="list4">
							<div class="no">
								<div class="icon2">
									<i class="fa-solid fa-circle-exclamation"></i>
								</div>
								<span class="t2">지난 예약이 없습니다.</span>
							</div>
							<div>
								<button class="btn-cir-w">예약하러 가기</button>
							</div>
						</div>
		
		`);
			return;
		}

		list.forEach(rec => {
			container.append(`
			<div class="list2" id="recList" data-rno="${rec.rNo}" data-rstatus="${rec.rStatus}" data-hno="${rec.hNo}">
								<div class="l3">
									<table class="date">
										<tr>
											<td class="gray">${rec.rDate}</td>
											<td class="gray1">${rec.rDay}</td>
										</tr>
									</table>
									<div class="star">
										<button type="button"
														class="fav-btn ${rec.favorite ? 'active' : ''}">
														<div class="i">
															<i class="fa${rec.favorite ? 's' : 'r'} fa-star"></i>
														</div>
													</button>
									</div>
								</div>
								<div class="l4">

									<div class="left2">
										<table class="t">
											<tr>
												<td class="hi"><span class="hosIcon2"> <i
														class="fa-regular fa-calendar-plus"></i></span></td>
												<td class="hname">${rec.hNm}</td>
											</tr>
										</table>
										<table class="t2">
											<tr>
												<td class="line"></td>
												<td class="dname">
												${rec.username}<span>상담사</span></td>
												<td class="coun">첫번째 상담</td>
											</tr>
										</table>
									</div>
									<div class="right2">
									<div class="resAgian">
										<button class="btn-cir-w" type="button">병원예약</button>
										</div>
										<div class="recResDetail">
										<button class="btn-cir-w" type="button">예약확인</button>
										</div>
									</div>
								</div>
							</div>
		`);
		});

	}

	//페이지네이션
	function renderPagination(pageData) {
		const pagination = $("#pagination");
		pagination.empty();
		pagination.attr("data-total", pageData.allPage);

		//이전
		pagination.append(`<button class="page previous" type="button"><i class="fa-solid fa-angle-left"></i></button>`)

		//페이지번호				
		for (let i = pageData.startPage; i <= pageData.endPage; i++) {
			if (i === pageData.curPage) {
				pagination.append(`
				<button value="${i}" class="cur-page" type="button">${i}</button>
				`)
			} else {
				pagination.append(`
				<button value="${i}" class="move-page" type="button">${i}</button>
			`)
			}
		}

		//다음
		pagination.append(`<button class="page next-page" type="button"><i class="fa-solid fa-angle-right"></i></button>`)
	}


	//다가오는 예약 상세페이지 이동
	$(document).on("click", ".lbtb", function() {
		const parent = $(this).closest(".list1");
		const rNo = parent.data("rno");
		const rStatus = parent.data("rstatus");

		$.post("/ieum/myPage/reservation/detail",
			{
				action: "getComResDetail",
				rNo: rNo,
				rStatus: rStatus
			})
			.done(function() {
				window.location.href = "/ieum/myPage/reservation/detail";
			})
			.fail(function(err) {
				console.error("실패", err);
				alert("예약 조회에 실패했습니다.");
			});
	});

	//지난 예약 상세페이지 이동
	$(document).on("click", ".recResDetail", function() {
		const parent = $(this).closest(".list2");
		const rNo = parent.data("rno");
		const rStatus = parent.data("rstatus");

		$.post(
			"/ieum/myPage/reservation/detail",
			{
				action: "getRecResDetail",
				rNo: rNo,
				rStatus: rStatus
			})
			.done(function() {
				window.location.href = "/ieum/myPage/reservation/detail";
			})
			.fail(function(err) {
				console.error("실패", err);
				alert("예약 조회에 실패했습니다.");
			});

	});

	//다시 예약
	$(document).off("click", ".resAgian").on("click", ".resAgian", function(e) {
		e.preventDefault(); // a 태그나 기본 동작 막기
		const parent = $(this).closest(".list2");
		const hNo = parent.data("hno");

		$.post("/ieum/hospital/detail",
			{
				action: "goHosDetail",
				hNo: hNo
			})
			.done(function() {
				window.location.href = "/ieum/hospital/detail?hNo=" +hNo;
			})
			.fail(function(err) {
				console.error("병원 선택 POST 실패:", err);
				alert("병원 선택에 실패했습니다. 다시 시도해주세요.");
			});

	});

	//예약취소 모달
	$(document).on("click", ".lbt-cancel", function(e) {
		e.preventDefault();
		const rNo = $(this).data("rno");
		$("#deleteRes").data("rno", rNo).show();
	});

	//모달 닫기
	$("#xBtn, #modalKeepRes").on("click", function() {
		$("#deleteRes").hide();
	});

	//예약취소
	$(document).off("click", "#modalCancelRes").on("click", "#modalCancelRes", function(e) {
		e.preventDefault(); // a 태그나 기본 동작 막기
		const parent = $(".list1");
		const rNo = parent.data("rno");
		$.post("/ieum/myPage/reservation/cancel", {
			rNo: rNo
		})
			.done(function() {
				window.location.href = "/ieum/myPage/reservation/cancel";
			})
			.fail(function() {
				alert("예약 취소 실패");
			});
	});


});





















