function validate() {
	let validYn = true;
	$("#noticeWriteForm").find('input[name=title], textarea[name=content]').each(function() {
		if ($(this).val().trim() === '') { // 비어있으면
			alert($(this).attr('placeholder'));
			$(this).focus();
			validYn = false;
			return false;
		}
	})
	return validYn;
}
function showFileNm(nm) {
	$("#uploadFileNm").text(nm);
	$("#uploadFileNm").show();
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
		$("#noticeWriteForm").attr("action", "/ieum/admin/notice/write"); // 서블릿 URL 지정
		if (validate()) $("#noticeWriteForm").submit();
	})
	
	// 
})