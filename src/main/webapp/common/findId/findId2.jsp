<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Document</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/common/findId/css/findId2.css" />
        <script src="https://kit.fontawesome.com/b5ec955390.js" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
       	<script src="${pageContext.request.contextPath}/common/findId/js/findId2.js"></script>
        
    </head>
    <body>
        <div class="main">
            <div class="main-div">
                <div class="title-div">
                    <span>아이디를 잊으셨나요?</span>
                    <span>아래 회원 유형을 선택후 진행하여 주세요.</span>
                </div>
                <div style="width: 100%" class="div-type-style">
                    <span>이메일을 통한 본인인증을 진행해주세요</span>
                </div>
                <div class="under-div">
                    <div class="select-type-div">
                        <div class="type-div">
                            <span class="email-text">이메일</span>
                            <div class="email-div">
                                <img src="${pageContext.request.contextPath}/img/이메일아이콘.png" alt="" width="40px" height="40px" />
                            </div>

                            <div class="email-span">
                                <span>인터넷 상에서의 실명확인 시 실제 본인 여부의 확인을 위한</span>
                                <span>본인인증 서비스 실제 실명확인을 받는 사람의 명의 확인이 가능해</span>
                                <span>주민등록번호 도용을 원천 방지할 수 있습니다.</span>
                            </div>
                        </div>
                    </div>
                    <div class="select-type-div">
                        <div class="type-div">
                            <div class="right-div">
                                <div class="right-high-div">
                                    <table>
                                        <tr>
                                            <td><span class="text-span">이메일</span></td>
                                            <td><input name="email" type="email" class="input" id="inputEmail"/></td>
                                            <td><button type="button" class="send-btn" id="emailSend">전송</button></td>
                                        </tr>
                                        <tr>
                                            <td><span class="text-span">인증코드</span></td>
                                            <td><input type="text" class="input" id="inputAuthCode"/></td>
                                            <td><button type="button" class="send-btn" id="emailAuthCheck">인증</button></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td>
                                                <div class="success-code-div" style="height: 60px">
                                                    <img src="${pageContext.request.contextPath}/img/인증확인아이콘.png" alt="" style="width: 50px" class="auth-icon" />
                                                </div>
                                            </td>
                                            <td></td>
                                        </tr>
                                    </table>
                                </div>
                                <div>
                                    <div class="right-under-div">
                                        <div><span class="email-check" id="email-check-comment">이메일을 인증해주세요</span></div>

                                        <button type="button" id="nextPageBtn" class="next-btn">다음으로</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="find-pw-nav">
                    <span>비밀번호를 잊으셨나요? <i class="fa-solid fa-arrow-right"></i></span>

                    <a href="/ieum/findPw1">비밀번호 찾기</a>
                </div>
            </div>
        </div>
    </body>
</html>
