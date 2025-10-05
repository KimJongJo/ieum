<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>건강이음 - 공지사항 관리 성공</title>
<script>
const err = '<%=request.getAttribute("err") == null ? "" : request.getAttribute("err")%>';
const msg = '<%=request.getAttribute("msg") == null ? "" : request.getAttribute("msg")%>';
const no = '<%=request.getAttribute("no") == null ? "" : request.getAttribute("no")%>';
	// 에러
	if (err && err.trim() !== "") {
		alert(err);
		window.history.back();
	}
	// 완료 
	if (msg && msg.trim() !== "") {
		alert(msg + "되었습니다.");

		const hostUrl = window.location.origin;
		let moveUrl = hostUrl + "/ieum/admin/notice";

		if (msg === "작성" || msg === "삭제") {
			moveUrl += "?page=1";
		} else if (msg === "수정") {
			moveUrl += `?nNo=${no}`;
		}

		window.location.href = moveUrl;
	}
</script>
</head>
<body>
</body>
</html>