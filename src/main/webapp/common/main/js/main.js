function formSubmit(url, paramName, paramValue) {
	const form = document.createElement("form");
	form.method = "POST";
	form.action = url;

	const input = document.createElement("input");
	input.type = "hidden";
	input.name = paramName;
	input.value = paramValue;

	form.appendChild(input);
	document.body.appendChild(form);
	form.submit();
}

function goHosDetail(hNo) {
	formSubmit("/ieum/hospital/detail", "hNo", hNo);
}

function goNoticeDetail(nNo) {
	formSubmit("/ieum/notice", "nNo", nNo);
}
// 지도
function success({ coords, timestamp }) {

	const latitude = coords.latitude;   // 위도
	const longitude = coords.longitude; // 경도
	console.log(`사용자 현위치: 위도:${latitude}, 경도:${longitude}, 위치반환시간:${new Date(timestamp).toLocaleString()}`);


	const mapContainer = $("#map");

	// 사용자 현위치를 중심으로 설정
	const mapOption = {
		center: new kakao.maps.LatLng(latitude, longitude),
		level: 4
	};

	// 지도 생성
	const map = new kakao.maps.Map(mapContainer, mapOption);

	// 사용자 현위치에 마커 표시
	const marker = new kakao.maps.Marker({
		position: new kakao.maps.LatLng(latitude, longitude),
		map: map
	});

	// 병원 정보팝업
	const infowindow = new kakao.maps.InfoWindow({
		content: `
        <div class="map-popup">
					<div class="map-hospital-info">
						<div class="title">${mapInfo.hNm}</div>
						<div class="tel">${mapInfo.hTel}</div>
						<div class="map-text address">${mapInfo.hAddress}</div>
						<div class="transfer">${mapInfo.transferInfo}</div>
						<div>
							<div class="map-text">진료안내</div>
							<div class="map-text">월요일~금요일 : 오전9시~오후6시</div>
							<div class="map-text">점심시간 : 12시~오후1시</div>
							<div class="map-text red">${mapInfo.holidayInfo}</div>
						</div>
					</div>
				</div>
        `
	});
	infowindow.open(map, marker);
}

function error(err) {
	console.log("위치 정보를 가져올 수 없습니다. 위치 접근을 허용해주세요.");
}

function getUserLocation() {
	navigator.geolocation.getCurrentPosition(success, error);
}

$(document).ready(function() {
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
});