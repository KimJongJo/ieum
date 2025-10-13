function goOther(no) {
	window.location.href = `/ieum/notice?nNo=${no}`
}
function renderList(page) {
	const url = new URL(window.location.href);
	url.searchParams.set('page', page);
	window.history.replaceState({}, '', url);
	const sort = $('.notice-select').val();
	const keyword = $("#searchInput").val().trim();
	$.ajax({
		url: "/ieum/notice",
		type: "GET",
		async: false,
		data: { keyword: keyword, page: page, sort: sort },
		dataType: "json",
		headers: { 'X-Requested-With': 'XMLHttpRequest' },
		success: function(data) {
			const noDataDiv = $("#noSearchList");
			const noticeTable = $("#noticeList");
			const paginationDiv = $("#pagination");
			const pageInfo = data.pageInfo;
			$('.notice-select').val(data.sort || 'none');
			$("#searchInput").val(data.keyword);
			$("#noticeCnt").text(data.noticeList.length + data.topList.length);
			noticeTable.empty(); // 기존 목록 제거
			if (data.noticeList.length == 0 && data.topList.length == 0) {
				noticeTable.hide();
				noDataDiv.show();
				noDataDiv.css('display', 'flex');
				paginationDiv.hide();
			} else {
				paginationDiv.empty(); // 기존 페이징 제거
				let paginationHtml = "";
				// 이전 버튼
				if (pageInfo.curPage > 1) {
					paginationHtml += `<button onclick="renderList(${pageInfo.curPage - 1})">&lt;</button>`;
				}

				// 페이지 번호 버튼들
				for (let pageNum = pageInfo.startPage; pageNum <= pageInfo.endPage; pageNum++) {
					if (pageNum <= pageInfo.allPage) {
						const activeClass = pageNum === pageInfo.curPage ? "active" : "";
						paginationHtml += `<button class="${activeClass}" onclick="renderList(${pageNum})">${pageNum}</button>`;
					}
				}

				// 다음 버튼
				if (pageInfo.curPage < pageInfo.endPage) {
					paginationHtml += `<button onclick="renderList(${pageInfo.curPage + 1})">&gt;</button>`;
				}
				paginationDiv.append(paginationHtml);
				noticeTable.show();
				paginationDiv.show();
				noDataDiv.hide();
				data.topList.forEach(function(top) {
					// 확장자 추출 및 소문자 변환
					const ext = top.fileName ? top.fileName.split('.').pop().toLowerCase() : '';

					// 이미지 경로 설정
					const imgSrc = (ext === 'jpg' || ext === 'jpeg' || ext === 'png')
						? `/ieum/${top.filePath}/${top.fileName}`
						: `/ieum/img/noticeDefault.png`;

					// HTML 생성
					const html = `
    <a href="/ieum/notice?nNo=${top.nNo}">
      <div class="notice-list">
        <img class="notice-img" src="${imgSrc}">
        <div class="notice-item">
          <div class="notice-title-row">
            <span class="notice-title">${top.title}</span>
            <div class="top-notice">공지</div>
          </div>
          <span class="notice-content content">${top.content}</span>
          <span class="notice-content date">게시일 ${top.nCreated}</span>
        </div>
      </div>
    </a>
  `;

					noticeTable.append(html);
				});

				data.noticeList.forEach(function(notice) {
					// 확장자 추출 및 소문자 변환
					const ext = notice.fileName ? notice.fileName.split('.').pop().toLowerCase() : '';

					// 이미지 경로 설정
					const imgSrc = (ext === 'jpg' || ext === 'jpeg' || ext === 'png')
						? `/ieum/${notice.filePath}/${notice.fileName}`
						: `/ieum/img/noticeDefault.png`;

					// HTML 생성
					const html = `
    <a href="/ieum/notice?nNo=${notice.nNo}">
      <div class="notice-list">
        <img class="notice-img" src="${imgSrc}">
        <div class="notice-item">
          <div class="notice-title-row">
            <span class="notice-title">${notice.title}</span>
          </div>
          <span class="notice-content content">${notice.content}</span>
          <span class="notice-content date">게시일 ${notice.nCreated}</span>
        </div>
      </div>
    </a>
  `;

					noticeTable.append(html);
				});

			}
		},
		error: function(xhr, status, error) {
			console.error("검색 실패:", error);
			alert("검색 중 오류가 발생했습니다.");
		}
	});
}

$(document).ready(function() {
	// URL에서 'keyword' 파라미터 값을 가져오기
	const params = new URLSearchParams(window.location.search);
	const keyword = params.get('keyword');
	// keyword가 존재하면 검색창(input)에 입력
	if (keyword) {
		const searchInput = document.querySelector('#searchInput'); // 검색창 id에 맞게 변경
		if (searchInput) $("#searchInput").val(decodeURIComponent(keyword));
	}
	// enter검색
	$("#searchInput").on("keypress", function(e) {
		if (e.which === 13) {
			e.preventDefault();
			renderList(1);
		}
	});
})