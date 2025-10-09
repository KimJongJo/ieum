<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>건강이음 - 공지사항 관리 성공</title>
<script>
const err = '<%=request.getAttribute("err") == null ? "" : request.getAttribute("err")%>';
	// 에러
	if (err && err.trim() !== "") {
		alert(err);
		window.history.back();
	}
</script>
</head>
<body>
</body>
</html>