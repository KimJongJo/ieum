<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Document</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/common/join/css/join3.css" />
        

        <script src="https://kit.fontawesome.com/b5ec955390.js" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/common/join/js/join3.js"></script>
        
    </head>
    <body>
        <div class="main">
            <div class="main-div">
                <div class="chap-div">
                    <div class="chapter">
                        <div class="chapter-in">
                            <div class="chapter-in-div no">
                                <span>STEP 1</span>
                                <i class="icon fa-regular fa-user"></i>
                            </div>
                            <span>회원선택</span>
                        </div>
                        <div class="arrow">
                            <i class="fa-solid fa-arrow-right"></i>
                        </div>
                    </div>
                    <div class="chapter">
                        <div class="chapter-in">
                            <div class="chapter-in-div no">
                                <span>STEP 2</span>
                                <i class="icon fa-solid fa-list-check"></i>
                            </div>
                            <span>약관동의</span>
                        </div>
                        <div class="arrow">
                            <i class="fa-solid fa-arrow-right"></i>
                        </div>
                    </div>
                    <div class="chapter">
                        <div class="chapter-in">
                            <div class="chapter-in-div yes">
                                <span>STEP 3</span>
                                <i class="icon fa-regular fa-envelope-open"></i>
                            </div>
                            <span>본인인증</span>
                        </div>
                        <div class="arrow">
                            <i class="fa-solid fa-arrow-right"></i>
                        </div>
                    </div>
                    <div class="chapter">
                        <div class="chapter-in">
                            <div class="chapter-in-div no">
                                <span>STEP 4</span>
                                <i class="icon fa-regular fa-comment-dots"></i>
                            </div>
                            <span>정보입력</span>
                        </div>
                        <div class="arrow">
                            <i class="fa-solid fa-arrow-right"></i>
                        </div>
                    </div>
                    <div class="chapter">
                        <div class="chapter-in">
                            <div class="chapter-in-div no">
                                <span>STEP 5</span>
                                <i class="icon fa-regular fa-thumbs-up"></i>
                            </div>
                            <span>가입완료</span>
                        </div>
                    </div>
                </div>
                <div class="check_list_title">
                    <span class="check_list_title_in_span">약관동의</span>
                </div>
                <div class="check_list_first">
                    <span class="check_span"><i class="fa-regular fa-face-smile"></i> 반드시 본인의 실명으로 가입해 주시기 바랍니다.</span>
                    <span>타인의 개인정보를 도용하여 온라인 회원가입을 하는 경우, 주민등록법에 따라 3년 이하의 징역 또는 1천만원 이하의 벌금이 부과될 수 있습니다.</span>
                    <ul>
                        <li>온라인 회원이 되시면 다양한 서비스를 이용할 수 있습니다.</li>
                        <li>건강이음에서는 고객님께 만족스러운 서비스를 제공하기 위하여 항상 노력하겠습니다.</li>
                    </ul>
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
                            <form action="/ieum/nextPage" method="POST" class="right-div">
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

                                        <button id="nextPageBtn" class="next-btn">다음으로</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
