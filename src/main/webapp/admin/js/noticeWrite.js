$(document).ready(function() {
	$("#noticeFile").on("change", function(e) {
		var fileName = e.target.files[0].name;
		console.log(fileName);
		$(".upload-file-name").text(fileName);
		$(".upload-file-name").show();
	});
});