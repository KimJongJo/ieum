$(document).ready(function() {
	$("input:radio[name=emoji]").on("change", function() {
		$('.happy-icon').removeClass('happy-select');
		$('.soso-icon').removeClass('soso-select');
		$('.sad-icon').removeClass('sad-select');
		const check = $("input:radio[name=emoji]:checked")[0].id;
		if (check == 'happy') {
			$('.happy-icon').addClass('happy-select');
		}
		else if (check == 'soso') {
			$('.soso-icon').addClass('soso-select');
		}
		else if (check == 'sad') {
			$('.sad-icon').addClass('sad-select');
		}
	})
	function validateDiaryForm() {
		let validYn = true;
		// 감정 선택 체크 (라디오 버튼)
		if ($('input[name="emoji"]:checked').length === 0) {
			alert('오늘의 기분을 선택해주세요.');
			validYn = false;
			return false;
		}
		// 폼 안의 input, textarea 체크
		$('.diary-container form').find('input[name], textarea[name]').each(function() {
			if ($(this).val().trim() === '') { // 비어있으면
				alert($(this).attr('placeholder'));
				$(this).focus();
				validYn = false;
				return false;
			}
		});
		if (validYn) return true;
		return false;
	}

	// 작성 버튼
	$('#writeBtn').click(function(e) {
		e.preventDefault(); // 폼 제출 막기
		if (validateDiaryForm()) {
			$('.diary-container form').submit(); // 모든 검증 통과하면 폼 제출
		}
	});
})