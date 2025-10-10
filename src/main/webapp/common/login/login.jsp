<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Document</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/common/login/css/login.css" />
		<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
		<script>
			$(function() {
				$("#loginForm").on("submit", function(e) {
				    e.preventDefault(); // form 태그의 기본인 전송을 막는다
				    var userId = $("input[name='userId']").val().trim();
				    var userPw = $("input[name='userPw']").val().trim();

				    if(userId === "" || userPw === ""){
				        alert("아이디와 비밀번호를 입력해주세요");
				        return;
				    }

				    $.ajax({
				        url: '/ieum/login',
				        type: 'POST',
				        data: $(this).serialize(), // form 안의 값 자동 직렬화
				        dataType: 'json',
				        success: function(res){
				            if(res.success){

				            		window.location.href="/ieum/index"; // 기본 페이지
				            	}

				            } else {
				                alert(res.message);
				            }
				        },
				        error: function(){
				            alert("서버 오류가 발생했습니다.");
				        }
				    });
				});
			})
		</script>
    </head>
    <body>
        <div class="main">
            <div class="main-div">
                <div class="img-div">
                    <a href="">
                        <!-- <img src="..../img/건강이음누끼로고.png" alt="" width="200px" /> -->
                    </a>
                </div>
                <div class="hi-comment">
                    <div class="comment-title">
                        <span>안녕하세요</span>
                        <span class="blue-text">건강이음</span>
                        <span>입니다.</span>
                    </div>
                </div>
                <div class="span-div">
                    <span class="comment">회원 서비스를 이용하시려면 로그인이 필요합니다.</span>
                </div>
                <form id="loginForm" class="form">
                    <div class="login-div">
                        <input value="${cookie.rememberId != null ? cookie.rememberId.value : ''}" name="userId" class="input-info" type="text" placeholder="아이디" />
                        <input name="userPw" class="input-info" type="password" placeholder="비밀번호" />
                        <div class="autologin">
                            <input ${cookie.rememberId != null ? 'checked="checked"' : ''} name="rememberId" value="Y" type="checkbox" id="autoLogin" /> <label for="autoLogin"><span class="autoLogin-span">아이디 저장</span></label>
                        </div>
                    </div>
                    <button id="loginBtn" class="login-btn">로그인</button>
                </form>
                <div class="nav-div">
                    <div class="navigation">
                        <a href="/ieum/join1"><span class="nav">회원가입</span></a>
                        <a href="/ieum/findId1"><span class="nav">아이디 찾기</span></a>
                        <a href="/ieum/findPw1"><span class="nav">비밀번호 찾기</span></a>
                    </div>
                </div>

                <div class="button-div">
                    <div class="social-login-btn-div">
                        <a href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=${kakaoKey}&redirect_uri=${kakaoRedirectUrl}"><img src="${pageContext.request.contextPath}/img/카카오로그인.webp" alt="" width="45px" class="Kimg" /></a>
                        <a href="https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=${naverClientId}&state=${state}&redirect_uri=${naverRedirectUrl}"><img src="${pageContext.request.contextPath}/img/네이버로그인.png" alt="" width="45px" class="Nimg" /></a>
                        <a href="https://accounts.google.com/o/oauth2/v2/auth?client_id=${googleId}&redirect_uri=${googleRedirectUrl}&response_type=code&scope=https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/userinfo.profile
                        "><img src="${pageContext.request.contextPath}/img/구글로그인.png" alt="" width="45px" class="Gimg" /></a>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
