<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>건강이음 - 공지사항 관리 성공</title>
<script>
const loginErr = '<%=request.getAttribute("loginErr") == null ? "" : request.getAttribute("loginErr")%>';
const redirect = '<%= request.getAttribute("redirect") == null ? "" : request.getAttribute("redirect")%>';
const err = '<%=request.getAttribute("err") == null ? "" : request.getAttribute("err")%>';
	// 에러
	if (loginErr && loginErr.trim() !== "" ){
		alert("로그인이 필요한 페이지입니다.");
		window.location.href = '/ieum/login?redirect=' + redirect;
	}
	if (err && err.trim() !== "") {
		alert(err);
		window.history.back();
	}
</script>
</head>
<body>
</body>
</html>