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
		url: "/ieum/admin/notice",
		type: "GET",
		async: false,
		data: { keyword: keyword, page: 1, sort: sort },
		dataType: "json",
		headers: { 'X-Requested-With': 'XMLHttpRequest' },
		success: function(data) {
			const noDataDiv = $("#noSearchList");
			const noticeTable = $("#noticeList");
			const pagination = $("#pagination");
			noticeTable.empty(); // 기존 목록 제거

			if (data.noticeList.length == 0 && data.topList.length == 0) {
				noticeTable.hide();
				noDataDiv.css('display', 'flex');
				pagination.css('display', 'none');
			} else {
				noticeTable.show();
				noDataDiv.hide();
				pagination.show();
				data.topList.forEach(function(top) {
					const html = `
                    <tr class="notice-item" data-label="${top.nNo}">
									<td class="n-t-td">고정</td>
									<td class="n-t-td">${top.title}</td>
									<td class="n-t-td">${top.uNm}</td>
									<td class="n-t-td">${changeDtFormat(top.nCreated)}</td>
									<td class="n-t-td">${top.nUpdated != null ? changeDtFormat(top.nUpdated) : ''}</td>
									<td class="n-t-td">
											<button class="n-update" onclick="updateNotice(${top.nNo})">수정</button>
											<button class="n-delete" onclick="deleteNotice(${top.nNo})">삭제</button>
										</td>
								</tr>
                `;
					noticeTable.append(html);
				});
				data.noticeList.forEach(function(notice) {
					const html = `
                   <tr class="notice-item" data-label="${notice.nNo}">
										<td class="n-t-td">${notice.nNo}</td>
										<td class="n-t-td">${notice.title}</td>
										<td class="n-t-td">${notice.uNm}</td>
										<td class="n-t-td">${changeDtFormat(notice.nCreated)}</td>
										<td class="n-t-td">${notice.nUpdated != null ? changeDtFormat(notice.nUpdated) : ''}</td>
										<td class="n-t-td">
											<button class="n-update"
												onclick="updateNotice(${notice.nNo})">수정</button>
											<button class="n-delete"
												onclick="deleteNotice(${notice.nNo})">삭제</button>
										</td>
									</tr>
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

function deleteNotice(no) {
	$("#delConfirmModal").show();
	$("#del").data("label", no)
}
function cancelDel() {
	$("#delConfirmModal").hide();
}
function confirmDel() {
	const no = $("#del").data("label");
	const form = document.createElement("form");
	form.method = "POST";
	form.action = "/ieum/admin/notice/delete";

	const input = document.createElement("input");
	input.type = "hidden";
	input.name = "nNo";
	input.value = no;

	form.appendChild(input);
	document.body.appendChild(form);
	form.submit();
}
function updateNotice(no) {
	window.location.href = `/ieum/admin/notice/write?nNo=${no}`
}
function goOther(no) {
	window.location.href = `/ieum/admin/notice?nNo=${no}`
}

function changeDtFormat(dateStr) {
	// "월"과 "," 제거, 공백 기준으로 분리
	const [monthStr, dayStr, yearStr] = dateStr.replace("월", "").replace(",", "").split(" ");

	// 월, 일, 년을 숫자로 변환
	const year = parseInt(yearStr);
	const month = parseInt(monthStr); // 10
	const day = parseInt(dayStr);     // 4

	// Date 객체 생성
	const date = new Date(year, month - 1, day);

	// YYYY-MM-DD 포맷으로 변환
	return date.toISOString().split("T")[0];

}
$(document).ready(function() {
	// 기존 등록 파일 있는 경우 파일명 노출
	const uploadFileNm = $("#uploadFileNm").data('label');
	if (uploadFileNm) showFileNm(uploadFileNm);
	const contextPath = window.location.pathname.split('/');
	$('.notice-item').click(function(e) {
		const no = $(this).data("label");
		if (e.target.tagName != 'BUTTON')
			window.location.href = `/ieum/admin/notice?nNo=${no}`;
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
	})// enter검색
	$("#searchInput").on("keypress", function(e) {
		if (e.which === 13) {
			e.preventDefault();
			renderList();
		}
	});
})