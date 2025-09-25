<%@ page pageEncoding="UTF-8" %>

<div class="modal-dia" id="modal-dia">
<form action="" class="form-div">
    <div class="save-div">
        <div class="xmark-div"><i class="fa-solid fa-xmark"></i></div>
        <table class="user-dia-table">
        	<tr>
        		<td colspan="6" class="td-name">환자 정보</td>
        	</tr>
            <tr>
                <td class="u-td u-th up">환자ID</td>
                <td class="u-td up">2241</td>
                <td class="u-td u-th up">나이</td>
                <td class="u-td up">26</td>
                <td class="u-td u-th">연락처</td>
                <td class="u-td add">010-1234-5678</td>
            </tr>
            <tr>
                <td class="u-td u-th up">이름</td>
                <td class="u-td up">김종조</td>
                <td class="u-td u-th up">성별</td>
                <td class="u-td up">남</td>
                <td class="u-td u-th ">주소</td>
                <td class="u-td add">서울시 중랑구 어쩌구 저쩌구</td>
            </tr>
        	<tr>
        		<td colspan="6" class="td-name">진료 정보</td>
        	</tr>
            <tr>
                <td class="u-td u-th up">진료ID</td>
                <td class="u-td up">2241</td>
                <td class="u-td u-th up">진료 일시</td>
                <td class="u-td up">2025-08-31</td>
                <td class="u-td u-th">진료 병원</td>
                <td class="u-td add">중랑구보건소</td>
            </tr>
            <tr>
                <td class="u-td u-th">담당의사</td>
                <td class="u-td">김종조</td>
                <td class="u-td u-th">진료 유형</td>
                <td class="u-td">외래/응급</td>
                <td class="u-td u-th">병원 주소</td>
                <td class="u-td add">중랑구 보건소 어쩌구 저쩌구</td>
            </tr>
            <tr>
        		<td colspan="6" class="td-name">진단/진료상세</td>
        	</tr>
            <tr>
                <td class="u-td u-th up">진단명</td>
                <td class="u-td up">2241</td>
                <td class="u-td u-th up">증상</td>
                <td colspan="3" id="area1" class="u-td "><textarea name="" id="" class="area area1"></textarea></td>
            </tr>
            <tr>
                <td colspan="2" class="u-td u-th" style="height: 185px">검사 내용 및 결과</td>
                    <td colspan="4" id="area2" class="u-td" colspan="2"><textarea name="" id="" class="area area2"></textarea></td>
                </tr>
                <tr>
                    <td colspan="2" class="u-td u-th">처치/수술내용</td>
                    <td colspan="4" id="area3" class="u-td" colspan="2"><textarea name="" id="" class="area area3"></textarea></td>
                </tr>
                <tr>
                    <td colspan="2" class="u-td u-th">처방전</td>
                    <td colspan="4" id="area4" class="u-td" colspan="2"><textarea name="" id="" class="area area4"></textarea></td>
                </tr>
                <tr>
                    <td colspan="2" class="u-td u-th">의사의 말</td>
                    <td colspan="4" id="area5" class="u-td" colspan="2"><textarea name="" id="" class="area area5"></textarea></td>
                </tr>
            </table>
            <div id="btn-event">
                <button id="btn-cancellation">임시저장</button>
                <button id="btn-complete">저장</button>
            </div>
        </div>
    </form>
</div>