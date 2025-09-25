<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200&icon_names=keyboard_arrow_down" />
    <link rel="stylesheet" href="./css/resContent.css" />
    <title>resContent</title>
</head>
<body>
<div class="container">
        <div class="t1">아래 내용이 맞는지 확인해주세요</div>
        <div class="h-box">
            <span class="h-name">구로구 보건소</span>
            <table class="timedate">
                <tr>
                    <td class="ta1">일정</td>
                    <td class="ta1">2025-09-07</td>
                    <td class="ta1">오후</td>
                    <td class="ta1">3:00</td>
                </tr>
            </table>
        </div>

        <div class="user-box">
            <span class="t1">예약자 정보</span>
            <div class="u1">
                <div class="u2">
                    <span class="uname">임지혜</span>
                    <span class="utel">010-1234-1234</span>
                </div>
                <button type="button" class="ubt1">변경</button>
            </div>
            <div class="line"></div>
        </div>

        <div class="councon">
            <div class="conbox">
                <div class="c6">
                    <span class="t1">상담내용</span>
                </div>
                <button type="button" class="ubt1">변경</button>
            </div>
            <div class="c1"></div>
        </div>

        <div class="act">
            <div class="a1">
                <button type="button" class="abtn">
                    <span class="i"> 방문자가 회원정보와 다른가요? </span>
                    <span class="material-symbols-outlined">
                        keyboard_arrow_down
                    </span>
                </button>
                <div class="line1"></div>
            </div>
            <div class="a2">
                <span class="t1">실제 방문하실분의 정보를 입력해주세요.</span>
                <div class="aff">
                    <div class="af">
                        <span class="af2">방문자</span>
                        <input type="text" class="afinput">
                    </div>
                    <div class="af">
                        <span class="af2">연락처</span>
                        <input type="text" class="afinput">
                    </div>
                </div>
            </div>
        </div>

    </div>

    <div class="btn">
        <button type="button" class="white" onclick="history.back();">이전으로</button>
        <button type="button" class="blue" onclick="location.href='resContent.html'">다음단계</button>
    </div>
    <script src="./js/resContent.jsp"></script>
</body>
</html>