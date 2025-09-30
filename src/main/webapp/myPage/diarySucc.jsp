<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>건강이음 - 다이어리 작성</title>
<script>
	var msg = '<%= request.getAttribute("msg") %>';
	alert(msg + "되었습니다.");
	var contextPath = '<%= request.getContextPath() %>';
    var hostUrl = window.location.origin;
   	let moveUrl = hostUrl + contextPath + "/myPage/diary";
   	if (msg == '작성' || msg=='삭제'){
   		moveUrl += "?page=1";
   	} else {
   		console.log("수정");
   	} 
   	window.location.href = moveUrl;
</script>
</head>
<body>
</body>
</html>