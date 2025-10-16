<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Document</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/myPage/css/profileInfo.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/myPage/css/diagnosisHistory.css" />
        <script src="https://kit.fontawesome.com/8d48045bdd.js"></script>
                <!-- jquery -->
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<!-- FullCalendar Script -->
		<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.15/index.global.min.js"></script>
		<script>
		    // HTML 페이지에서 선언, JSP에서 EL 치환됨
		    let year = "";
		    let month = "";
		    let day = "";
		    let date = "";
		</script>
    </head>
    <body>
    
    <c:import url="/common/header/header.jsp" charEncoding="UTF-8"/>
    
    
     <div id="section-title">
        <span>진단 이력</span>
   
    </div>
    
                  <div class="main-container">
                   	<jsp:include page="/common/nav/nav.jsp"></jsp:include>
                    <div class="info">
                        <div class="info-div">
                            <span class="info-span">진료 기록 조회</span>
                            <ul class="info-ul">
                                <li class="info-li">과거 내원했던 병원의 정보와 날짜, 담당의가 작성했던 진단서를 확인할 수 있습니다.</li>
                            </ul>
                        </div>
                        
                        <!-- 달력 -->
                        <div id="calendar"></div>
                        <div class="select-div">
                        	<button id="searchAllDia" type="button" class="reservation-all-btn">전체 조회</button>
                            <div>
                                <select id="year2" class="year">
                                    <option value="none">년</option>
                                </select>
                                <select id="month" class="month">
                                    <option value="none">월</option>
                                </select>
                                <select id="day" class="day">
                                    <option value="none">일</option>
                                </select>
                                <button id="searchDiaDate" type="button" class="reservation-btn">검색</button>
                            </div>
                        </div>
                        <div class="disListDiv" id="disListDiv">
                        	<c:forEach var="dia" items="${diaList}">
	                            <div class="diagnosis-box">
	                                <div class=box1>
	                                    <div class="box-item">진단 일시</div>
	                                    <div class="box-item">진단 명</div>
	                                    <div class="box-item">결과요약</div>
	                                    <div class="box-item">상세보기</div>
	                                </div>
	                                <div class=box2>
	                                    <div class="box-item">${dia.rDate}</div>
	                                    <div class="box-item">${dia.diagnosisName}</div>
	                                    <div class="box-item">
	                                    	 <span class="ellipsis-text">${dia.testSummary}</span>
	                                    </div>
	                                    <div class="box-item">
	                                        <button class="btn2 btn-rec-w" value="${dia.diaNo}">진단 결과 보기</button>
	                                    </div>
	                                </div>
	                                <div class="doc-comment">
	                                    ${dia.doctorComment}
	                                </div>
	                                <div class="upload">
	                                    <div>${dia.hNm}</div>
	                                    <div>업로드 날짜</div>
	                                </div>
	                            </div>
                            </c:forEach>
                        </div>
                        
                        <c:if test="${hasMore}">
						    <div class="load-more-div">
						        <button id="loadMoreBtn" type="button">더보기</button>
						    </div>
						</c:if>
						                        
                        
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
                                                <td class="td user-td" id="uNm"></td>
                                                <td class="th user-th th2">성별</td>
                                                <td class="td user-td" id="gender"></td>
                                                <td class="th user-th th2">생년월일</td>
                                                <td class="td user-td table-right" id="birthDate"></td>
                                            </tr>
                                        </table>
                                        <div><span>진단/진료상세</span></div>
                                        <table class="diagnosis-table">
                                            <tr>
                                                <td class="th diagnosis-th diagnosis-left" style="height: 40px">진단명</td>
                                                <td class="diagnosis-td diagnosis-right" id="diaName"></td>
                                            </tr>
                                            <tr>
                                                <td class="th diagnosis-th">증상</td>
                                                <td class="diagnosis-td" id="sym"></td>
                                            </tr>
                                            <tr>
                                                <td class="th diagnosis-th" style="height: 200px">주요검사 결과 요약</td>
                                                <td class="diagnosis-td" id="summary"></td>
                                            </tr>
                                            <tr>
                                                <td class="th diagnosis-th" style="height: 165px">처치/수술내용</td>
                                                <td class="diagnosis-td" id="treatment"></td>
                                            </tr>
                                            <tr>
                                                <td class="th diagnosis-th diagnosis-left-down">처방전</td>
                                                <td class="diagnosis-td diagnosis-right-down" id="pre"></td>
                                            </tr>
                                        </table>
                                    </div>
                                    <!-- 오른쪽 내용 -->
                                    <div class="right-div">
                                        <div><span>의사 정보</span></div>
                                        <div class="doctor-info">
                                            <img src="../image/병원관리자.png" alt="" class="doc-img" id="docImg"/>
                                            <table class="doctor-table">
                                                <tr>
                                                    <td class="th doctor-th">담당의사</td>
                                                    <td class="doctor-td doctor-first" id="mNm"></td>
                                                </tr>
                                                <tr>
                                                    <td class="th doctor-th">진료 일시</td>
                                                    <td class="doctor-td" id="rDate"></td>
                                                </tr>
                                                <tr>
                                                    <td class="th doctor-th">전공</td>
                                                    <td class="doctor-td" id="major"></td>
                                                </tr>
                                                <tr>
                                                    <td class="th doctor-th">진료 병원</td>
                                                    <td class="doctor-td doctor-last" id="hNm"></td>
                                                </tr>
                                            </table>
                                        </div>
                                        <div><span>의사의 말</span></div>
                                        <table class="comment-table">
                                            <tr>
                                                <td class="th comment-th" style="width: 180px">내용</td>
                                                <td class="comment-td" id="docComment"></td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                                <div class="btn-div"><button type="button" class="check-btn" id="check">확인</button></div>
                            </div>
                        </div>
                    </div>
                </div>
        
        <c:import url="../common/footer/footer.html" charEncoding="UTF-8"/>
		<script src="${pageContext.request.contextPath}/myPage/js/diagnosisHistory.js"></script>
    </body>
</html>
