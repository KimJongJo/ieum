$(document).ready(function() {
	const contextPath = window.location.pathname.split('/');
	$('.notice-item').click(function(e) {
		console.log(e.target.tagName);
		if (e.target.tagName != 'button' && e.target.tagName != 'input')
			window.location.href = `${contextPath[0]}/${contextPath[1]}/admin/notice?nNo=1`;
	})
})