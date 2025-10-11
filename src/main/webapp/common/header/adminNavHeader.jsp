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
                
                <a href="/ieum/index" style="display:flex; align-items:center;">
                	<img src="/ieum/img/찐한로고.png" alt="" width="160px" />
                </a>
                
				<nav id="main-nav" role="navigation" aria-label="주요">
				  <ul>
				    <li><a class="main-van-menu" href="/ieum/hospital/search">병원조회</a></li>
				    <li><a class="main-van-menu" href="/ieum/allComList">커뮤니티</a></li>
				    <li><a class="main-van-menu" href="/products">공지사항</a></li>
				
				    <!-- ✅ 여기 추가 -->
				    <li class="admin-nav-list-li">
				      <a class="main-van-menu2" href="#">관리메뉴</a>
				      <ul class="snb">
				        <li class="admin-in-list"><a href="/ieum/admin/adminUsers">일반회원관리</a></li>
				        <li class="admin-in-list"><a href="/ieum/admin/adminHosManager">병원회원관리</a></li>
				        <li class="admin-in-list"><a href="/ieum/admin/adminHospitals">병원관리</a></li>
				        <li class="admin-in-list"><a href="/ieum/admin/hosRequestList">병원신청목록</a></li>
				        <li class="admin-in-list"><a href="#">공지사항등록</a></li>
				        <li class="admin-in-list"><a href="#">공지사항목록</a></li>
				      </ul>
				    </li>
				  </ul>
				</nav>
            </div>
        </div>
    </div>


</body>
</html>