<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Document</title>

        <style>
            .main {
                display: flex;
                align-items: center;
                justify-content: center;
                margin-bottom: 50px;
            }

            .main-div {
                margin-top: 50px;
                width: 1110px;
            }

            .chap-div {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 175px;
                width: 1110px;
                border-radius: 15px;
                background-color: #f7faff;
            }

            .chapter {
                display: flex;
            }

            .chapter-in-div {
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                height: 110px;
                width: 110px;
                border-radius: 50%;
                margin-bottom: 20px;
            }

            .yes {
                background-color: #334186;
                color: white;
            }

            .no {
                background-color: white;
            }
            .chapter-in-div > span {
                font-size: 14px;
            }

            .chapter-in {
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            .chapter-in > span {
                font-size: 15px;
            }

            .icon {
                margin-top: 5px;
                font-size: 30px;
                padding-bottom: 20px;
            }

            .arrow {
                display: flex;
                align-items: center;
                height: 110px;
                margin-left: 25px;
                margin-right: 25px;
            }

            .check_list {
                background-color: #f4f5f9;
                border-radius: 15px;
                width: 1110px;
                height: 200px;
                overflow: auto;
                margin-top: 10px;
            }

            .check_list_div {
                padding: 20px;
            }

            .radio_div {
                margin-top: 15px;
                display: flex;
                justify-content: flex-end;
            }

            .radio_div > input {
                margin-left: 16px;
            }

            .check_list_title {
                margin-top: 80px;
            }

            .check_list_title2 {
                margin-top: 30px;
            }

            .check_list_title > span,
            .check_list_title_div {
                font-size: 20px;
                font-weight: bold;
                margin-bottom: 10px;
                margin-left: 20px;
            }

            .check_list_first {
                width: 1110px;
                height: 145px;
                background-color: #f7faff;
                display: flex;
                flex-direction: column;
                justify-content: center;
                border-radius: 15px;
                margin-top: 10px;
            }

            .check_list_first > .check_span {
                font-size: 16px;
                font-weight: bold;
                color: #271b52;
                padding-left: 20px;
            }

            .check_list_first > span {
                padding-left: 20px;
                margin-top: 10px;
            }

            .check_list_first ul {
                margin-top: 0;
                margin-left: 20px;
            }

            .under-div {
                margin-top: 50px;
                display: flex;
                justify-content: space-between;
                width: 100%;
            }

            .title-div {
                width: 1115px;
                height: 160px;
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                background-color: #f4f5f9;
                border-radius: 15px;
                font-size: 18px;
                margin-bottom: 25px;
            }

            .div-type-style {
                margin-bottom: 25px;
                display: flex;
                justify-content: center;
            }

            .div-type-style > span {
                font-size: 20px;
                font-weight: bold;
            }

            .type-div {
                display: flex;
                flex-direction: column;
                justify-content: space-evenly;
                align-items: center;
                width: 540px;
                height: 350px;
            }

            .select-type-div {
                display: flex;
                justify-content: center;
                align-items: center;
                border: 3px solid #d4d4d4;
                border-radius: 15px;
                height: 410px;
            }

            .email-text {
                font-size: 20px;
                font-weight: bold;
            }

            .email-div {
                background-color: #d4d4d4;
                width: 60px;
                height: 60px;
                border-radius: 50px;
                display: flex;
                justify-content: center;
                align-items: center;
            }

            .email-span {
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            .email-span > span {
                font-size: 13px;
            }

            .input {
                border: 3px solid #d4d4d4;
                border-radius: 5px;
                width: 270px;
                height: 40px;
                font-size: 15px;
            }

            .next-btn {
                width: 270px;
                height: 60px;
                background-color: #162f6f;
                color: white;
                border-radius: 15px;
                font-size: 16px;
                margin-top: 10px;
                cursor: pointer;
                transition-duration: 0.2s;
                border: none;
            }

            .next-btn:hover {
                background-color: #2c5ace;
            }

            .right-div {
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: space-around;
                height: 400px;
            }

            .send-btn {
                width: 60px;
                height: 45px;
                font-size: 13px;
                color: white;
                background-color: #565f7c;
                border-radius: 15px;
                border: none;
                cursor: pointer;
                transition-duration: 0.2s;
            }

            .send-btn:hover {
                background-color: #162f6f;
            }

            table {
                text-align: center;
            }
            td {
                padding-left: 10px;
                padding-right: 10px;
                padding-top: 25px;
            }

            .right-under-div {
                display: flex;
                flex-direction: column;
                align-items: center;
                height: 100px;
            }

            .right-high-div {
                display: flex;
                flex-direction: column;
                justify-content: space-around;
            }

            .email-check {
                margin-bottom: 15px;
            }

            .auth-icon {
                display: none;
            }

            .text-span {
                font-size: 16px;
            }
        </style>
        <script src="https://kit.fontawesome.com/b5ec955390.js" crossorigin="anonymous"></script>
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
                                <img src="./image/이메일아이콘.png" alt="" width="40px" height="40px" />
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
                                            <td><input type="text" class="input" /></td>
                                            <td><button class="send-btn">전송</button></td>
                                        </tr>
                                        <tr>
                                            <td><span class="text-span">인증코드</span></td>
                                            <td><input type="text" class="input" /></td>
                                            <td><button class="send-btn">인증</button></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td>
                                                <div style="height: 60px">
                                                    <img src="./image/인증확인아이콘.png" alt="" style="width: 50px" class="auth-icon" />
                                                </div>
                                            </td>
                                            <td></td>
                                        </tr>
                                    </table>
                                </div>
                                <div>
                                    <div class="right-under-div">
                                        <div><span class="email-check">이메일을 인증해주세요</span></div>

                                        <button class="next-btn">다음으로</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
