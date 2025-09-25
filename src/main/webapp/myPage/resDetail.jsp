<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/8d48045bdd.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="./css/resDetail.css" />
    <title>resDetail</title>
</head>
<body>
<div class="container">
        <div class="rescom">
            <table class="t1">
                <tr>
                    <td class="t1">다가오는 예약</td>
                    <td class="tq">1</td>
                </tr>
            </table>

            <div class="white-box">
                <div class="hos-date">
                    <div class="left">
                        <div class="hos-in">
                        <table class="hos-name">
                            <tr>
                                <td class="t21">구로구 보건소</td>
                            </tr>
                        </table>
                        <div class="dday">
                            <span class="dd">D-6</span>
                        </div>
                        </div>
                        
                        <table class="date">
                            <tr>
                                <td class="t71">2025.09.07</td>
                                <td class="t71">(일)</td>
                                <td class="t71">오전</td>
                                <td class="t71">11:30</td>
                            </tr>
                        </table>
                    </div>

                    <div class="right">
                        <button class="w" type="button">예약취소</button>
                        <button class="w" type="button">예약변경</button>
                    </div>
                </div>

                <div class="line"></div>

                <div class="docbox">
                    <img class="docprof" src="" />

                    <div class="info">
                        <div class="doci">
                        <span class="dname">황해진</span>
                        <p class="intro">
                            안녕하세요 적당히 바람이 불어 기분이 좋아요
                        </p>
                        </div>
                        <span class="major">가정의학과</span>
                    </div>
                </div>

                <div class="painfo">
                    <span class="t2">예약자 정보</span>
                    <span class="pname">임지혜</span>
                    <span class="ptel">010-1234-1234</span>

                </div>
                <div class="line"></div>

                <div class="councon">
                    <span class="t2">상담내용</span>
                    <div class="counbox"></div>
                </div>


                <div class="map">
                    <span class="t2">오시는 길</span>
                    <div class="counbox1"></div>

                </div>

                <div class="hosinf">
                    <div class="left1">
                        <div class="hinfo">
                            <div class="detail">
                                <table class="hinfotable"> <!-- border는 테두리 표시 -->
                                    <tbody>
                                        <tr>
                                            <td class="icon"> <i class="fa-solid fa-location-dot"></i></td>
                                            <td>
                                                <span class="etc1">구로구 보건소</span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="icon"></td>
                                            <td>
                                                <span class="etc">서울 구로구 구로 중앙로 28길 66 구로 5동 주민센터, 구로구 보건소</span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="icon"></td>
                                            <td>
                                                <span class="etc">구로역 1번 출구에서 859m</span>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td class="icon"><i class="fa-solid fa-phone"></i></td>
                                            <td class="ex">
                                                <span class="etc2">02-860-2600</span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="icon"><i class="fa-solid fa-square-parking"></i></td>
                                            <td>
                                                <span class="etc1">주차가능</span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="icon"></td>
                                            <td>
                                                <span class="etc">예약, 주차, 남/녀 화장실 구분</span>
                                            </td>
                                        </tr>

                                    </tbody>
                                </table>
                            </div>

                        </div>
                    </div>
                    <div class="right1">
                        <button class="hosd" type="button">
                            <div class="icon2"><i class="fa-solid fa-square-h"></i></div>병원상세
                        </button>
                    </div>

                </div>

            </div>

        </div>
        <div class="btn">
            <button type="button" class="white" onclick="history.back();">확인</button>
        </div>
    </div>
    <script src="./js/resDetail.js"></script>
</body>
</html>