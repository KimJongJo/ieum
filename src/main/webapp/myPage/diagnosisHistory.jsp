<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Document</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/myPage/css/diagnosisHistory.css" />
        
        <script src="https://kit.fontawesome.com/b5ec955390.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <div class="main">
            <div class="main-div">
                <div class="under-section">
                    <div class="main-nav">
                        <div class="first-block">
                            <img src="../image/건강이음.png" width="120px" alt="" />
                            <span class="first-block-span">마이페이지</span>
                        </div>
                        <div class="second-block">
                            <span class="second-block-first">뭐 알아서 관리해</span>
                            <span class="second-block-second">관리자(너 나 우리)</span>
                            <span class="second-block-third">심원의 방</span>
                        </div>
                        <div class="button-block">
                            <button type="button" class="button">대기열 관리</button>
                            <button type="button" class="button">공지사항 관리</button>
                        </div>
                    </div>
                    <div class="info">
                        <div class="info-div">
                            <span class="info-span">진료 기록 조회</span>
                            <ul class="info-ul">
                                <li class="info-li">과거 내원했던 병원의 정보와 날짜, 담당의가 작성했던 진단서를 확인할 수 있습니다.</li>
                            </ul>
                        </div>
                        <div class="select-div-date">
                            <button class="caret-btn"><i class="fa-solid fa-caret-left"></i></button>
                            <span class="select-date">2025.09</span>
                            <button class="caret-btn"><i class="fa-solid fa-caret-right"></i></button>
                        </div>
                        <div class="calendar"></div>
                        <div class="select-div">
                            <div>
                                <select name="" id="" class="year">
                                    <option value="">년</option>
                                </select>
                                <select name="" id="" class="month">
                                    <option value="">월</option>
                                </select>
                                <select name="" id="" class="day">
                                    <option value="">일</option>
                                </select>
                                <button type="button" class="reservation-btn">검색</button>
                            </div>
                        </div>
                        <div>
                            <div id="diagnosis-box">
                                <div id="box1">
                                    <div class="box-item">진단 일시</div>
                                    <div class="box-item">진단 명</div>
                                    <div class="box-item">결과요약</div>
                                    <div class="box-item">상세보기</div>
                                </div>
                                <div id="box2">
                                    <div class="box-item">2025-09-18</div>
                                    <div class="box-item">우울증</div>
                                    <div class="box-item">중(약 복용)</div>
                                    <div class="box-item">
                                        <button class="btn2">진단 결과 보기</button>
                                    </div>
                                </div>
                                <div id="doc-comment">
                                    우울증은 단순한 슬픔과는 달리, 하루 대부분 지속되는 우울감, 흥미와 즐거움 상실, 의욕 저하 등이 주요 증상으로 나타나 일상생활과 사회생활에 어려움을 주는 질병입니다
                                </div>
                                <div id="upload">
                                    <div>수원시 보건소</div>
                                    <div>업로드 날짜</div>
                                </div>
                            </div>
                            <div id="diagnosis-box">
                                <div id="box1">
                                    <div class="box-item">진단 일시</div>
                                    <div class="box-item">진단 명</div>
                                    <div class="box-item">결과요약</div>
                                    <div class="box-item">상세보기</div>
                                </div>
                                <div id="box2">
                                    <div class="box-item">2025-09-18</div>
                                    <div class="box-item">우울증</div>
                                    <div class="box-item">중(약 복용)</div>
                                    <div class="box-item">
                                        <button class="btn2">진단 결과 보기</button>
                                    </div>
                                </div>
                                <div id="doc-comment">
                                    우울증은 단순한 슬픔과는 달리, 하루 대부분 지속되는 우울감, 흥미와 즐거움 상실, 의욕 저하 등이 주요 증상으로 나타나 일상생활과 사회생활에 어려움을 주는 질병입니다
                                </div>
                                <div id="upload">
                                    <div>수원시 보건소</div>
                                    <div>업로드 날짜</div>
                                </div>
                            </div>
                            <div id="diagnosis-box">
                                <div id="box1">
                                    <div class="box-item">진단 일시</div>
                                    <div class="box-item">진단 명</div>
                                    <div class="box-item">결과요약</div>
                                    <div class="box-item">상세보기</div>
                                </div>
                                <div id="box2">
                                    <div class="box-item">2025-09-18</div>
                                    <div class="box-item">우울증</div>
                                    <div class="box-item">중(약 복용)</div>
                                    <div class="box-item">
                                        <button class="btn2">진단 결과 보기</button>
                                    </div>
                                </div>
                                <div id="doc-comment">
                                    우울증은 단순한 슬픔과는 달리, 하루 대부분 지속되는 우울감, 흥미와 즐거움 상실, 의욕 저하 등이 주요 증상으로 나타나 일상생활과 사회생활에 어려움을 주는 질병입니다
                                </div>
                                <div id="upload">
                                    <div>수원시 보건소</div>
                                    <div>업로드 날짜</div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-div" id="modal-div">
                            <div class="diagnosis">
                                <div class="xmark-div"><i class="fa-solid fa-xmark"></i></div>
                                <div class="diagnosis-div">
                                    <!-- 왼쪽 내용 -->
                                    <div class="left-div">
                                        <div><span>환자 정보</span></div>
                                        <table class="user-table">
                                            <tr>
                                                <td class="th user-th table-left">이름</td>
                                                <td class="td user-td">김종조</td>
                                                <td class="th user-th th2">성별</td>
                                                <td class="td user-td">남</td>
                                                <td class="th user-th th2">나이</td>
                                                <td class="td user-td table-right">26</td>
                                            </tr>
                                        </table>
                                        <div><span>진단/진료상세</span></div>
                                        <table class="diagnosis-table">
                                            <tr>
                                                <td class="th diagnosis-th diagnosis-left" style="height: 40px">진단명</td>
                                                <td class="diagnosis-td diagnosis-right">진단명내용</td>
                                            </tr>
                                            <tr>
                                                <td class="th diagnosis-th">증상</td>
                                                <td class="diagnosis-td">증상내용</td>
                                            </tr>
                                            <tr>
                                                <td class="th diagnosis-th" style="height: 200px">주요검사 결과 요약</td>
                                                <td class="diagnosis-td">검사 내용</td>
                                            </tr>
                                            <tr>
                                                <td class="th diagnosis-th" style="height: 165px">처치/수술내용</td>
                                                <td class="diagnosis-td">처치 수술 내용</td>
                                            </tr>
                                            <tr>
                                                <td class="th diagnosis-th diagnosis-left-down">처방전</td>
                                                <td class="diagnosis-td diagnosis-right-down">약, 이름, 용량, 투여 방법</td>
                                            </tr>
                                        </table>
                                    </div>
                                    <!-- 오른쪽 내용 -->
                                    <div class="right-div">
                                        <div><span>의사 정보</span></div>
                                        <div class="doctor-info">
                                            <img src="../image/병원관리자.png" alt="" class="doc-img" />
                                            <table class="doctor-table">
                                                <tr>
                                                    <td class="th doctor-th">담당의사</td>
                                                    <td class="doctor-td doctor-first">김종조</td>
                                                </tr>
                                                <tr>
                                                    <td class="th doctor-th">진료 일시</td>
                                                    <td class="doctor-td">2025-08-31</td>
                                                </tr>
                                                <tr>
                                                    <td class="th doctor-th">진료 유형</td>
                                                    <td class="doctor-td">외래/응급</td>
                                                </tr>
                                                <tr>
                                                    <td class="th doctor-th">진료 병원</td>
                                                    <td class="doctor-td doctor-last">중랑구 보건소</td>
                                                </tr>
                                            </table>
                                        </div>
                                        <div><span>의사의 말</span></div>
                                        <table class="comment-table">
                                            <tr>
                                                <td class="th comment-th" style="width: 180px">내용</td>
                                                <td class="comment-td">아프지 마세요~</td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                                <div class="btn-div"><button type="button" class="check-btn" id="check">확인</button></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="${pageContext.request.contextPath}/myPage/js/diagnosisHistory.js">
            
        </script>
    </body>
</html>
