<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.15/index.global.min.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/8d48045bdd.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="./hosDetail.css">
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.15/index.global.min.js"></script>
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <title>hosDe/res</title>
</head>
<body>
<div class="container">
        <div class="hh">
            <div class="hbt">
                <div class="hos-category">[보건소]</div>
                <div class="hos-name">구로보건소</div>
            </div>
            <div class="share">
                <button type="button" class="bt1">
                    <div class="i"><i class="fa-regular fa-star"></i></div>
                </button>
                <button type="button" class="bt1">
                    <div class="i"><i class="fa-regular fa-share-from-square"></i></div>
                </button>
            </div>
        </div>
        <div class="hos-box">
            <form class="hos-box1" action="" method="get">

                <div class="hinfoa">

                    <img src="" class="file_no" />

                    <div class="hinfor">
                        <div class="hinfoh">
                            <div class="hos-cate">[보건소]</div>
                            <div class="hos-na">구로보건소</div>

                        </div>

                        <div class="hinfo">
                            <div class="detail">
                                <table class="hinfotable"> <!-- border는 테두리 표시 -->
                                    <tbody>
                                        <tr>
                                            <td class="icon"> <i class="fa-solid fa-location-dot"></i></td>
                                            <td>
                                                <p class="etc">서울 구로구 구로 중앙로 28길 66 구로 5동 주민센터, 구로구 보건소</p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="icon"><i class="fa-solid fa-bus"></i></td>
                                            <td>
                                                <p class="etc">구로역 1번 출구에서 859m</p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="icon"><i class="fa-solid fa-clock"></i></td>
                                            <td>
                                                <p class="etc">오늘 휴무/ 매주 일요일 휴무</p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="icon"><i class="fa-solid fa-phone"></i></td>
                                            <td>
                                                <p class="etc">02-860-2600</p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="icon"></td>
                                            <td>
                                                <p class="etc">실손24 서비스</p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="icon"></td>
                                            <td>
                                                <a href="#" class="etc">
                                                    http://www.guro.go.kr/health/NR_index.do
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="icon"></td>
                                            <td>
                                                <p class="etc">예약, 주차, 남/녀 화장실 구분</p>
                                            </td>
                                        </tr>

                                    </tbody>
                                </table>
                            </div>

                        </div>
                    </div>
                </div>
            </form>
        </div>

        <div class="nav-box">
            <div class="nav-h3">
                <button class="navl active" data-target="hosdetail">
                    <span>상세정보</span>
                </button>
                <button class="navr" data-target="reservation">
                    <span>예약하기</span>
                </button>
            </div>
        </div>

        <div class="tab1 active" id="tab1">
            <div class="hosinft">
                <!-- <div class="mtitle">병원소개</div> -->
                <div class="mtitle">
                    <span class="mtitle-span">병원소개</span>
                </div>
            </div>
            <div class="hos-info">
                <form class="hos-inf" action="" method="get">
                    <div class="inf">
                        <p class="p1">1회용품 줄이기에 동참해주세요</p>
                        <span class="p2">2024년 3월 29일부터 일부 숙소는 1회용품 (칫솔,면도기 등)을 무료로 제공하지 않을 수 있습니다.</span>
                    </div>
                </form>
            </div>
            <div class="doctor-section">
                <div class="mtitle">상담사</div>
            </div>
            <div class="doctor-box">
                <div class="dall">
                    <img src="" class="doc-prof" />
                    <div class="d1">
                        <div class="username">황혜진</div>
                        <p class="introduction">(한마디?)잠시쉬었다 가는 것도 괜찮아요 지금 여기에서 진심으로 함께 있겠습니다.</p>
                        <p class="major">가정의학과 전문의</p>
                    </div>
                </div>

                <div class="dall">
                    <img src="" class="doc-prof" />
                    <div class="d1">
                        <div class="username">황혜진</div>
                        <p class="introduction">(한마디?)잠시쉬었다 가는 것도 괜찮아요 지금 여기에서 진심으로 함께 있겠습니다.</p>
                        <p class="major">가정의학과 전문의</p>
                    </div>
                </div>

            </div>

            <div class="map">
                <div class="m1">
                    <span class="mtitle">위치/교통</span>
                </div>
                <div class="m2">
                    <div class="map-sec"></div>
                </div>
            </div>
        </div>

        <div class="tab2" id="tab2">
            <div class="doctor-section">
                <div class="mtitle">상담예약</div>
            </div>
            <div class="mheader">
                <i class="fa-solid fa-user-doctor"></i>
                <span class="h">원하는 상담사를 선택해주세요</span>
            </div>


            <div class="doctor-section">
                <div class="mtitle">상담사</div>
            </div>
            <div class="doctor-box">
                <div class="dall">
                    <img src="" class="doc-prof" />
                    <div class="d1">
                        <div class="username">황혜진</div>
                        <p class="introduction">(한마디?)잠시쉬었다 가는 것도 괜찮아요 지금 여기에서 진심으로 함께 있겠습니다.</p>
                        <p class="major">가정의학과 전문의</p>
                    </div>
                </div>
            </div>

            <div class="mheader">
                <i class="fa-solid fa-calendar-days"></i>
                <span class="h">날짜와 시간을 선택해 주세요</span>
            </div>

            <div class="select-date">

                <form class="date" action="" method="post">
                    <div class="calendar">
                        <div class="date-header"></div>
                        <div id="fc"></div>
                    </div>
                </form>
                <form class="time" action="" method="post" class="tt">
                    <div class="time-table">
                        <label class="cnb"><input type="checkbox" name="chojin" value="true" />이 병원에서 초진일 경우
                            체크</label>
                        <p class="day">오전</p>

                        <button type="button" class="tb1" name="time" value="9:00">09:00</button>
                        <button type="button" class="tb1" name="time" value="9:30">09:30</button>
                        <button type="button" class="tb1" name="time" value="10:00">10:00</button>
                        <button type="button" class="tb1" name="time" value="10:30">10:30</button>
                        <button type="button" class="tb1" name="time" value="11:00">11:00</button>
                        <button type="button" class="tb1" name="time" value="11:30">11:30</button>


                        <p class="day">오후</p>

                        <button type="button" class="tb1" name="time" value="1:00">1:00</button>
                        <button type="button" class="tb1" name="time" value="1:30">1:30</button>
                        <button type="button" class="tb1" name="time" value="2:00">2:00</button>
                        <button type="button" class="tb1" name="time" value="2:30">2:30</button>
                        <button type="button" class="tb1" name="time" value="3:00">3:00</button>
                        <button type="button" class="tb1" name="time" value="3:30">3:30</button>
                        <button type="button" class="tb1" name="time" value="4:00">4:00</button>
                        <button type="button" class="tb1" name="time" value="4:30">4:30</button>
                        <button type="button" class="tb1" name="time" value="5:00">5:00</button>
                        <button type="button" class="tb1" name="time" value="5:30">5:30</button>
                        <button type="button" class="tb1" name="time" value="8:30">8:30</button>


                    </div>
                </form>
            </div>

            <div class="cont">
                <div class="mhea">
                    <i class="fa-solid fa-pen-to-square"></i>
                    <span class="h">어떤 주제의 상담이 필요하신가요?</span>
                </div>
                <div class="b">

                </div>

            </div>
        </div>

    </div>

    <div class="btn">
            <button type="button" class="white" onclick="history.back();">이전으로</button>
            <button type="button" class="blue" onclick="location.href='resContent.html'">예약하기</button>
        </div>


    <script src="./hosDetail.js"></script>

</body>
</html>