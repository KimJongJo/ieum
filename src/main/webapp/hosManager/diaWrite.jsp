<%@ page pageEncoding="UTF-8" %>

<div class="modal-dia" id="modal-dia">
<form class="form-div">
    <div class="save-div">
        <div class="xmark-div"><i class="fa-solid fa-xmark diaWriteX"></i></div>
        <table class="user-dia-table">
        	<tr>
        		<td colspan="6" class="td-name">환자 정보</td>
        	</tr>
            <tr>
                <td class="u-td u-th up" >환자ID</td>
                <td class="u-td up" id="wrpNo">2241</td>
                <td class="u-td u-th up">생년월일</td>
                <td class="u-td up" id="wrbirthDate">26</td>
                <td class="u-td u-th">연락처</td>
                <td class="u-td add" id="wruTel">010-1234-5678</td>
            </tr>
            <tr>
                <td class="u-td u-th up">이름</td>
                <td class="u-td up" id="wrusername">김종조</td>
                <td class="u-td u-th up">성별</td>
                <td class="u-td up" id="wrgender">남</td>
                <td class="u-td u-th ">주소</td>
                <td class="u-td add" id="wruAddress">서울시 중랑구 어쩌구 저쩌구</td>
            </tr>
        	<tr>
        		<td colspan="6" class="td-name">진료 정보</td>
        	</tr>
            <tr>
                <td class="u-td u-th up">진료ID</td>
                <td class="u-td up" id="wrdNo">2241</td>
                <td class="u-td u-th up">진료 일시</td>
                <td class="u-td up" id="wrrDate">2025-08-31</td>
                <td class="u-td u-th">진료 병원</td>
                <td class="u-td add" id="wrhNm">중랑구보건소</td>
            </tr>
            <tr>
                <td class="u-td u-th">담당의사</td>
                <td class="u-td" id="wrmName">김종조</td>
                <td class="u-td u-th">전공</td>
                <td class="u-td" id="wrmajor">심리상담</td>
                <td class="u-td u-th">병원 주소</td>
                <td class="u-td add" id="wrhAddress">중랑구 보건소 어쩌구 저쩌구</td>
            </tr>
            <tr>
        		<td colspan="6" class="td-name">진단/진료상세</td>
        	</tr>
            <tr>
                <td class="u-td u-th up">진단명</td>
                <td class="u-td up"  style="width:100px;"><textarea maxlength=12 id="wrdiaName" class="area area0"></textarea></td>
                <td class="u-td u-th up">증상</td>
                <td colspan="3" id="area1" class="u-td "><textarea maxlength=76 id="wrsym" class="area area1"></textarea></td>
            </tr>
            <tr>
                <td colspan="2" class="u-td u-th">검사 내용 및 결과</td>
                    <td colspan="4" id="area2" class="u-td" colspan="2"><textarea maxlength=308 id="wrsummary" class="area area2"></textarea></td>
                </tr>
                <tr>
                    <td colspan="2" class="u-td u-th">처치/수술내용</td>
                    <td colspan="4" id="area3" class="u-td" colspan="2"><textarea maxlength=220 id="wrtreatment" class="area area3"></textarea></td>
                </tr>
                <tr>
                    <td colspan="2" class="u-td u-th">처방전</td>
                    <td colspan="4" id="area4" class="u-td" colspan="2"><textarea maxlength=132 id="wrpre" class="area area4"></textarea></td>
                </tr>
                <tr>
                    <td colspan="2" class="u-td u-th">의사의 말</td>
                    <td colspan="4" id="area5" class="u-td" colspan="2"><textarea maxlength=176 id="wrdocComment" class="area area5"></textarea></td>
                </tr>
            </table>
            <div id="btn-event">
                <button type="button" id="btn-cancellation">임시저장</button>
                <button type="button" id="btn-complete">저장</button>
            </div>
        </div>
    </form>
</div>