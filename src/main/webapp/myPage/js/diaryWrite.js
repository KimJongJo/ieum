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
		const targetDt = $("#targetDt").text();
		let validYn = true;
		// 현재 날짜 데이터 존재 유무 확인
		$.ajax({
			url: '/ieum/myPage/diary/check',
			type: 'post',
			async: false,
			data: { date: targetDt },
			success: function(res) {
				if (res.exists) {
					alert("오늘 이미 작성된 다이어리가 있습니다.");
					validYn = false;
					return false;
				}
			}, error: function() {
				alert("서버 통신 중 오류가 발생했습니다.");
				validYn = false;
			}
		})
		// 감정 선택 체크 (라디오 버튼)
		if ($('input[name="emoji"]:checked').length === 0) {
			alert('기분을 선택해주세요.');
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
		if (!validYn) return false;
		return true;
	}

	// 작성 버튼
	$('#writeBtn').click(function(e) {
		e.preventDefault(); // 폼 제출 막기
		if (validateDiaryForm()) {
			$('.diary-container form').submit(); // 모든 검증 통과하면 폼 제출
		}
	});
})