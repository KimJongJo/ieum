<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>건강이음 - 다이어리 작성</title>
<script>
	var msg = '<%= request.getAttribute("msg") %>';
	alert(msg);
	var contextPath = '<%= request.getContextPath() %>';
    var hostUrl = window.location.origin;
   	let moveUrl = hostUrl + contextPath + "/myPage/diary";
   	if (msg == '작성되었습니다.') moveUrl += "?page=1";
   	console.log("Mov", moveUrl);
   	window.location.href = moveUrl;
</script>
</head>
<body>
</body>
</html>