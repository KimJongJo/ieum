<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

    

    <!-- Header -->
    <div class="container">
        <div class="header">
            <div class="header-inner">
                <div style="cursor:pointer;" onclick="location.href='/ieum/index'" class="logo">건강이음</div>
                <div class="header-menu">
                    <span style="cursor:pointer;" onclick="location.href='/ieum/hospital/search'">병원조회</span>
                    <span style="cursor:pointer;" onclick="location.href='/ieum/admin/adminUsers'">회원관리</span>
                    <span style="cursor:pointer;" onclick="location.href='/ieum/admin/adminHospitals'">병원관리</span>
                    <span style="cursor:pointer;" onclick="location.href='/ieum/admin/hosRequestList'">병원신청목록</span>
                    <span style="cursor:pointer;" onclick="location.href='/ieum/admin/notice?page=1'">공지사항관리</span>
                </div>
            </div>
        </div>
    </div>

<%-- <div class="main-bar">
    <div class="one-section">
        <div class="circle-img">
            <i class="fa-solid fa-users"></i>
        </div>
        <div class="count-div">
            <span class="count-div-title">총 회원수</span>
            <span class="count-div-num" id="totalMember">${sessionScope.totalMember}</span>
        </div>
    </div>
    <div class="line"></div>
    <div class="one-section">
        <div class="circle-img">
            <i class="fa-solid fa-user"></i>
        </div>
        <div class="count-div">
            <span class="count-div-title">일반사용자</span>
            <span class="count-div-num" id="totalUser">${sessionScope.totalUser}</span>
        </div>
    </div>
    <div class="line"></div>
    <div class="one-section">
        <div class="circle-img">
            <i class="fa-solid fa-user-doctor"></i>
        </div>
        <div class="count-div">
            <span class="count-div-title">병원관리자</span>
            <span class="count-div-num" id="totalManager">${sessionScope.totalManager}</span>
        </div>
    </div>
    <div class="line"></div>
    <div class="one-section">
        <div class="circle-img">
            <i class="fa-solid fa-hospital"></i>
        </div>
        <div class="count-div">
            <span class="count-div-title">운영중인 병원</span>
            <span class="count-div-num" id="activeHosCount">${sessionScope.totalActiveHos}</span>
        </div>
    </div>
    <div class="line"></div>
    <div class="one-section">
        <div class="circle-img">
            <i class="fa-solid fa-ban"></i>
        </div>
        <div class="count-div">
            <span class="count-div-title">운영중지 병원</span>
            <span class="count-div-num" id="inactiveHosCount">${sessionScope.totalInactiveHos}</span>
        </div>
    </div>
</div> --%>

</body>
</html>