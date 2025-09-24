$(document).ready(function() {
	$(document).on("change", function() {
		$('.happy-icon').removeClass('happy-select');
		$('.soso-icon').removeClass('soso-select');
		$('.sad-icon').removeClass('sad-select');
		const check = $("input:radio[name=emoji]:checked")[0].id;
		// console.log("선택표정", check);
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
})