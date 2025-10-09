function searchKeyword() {
	const keyword = $("#searchInput").val();
	location.href = `/ieum/search?keyword=${keyword}`;
}
function goHosDetail(hNo) {
	$.post("/ieum/hospital/detail", {
    action: "goHosDetail",
    hNo: hNo
})
.done(function() {
    window.location.href = "/ieum/hospital/detail";
})
.fail(function(xhr) {
    console.error("요청 실패:", xhr.status);
    alert("서버 요청 중 오류가 발생했습니다.");
});
			
}

function goNoticeDetail(nNo) {
	location.href=`/ieum/notice?nNo=${nNo}`
}
function choiceHos(idx) {
	showPopup(hospitalList[idx]);
}
// 지도
let hospitalList = [];
let map;
let currentOverlay = null; // ✅ 현재 열린 팝업 저장용 전역 변수

function choiceHos(idx) {
	showPopup(hospitalList[idx]);
}

// 지도
function setMap(latitude, longitude) {
    const mapContainer = document.getElementById('map');
    const mapOption = {
        center: new kakao.maps.LatLng(latitude, longitude),
        level: 5
    };
    map = new kakao.maps.Map(mapContainer, mapOption);
	const imageSrc = 'https://maps.google.com/mapfiles/ms/icons/red-dot.png';

	const markerImage = new kakao.maps.MarkerImage(
	    imageSrc,
	    new kakao.maps.Size(32, 32)
	);
    // 사용자 현위치 마커
    const userMarker = new kakao.maps.Marker({
        position: new kakao.maps.LatLng(latitude, longitude),
        map: map,
        title: "현재위치",
        image: markerImage 
    });

    mapContainer.style.display = "block";
    map.relayout();

    // 근처 병원 리스트
    $.ajax({
        url: '/ieum/map',
        type: 'GET',
        data: { userLocY: latitude, userLocX: longitude },
        success: function(res) {
            const listArea = $("#mapHosList");
            listArea.empty();
            hospitalList = []; // ✅ 기존 리스트 초기화
            let html = '';

            res.forEach((mapData, index) => {
				hospitalList.push(mapData);
                html += `<div class="choice-rectangle" onclick="choiceHos(${index})">${mapData.hNm}</div>`;

                // 지도에 마커 표시
                new kakao.maps.Marker({
                    position: new kakao.maps.LatLng(
                        mapData.lat || latitude,
                        mapData.lng || longitude
                    ),
                    map: map,
                    title: mapData.hNm,
                    desc: mapData.hNo
                });
            });
            listArea.append(html);

            // --- 첫 번째 병원 팝업 자동 표시 ---
            showPopup(res[0]);
        },
        error: function(e) {
            console.log("근처 병원 조회 오류", e);
        }
    });
}

function showPopup(info) {
    if (!info || !info.hNo) return;

    // ✅ 기존 팝업이 있으면 닫기
    if (currentOverlay) {
        currentOverlay.setMap(null);
        currentOverlay = null;
    }

    $.ajax({
        url: '/ieum/map/detail',
        type: 'GET',
        data: { hNo: info.hNo },
        success: function(res) {
            const hospital = res.mapHosInfo;
            // 팝업 HTML
            const content = document.createElement('div');
            content.className = 'custom-overlay';
            content.innerHTML = `
                <div class="map-popup">
                    <button class="close-btn">✕</button>
                    <div class="map-hospital-info">
                        <div class="title">${hospital.hNm}</div>
                        <div class="tel">${hospital.hTel || ""}</div>
                        <div class="map-text address">${hospital.hAddress || ""}</div>
                        <div class="transfer">${hospital.transferInfo || ""}</div>
                        <div>
                            <div class="map-text bold">진료안내</div>
                            <div class="map-text">월요일~금요일 : 오전9시~오후6시</div>
                            <div class="map-text">점심시간 : 12시~오후1시</div>
                            <div class="map-text red">${hospital.holidayInfo || ""}</div>
                        </div>
                    </div>
                </div>
            `;

            // CustomOverlay 생성
            const customOverlay = new kakao.maps.CustomOverlay({
                position: new kakao.maps.LatLng(info.lat, info.lng),
                content: content,
                yAnchor: 1,
                clickable: true
            });

            customOverlay.setMap(map);
            currentOverlay = customOverlay; // ✅ 현재 팝업 저장

            // 닫기 버튼 이벤트
            content.querySelector('.close-btn').addEventListener('click', function() {
                customOverlay.setMap(null);
                currentOverlay = null;
            });
        },
        error: function(e) {
            console.log("병원 상세 조회 오류", e);
        }
    });
}





// url 파라미터 넘기기
function addSearchParams(latitude, longitude) {
	const url = new URL(window.location.href);
	if (!url.searchParams.has("lat") && !url.searchParams.has("lon")) {
		url.searchParams.set("lat", latitude);
		url.searchParams.set("lon", longitude);
		window.location.href = url;
	}
}
function success({ coords }) {
	const latitude = coords.latitude;   // 위도
	const longitude = coords.longitude; // 경도
	//	console.log(`사용자 현위치: 위도:${latitude}, 경도:${longitude}, 위치반환시간:${new Date(timestamp).toLocaleString()}`);
	// 사용자 현위치 좌표
	setMap(latitude, longitude);
}

function error(err) {
	alert("위치 정보를 가져올 수 없습니다.\n주변 병원 검색을 위해 위치 접근을 허용해주세요.");
	console.log("위치 미동의", err)
	// 호서대 벤처타워 좌표
	setMap('37.472227', '126.885977');
}

function getUserLocation() {
	navigator.geolocation.getCurrentPosition(success, error);
}

$(document).ready(function() {
	// 키워드 검색
	$("#searchBtn").on("click", function() {
		searchKeyword();
	})
	$("#searchInput").on("keypress", function(e) {
		if (e.which === 13) {
			e.preventDefault();
			searchKeyword();
		}
	});
	// 사용자 현위치 조회
	getUserLocation();
	// 추천병원카드 스크롤
	const hospitalList = $(".hospital-list");
	const leftBtn = $(".hospital-btn-left");
	const rightBtn = $(".hospital-btn-right");

	const scrollStep = 218; // 카드 + 간격 너비
	leftBtn.on("click", function() {
		hospitalList.animate(
			{ scrollLeft: hospitalList.scrollLeft() - scrollStep },
			400
		);
	});

	rightBtn.on("click", function() {
		hospitalList.animate(
			{ scrollLeft: hospitalList.scrollLeft() + scrollStep },
			400
		);
	});
	// 캘린더
	var calendar = new FullCalendar.Calendar(document.getElementById('fc'), {
		selectable: true,
		headerToolbar: false,
		initialView: 'dayGridMonth',
		// 데이터 가져오기
		events: function(fetchInfo, successCallback, failureCallback) {
			// fetchInfo.start, fetchInfo.end -> FullCalendar가 보내는 시작/끝 날짜
			const start = fetchInfo.startStr; // "2025-09-01"
			const end = fetchInfo.endStr;     // "2025-09-30"
			// 1. 다이어리 이벤트 가져오기
			$.ajax({
				url: '/ieum/myPage/diary/event',
				type: 'GET',
				data: { start: start, end: end },
				success: function(res) {
					successCallback(res);
				},
				error: function(e) {
					console.log("캘린더 - 다이어리 조회 오류", e);
					failureCallback(e);
				}
			});
			// 2. 예약 이벤트 가져오기
			$.ajax({
				url: '/ieum/myPage/reservation/event',
				type: 'GET',
				data: { start: start, end: end },
				success: function(res) {
					successCallback(res);
				},
				error: function(e) {
					console.log("캘린더 - 예약내역 조회 오류", e);
					failureCallback(e);
				}
			});
		},
		// n년 n월 형식
		titleFormat: function(arg) {
			const year = arg.date.year;
			const month = arg.date.month + 1; // 0부터 시작하므로 +1
			return year + '년 ' + month + '월';
		},

		//요일column 한글로
		dayHeaderContent: function(arg) {
			const day = arg.date.getDay();
			const days = ['일', '월', '화', '수', '목', '금', '토'];
			return days[day];

		},
		dateClick: function(info) {
			const clickedDate = info.date;
			const today = new Date();
			if (clickedDate <= today) {
				location.href = "/ieum/myPage/diary?page=1"
			}
			else if (clickedDate > today) {
				location.href = "/ieum/myPage/reservation/list"
			}
			//			
		}
	});
	calendar.render();
});