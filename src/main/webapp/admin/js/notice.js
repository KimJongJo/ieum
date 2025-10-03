function validate(nNo) {
	let validYn = true;
	$("#noticeWriteForm").find('input[name=title], textarea[name=content]').each(function() {
		if ($(this).val().trim() === '') { 
			alert($(this).attr('placeholder'));
			$(this).focus();
			validYn = false;
			return false;
		}
	})
	const fileInput = $("#noticeFile")[0];
    const fileSelected = fileInput.files.length > 0; 
    // 파일이 선택되지 않은 경우
    if (!fileSelected & validYn & !nNo) {
        alert("파일을 선택해주세요.");
        return false;
    }
	return validYn;
}
function showFileNm(nm) {
	$("#uploadFileNm").text(nm);
	$("#uploadFileNm").show();
}
function renderList() {
	const url = new URL(window.location.href);
	url.searchParams.set('page', 1);
	window.history.replaceState({}, '', url);
	const sort = $('.notice-select').val();
	const keyword = $("#searchInput").val().trim();
	$.ajax({
		url: "/ieum/myPage/notice",
		type: "GET",
		async: false,
		data: { keyword: keyword, page: 1, sort: sort },
		dataType: "json",
		headers: { 'X-Requested-With': 'XMLHttpRequest' },
		success: function(data) {
			const tbody = $("#diaryListBody");
			const noDataDiv = $("#noSearchList");
			const noticeTable = $("#diaryList");
			const pagination   = $("#pagination");
			 tbody.empty(); // 기존 목록 제거

			if (data.diaryList.length === 0) {
				noticeTable.hide();
				noDataDiv.css('display', 'flex');
				pagination.css('display', 'none');
			} else {
				noticeTable.show();
				noDataDiv.hide();
				pagination.show();
				data.noticeList.forEach(function(diary) {
					const html = `
                    <tr class="notice-item">
							<td class="n-t-td">93</td>
							<td class="n-t-td">구로구 병원 휴진일 공고</td>
							<td class="n-t-td">구로구병원</td>
							<td class="n-t-td">2025-09-05</td>
							<td class="n-t-td">2025-09-06</td>
							<td class="n-t-td"><button class="n-update">수정</button>
								<button class="n-delete">삭제</button></td>
						</tr>
                `;
					tbody.append(html);
				});
			}
		},
		error: function(xhr, status, error) {
			console.error("검색 실패:", error);
			alert("검색 중 오류가 발생했습니다.");
		}
	});
}
function searchNotice() {
	renderList();
}


function sortNotice(selectElement) {
	renderList();
}
$(document).ready(function() {
	// 기존 등록 파일 있는 경우 파일명 노출
	const uploadFileNm = $("#uploadFileNm").data('label');
	if (uploadFileNm) showFileNm(uploadFileNm);
	const contextPath = window.location.pathname.split('/');
	$('.notice-item').click(function(e) {
		if (e.target.tagName != 'button' && e.target.tagName != 'input')
			window.location.href = `${contextPath[0]}/${contextPath[1]}/admin/notice?nNo=1`;
	})
	$("#noticeFile").on("change", function(e) {
		showFileNm(e.target.files[0].name);
	});
	$("#writeBtn").click(function(e) {
		// 작성 유효성 체크
		e.preventDefault();
		const form = $("#noticeWriteForm")
		form.attr("action", "/ieum/admin/notice/write"); // 서블릿 URL 지정
		const nNo = $(this).data('label');
		if (nNo) {
			const input = document.createElement("input");
			input.type = "hidden";
			input.name = "nNo";
			input.value = nNo;
			form.append(input);
		}
		if (validate(nNo)) form.submit();
	})
})