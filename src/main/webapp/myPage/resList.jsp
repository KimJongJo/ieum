<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/8d48045bdd.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20,600,0,0&icon_names=local_hospital" />
    <link rel="stylesheet" href="./resList.css" />
    <title>resList</title>
</head>
<body>
<div class="container">
        <div class="comres">
            <table class="come">
                <tr>
                    <td class="t1">다가오는 예약</td>
                    <td class="tq">1</td>
                </tr>
            </table>


            <div class="list1">
                <div class="l1">
                    <div class="d">
                        <table class="date">
                            <tr>
                                <td class="blue">2025.09.07</td>
                                <td class="blue">(일)</td>
                                <td class="blue">오전</td>
                                <td class="blue">11:30</td>
                            </tr>
                        </table>
                        <div class="dday">
                            <span class="dd">D-6</span>
                        </div>
                    </div>
                    <div class="star">
                        <i class="fa-regular fa-star"></i>
                    </div>
                </div>

                <div class="l2">

                    <div class="left">
                        <table class="t">
                            <tr>
                                <td class="hi"><span class="material-symbols-outlined">
                                        local_hospital
                                    </span></td>
                                <td class="hname">구로구 보건소</td>
                            </tr>
                        </table>
                        <table class="t2">
                            <tr>
                                <td class="line"></td>
                                <td class="dname">오은영<span>상담사</span></td>
                                <td class="coun"> 첫번째 상담</td>
                            </tr>
                        </table>
                    </div>
                    <div class="right">
                        <button class="lbtb" type="button">
                            <span class="lbt3">예약확인</span>
                            <div class="lbt4"><i class="fa-solid fa-list"></i></div>
                        </button>
                        <button class="lbt" type="button">
                            <span class="lbt1">예약변경</span>
                            <div class="lbt2"><i class="fa-solid fa-pen-to-square"></i></div>
                        </button>
                        <button class="lbt" type="button">
                            <span class="lbt1">예약취소</span>
                            <div class="lbt2"><i class="fa-solid fa-rectangle-xmark"></i></div>
                        </button>
                    </div>
                </div>

            </div>

        </div>

        <div class="searchbar">
            <span class="t1">지난예약</span>
            <div class="sbox">
                <table class="fil">
                    <tr>
                        <td><span class="t3">기간선택</span></td>
                        <td><select class="month" name="month">
                                <option value="none">36개월</option>
                                <option value="none">12개월</option>
                                <option value="none">6개월</option>
                                <option value="none">3개월</option>
                            </select></td>
                        <td>
                            <form class="search-box" action="" method="get">
                                <div class="i"><i class="fa-solid fa-magnifying-glass"></i></div>
                                <input class="search-txt" name="" placeholder="">
                            </form>
                        </td>
                        <td><button class="s" type="submit">조회</button></td>
                    </tr>
                </table>
            </div>
        </div>

        <div class="list2">
            <div class="l3">
                <table class="date">
                    <tr>
                        <td class="gray">2025.09.07</td>
                        <td class="gray1">(일)</td>
                    </tr>
                </table>
                <div class="star">
                    <i class="fa-regular fa-star"></i>
                </div>
            </div>
            <div class="l4">

                <div class="left2">
                    <table class="t">
                        <tr>
                            <td class="hi">
                            <td class="hi"><span class="material-symbols-outlined">
                                    local_hospital
                                </span></td>
                            </td>
                            <td class="hname">구로구 보건소</td>
                        </tr>
                    </table>
                    <table class="t2">
                        <tr>
                            <td class="line"></td>
                            <td class="dname">오은영<span>상담사</span></td>
                            <td class="coun"> 첫번째 상담</td>
                        </tr>
                    </table>
                </div>
                <div class="right2">
                    <button class="rbt" type="button">다시예약</button>
                    <button class="rbt" type="button">예약확인</button>
                </div>
            </div>

        </div>

    </div>
</body>
</html>