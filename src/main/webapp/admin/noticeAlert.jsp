<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>건강이음 - 공지사항 관리 성공</title>
<script>
	// 실패
	var err = '<%=request.getAttribute("err")%>';
	if (err){
		alert(err);
		window.history.go(-1);
	} else {
		// 성공
		var msg = '<%=request.getAttribute("msg")%>';
			alert(msg + "되었습니다.");
		var hostUrl = window.location.origin;
		let moveUrl = hostUrl + "ieum/admin/notice";
		if (msg == '작성' || msg == '삭제') {
			moveUrl += "?page=1";
		} else {
			console.log("수정");
		}
		window.location.href = moveUrl;
	}
</script>
</head>
<body>
</body>
</html>