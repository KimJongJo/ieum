
const regionData = {
	"서울특별시": ["강남구", "강동구", "강북구", "강서구", "관악구", "광진구", "구로구", "금천구",
		"노원구", "도봉구", "동대문구", "동작구", "마포구", "서대문구", "서초구", "성동구",
		"성북구", "송파구", "양천구", "영등포구", "용산구", "은평구", "종로구", "중구", "중랑구"],
	"부산광역시": ["강서구", "금정구", "남구", "동구", "동래구", "부산진구", "북구", "사상구", "사하구",
		"서구", "수영구", "연제구", "영도구", "중구", "해운대구", "기장군"],
	"대구광역시": ["남구", "달서구", "동구", "북구", "서구", "수성구", "중구", "달성군", "군위군"],
	"인천광역시": ["계양구", "남동구", "동구", "미추홀구", "부평구", "서구", "연수구", "중구", "강화군", "옹진군"],
	"광주광역시": ["광산구", "남구", "동구", "북구", "서구"],
	"대전광역시": ["대덕구", "동구", "서구", "유성구", "중구"],
	"울산광역시": ["남구", "동구", "북구", "중구", "울주군"],
	"세종특별자치시": ["세종시"],
	"경기도": ["수원시", "성남시", "의정부시", "안양시", "부천시", "광명시", "평택시", "동두천시",
		"안산시", "고양시", "과천시", "구리시", "남양주시", "오산시", "시흥시", "군포시",
		"의왕시", "하남시", "용인시", "파주시", "이천시", "안성시", "김포시", "화성시",
		"광주시", "양주시", "포천시", "여주시", "연천군", "가평군", "양평군"],
	"강원특별자치도": ["춘천시", "원주시", "강릉시", "동해시", "태백시", "속초시", "삼척시", "홍천군",
		"횡성군", "영월군", "평창군", "정선군", "철원군", "화천군", "양구군", "인제군", "고성군", "양양군"],
	"충청북도": ["청주시", "충주시", "제천시", "보은군", "옥천군", "영동군", "증평군", "진천군", "괴산군", "음성군", "단양군"],
	"충청남도": ["천안시", "공주시", "보령시", "아산시", "서산시", "논산시", "계룡시", "당진시",
		"금산군", "부여군", "서천군", "청양군", "홍성군", "예산군", "태안군"],
	"전라북도": ["전주시", "군산시", "익산시", "정읍시", "남원시", "김제시", "완주군", "진안군",
		"무주군", "장수군", "임실군", "순창군", "고창군", "부안군"],
	"전라남도": ["목포시", "여수시", "순천시", "나주시", "광양시", "담양군", "곡성군", "구례군",
		"고흥군", "보성군", "화순군", "장흥군", "강진군", "해남군", "영암군", "무안군",
		"함평군", "영광군", "장성군", "완도군", "진도군", "신안군"],
	"경상북도": ["포항시", "경주시", "김천시", "안동시", "구미시", "영주시", "영천시", "상주시",
		"문경시", "경산시", "군위군", "의성군", "청송군", "영양군", "영덕군", "청도군",
		"고령군", "성주군", "칠곡군", "예천군", "봉화군", "울진군", "울릉군"],
	"경상남도": ["창원시", "진주시", "통영시", "사천시", "김해시", "밀양시", "거제시", "양산시",
		"의령군", "함안군", "창녕군", "고성군", "남해군", "하동군", "산청군", "함양군", "거창군", "합천군"],
	"제주특별자치도": ["제주시", "서귀포시"]
};


let loading = false;
let endReached = false;
let curPge = 1;
let allPage = 1;


$(document).ready(() => {

	function loadHospitals(page, appendMode = false) {
		if (loading) return;
		loading = true;

		// appendMode가 false면 초기화
		if (!appendMode) {
			$("#hospitalList").empty();
		}

		const keyword = $("#keyword").val();
		const city = $("#city").val();
		const gungu = $("#gungu").val();
		const categoryNo = [];
		$("input[name='hc']:checked")
			.each(function() {
				categoryNo.push($(this).val());
			});

		$.ajax({
			url: "/ieum/hospital/search",
			async: true,
			method: "POST",
			dataType: 'json',
			data: {
				param: JSON.stringify({
					keyword: keyword,
					city: city,
					gungu: gungu,
					categoryNo: categoryNo,
					page: page
				})
			},

			success: function(data) {
				allCnt = data.pageInfo.allCnt;
				curPge = data.pageInfo.curPage;
				allPage = data.pageInfo.allPage;
				$('#allCnt').text(allCnt);
				$("#keywordTxt").text(keyword || '전체');

				if (allCnt === 0 && !appendMode) {
					$("#hospitalList").append(`
					<div class="list-box2">
            <div class="icon2"><i class="fa-solid fa-circle-exclamation"></i></div>
            <span class="t1">검색결과가 없습니다.</span>
        </div>
					`);
				} else {
					data.hospitalDetailDto.forEach(h => {
						
						var imgPath = "/ieum/" + h.filePath + h.fileName
						$("#hospitalList").append(`
                    <div class="list-box" data-hno="${h.hNo}" data-favorite="${h.favorite}">
					<div class="right3">
						<img class="hosf" src="${imgPath}" />
						<div class="infodetail">
							<div class="hos-category">[${h.categoryName}]</div>
							<div class="hos-name">${h.hNm}</div>
							<div class="hos-loca">
								<div class="icon3">
									<i class="fa-solid fa-location-dot"></i>
								</div>
								${h.hAddress}
							</div>
						</div>
					</div>
					<div class="fav">
				<button type="button" class="fav-btn ${h.favorite ? 'active' : ''}">
					<div class="i" >
					<i class="fa${h.favorite ? 's' : 'r'} fa-star"></i>
					</div>
				</button >
			</div >
					</div >
				</div >
						`);
					});

					$("#loadMore").empty();
					$("#goTop").empty();

					if (curPge < allPage) {
						$("#loadMore").append(`
						<div class= "loadmore"> <button class="btn-cir-w">
							더보기<i class="fa-solid fa-chevron-down"></i></button></div> `)
					} else {
						$("#goTop").append(`
					<div class= "loadmore"> <button class="btn-cir-w">
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

	// 초기 로드
	loadHospitals(1);

	//키워드 클릭시 창 지움
	$("#keyword").on("focus", function() {
		$(this).val("");
	});

	// 키워드 입력 시 엔터 막기 & 검색
	$("#keyword").closest("form").on("submit", function(e) {
		e.preventDefault();
		loadHospitals(1);
		// 입력창 포커스 해제
		$("#keyword").blur();
	});

	// 카테고리 체크박스 리셋
	$("#refresh1").on("click", function(e) {
		$("input[name='hc']").prop("checked", false);
		loadHospitals(1);
	});

	// 시/도 옵션 채우기
	$.each(regionData, function(city, gungu) {
		$("#city").append(`< option value = "${city}" > ${city}</option > `);
	});


	// 시/도 선택 시 시군구 옵션 갱신
	$("#city").change(function() {
		const city = $(this).val().trim();
		const $gungu = $("#gungu");

		$gungu.empty().append("<option value=''>시·군·구</option>");

		const gungus = regionData[city];
		if (gungus && gungus.length > 0) {
			$.each(gungus, function(index, gungu) {
				$gungu.append(`< option value = "${gungu}" > ${gungu}</option > `);
			});
		}
	});

	//지역선택 리셋
	$("#refresh2").on("click", function(e) {
		$("#city").val("");
		$("#gungu").val("");
		loadHospitals(1);
	});

	// 필터 변경 이벤트
	$("#city, #gungu, input[name='hc']").on("change keyup", function() {
		loadHospitals(1);
	});


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

	//리스트에서 특정 병원 클릭
	$(document).off("click", ".list-box").on("click", ".list-box", function(e) {
		e.preventDefault(); // a 태그나 기본 동작 막기
		const hNo = $(this).data("hno"); // div에 저장된 병원번호

		$.get("/ieum/hospital/detail",
			{
				hNo: hNo
			})
			.done(function() {
				window.location.href = "/ieum/hospital/detail?hNo=" + hNo;
			})
			.fail(function(err) {
				console.error("병원 선택 get 실패:", err);
				alert("병원 선택에 실패했습니다. 다시 시도해주세요.");
			});

	});

	// 목록 페이지 즐겨찾기
	$(document).on("click", ".fav-btn, .fav-btn *", function(e) {
		e.stopPropagation();
		e.preventDefault();

		const btn = $(this).closest(".fav-btn");
		const listBox = btn.closest(".list-box");
		const hNo = listBox.data("hno");

		toggleFavorite(btn, hNo, listBox); // wrapper 전달
	});

});





