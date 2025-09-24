<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- css -->
<link rel="stylesheet" type="text/css" href="css/search.css">
<!-- jquery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- fontawesome -->
<script src="https://kit.fontawesome.com/8d48045bdd.js"></script>
<title>건강이음 - 메인 검색 결과</title>
<script src="js/search.js"></script>
</head>
<body>
<header>
<%--         <jsp:include page="header.jsp"></jsp:include> --%>
<%--         <jsp:include page="middleHeader.jsp"></jsp:include> --%>
    </header>
    <div class="search-container">
        <div class="search-box">
            <input class="search-input" placeholder="입력하신 키워드는 공지사항 커뮤니티에서 검색됩니다.">
            <button class="search-btn" type="submit"><img src="img/search.png"></button>
        </div>

        <div class="tabs">
            <div class="tab active">통합검색</div>
            <div class="tab">공지사항</div>
            <div class="tab">커뮤니티</div>
        </div>
        <div class="search-section">
            <div class="section-header"><img class="pin" src="img/pin.png"><span class="keyword">공지</span>에 대한 검색결과
                <span id="all-cnt" class="cnt">1743</span> 건</div>
            <div class="notices-section">
                <div class="section-subtitle">공지사항 <div id="notice-cnt" class="cnt">17</div>건</div>
                <div class="result-item">
                    <div class="result result-title">파크병원 공지사항</div>
                    <div class="result result-content">
                        파크병원에서는 9월부터 휴일을 맞아 의료 서비스 공백을 최소화하기 위해 다음과 같이 운영하겠습니다. 파크병원에서는 9월부터 휴일을 맞아 의료 서비스 공백을 최소화하기 위해
                        다음과 같이 운영하겠습니다. 파크병원에서는 9월부터 휴일을 맞아 의료 서비스 공백을 최소화하기 위해 다음과 같이 운영하겠습니다.
                    </div>
                    <div class="result result-date">2023-02-05</div>
                </div>

                <div class="result-item">
                    <div class="result result-title">파크병원 공지사항</div>
                    <div class="result result-content">
                        파크병원에서는 9월부터 휴일을 맞아 의료 서비스 공백을 최소화하기 위해 다음과 같이 운영하겠습니다. 파크병원에서는 9월부터 휴일을 맞아 의료 서비스 공백을 최소화하기 위해
                        다음과 같이 운영하겠습니다. 파크병원에서는 9월부터 휴일을 맞아 의료 서비스 공백을 최소화하기 위해 다음과 같이 운영하겠습니다.
                    </div>
                    <div class="result result-date">2023-02-05</div>
                </div>

                <div class="button-wrapper">
                     <a class="btn-link" href=""><div class="primary-small-btn">더보기</div></a>
                </div>
            </div>

            <div class="community-section">
                <div class="section-subtitle">커뮤니티<div id="commu-cnt" class="cnt">17</div>건</div>

                <div class="result-item">
                    <div class="result result-title">공지사항 올리는 법 질문</div>
                    <div class="result result-content">
                        공지사항을 올리는 방법을 알고 싶습니다. 어떻게 하면 되나요?
                    </div>
                    <div class="result result-date">2023-02-05</div>
                </div>

                <div class="result-item">
                    <div class="result result-title">공지사항 올리는 법 질문</div>
                    <div class="result result-content">
                        공지사항을 올리는 방법을 알고 싶습니다. 어떻게 하면 되나요?
                    </div>
                    <div class="result result-date">2023-02-05</div>
                </div>

                <div class="button-wrapper">
                    <a class="btn-link" href=""><div class="primary-small-btn">더보기</div></a>
                </div>
            </div>
        </div>

    </div>
    <footer>
<%--         <jsp:include page="footer1.jsp"></jsp:include> --%>
<%--         <jsp:include page="footer2.jsp"></jsp:include> --%>
    </footer>
</body>
</body>
</html>