<%@ page pageEncoding="UTF-8" %>

<div class="show-dia-info" id="show-dia-info">
    <div class="save-div">
        <div class="xmark-div"><i class="fa-solid fa-xmark" id="more-dia-x"></i></div>
        <table class="user-dia-table">
        	<tr>
        		<td colspan="6" class="td-name">환자 정보</td>
        	</tr>
            <tr>
                <td class="u-td u-th up u-hold">환자ID</td>
                <td class="u-td up u-hold2" ><div id="pNo" class="pNo"></div></td>
                <td class="u-td u-th up u-hold">나이</td>
                <td class="u-td up"><div id="birthDate" class="birthDate"></div></td>
                <td class="u-td u-th u-hold">연락처</td>
                <td class="u-td add" ><div id="uTel" class="uTel"></div></td>
            </tr>
            <tr>
                <td class="u-td u-th up u-hold">이름</td>
                <td class="u-td up u-hold2"><div id="username" class="username"></div></td>
                <td class="u-td u-th up u-hold">성별</td>
                <td class="u-td up"><div id="gender" class="gender"></div></td>
                <td class="u-td u-th u-hold">주소</td>
                <td class="u-td add"><div id="uAddress" class="uAddress"></div></td>
            </tr>
        	<tr>
        		<td colspan="6" class="td-name">진료 정보</td>
        	</tr>
            <tr>
                <td class="u-td u-th up u-hold">진료ID</td>
                <td class="u-td up u-hold2" ><div id="dNo" class="dNo"></div></td>
                <td class="u-td u-th up u-hold">진료 일시</td>
                <td class="u-td up" ><div id="rDate" class="rDate"></div></td>
                <td class="u-td u-th u-hold">진료 병원</td>
                <td class="u-td add" ><div id="hNm" class="hNm"></div></td>
            </tr>
            <tr>
                <td class="u-td u-th u-hold">담당의사</td>
                <td class="u-td u-hold2"><div id="mName" class="mName"></div></td>
                <td class="u-td u-th u-hold">전공</td>
                <td class="u-td" ><div id="major" class="major"></div></td>
                <td class="u-td u-th u-hold">병원 주소</td>
                <td class="u-td add"><div id="hAddress" class="hAddress"></div></td>
            </tr>
            <tr>
        		<td colspan="6" class="td-name">진단/진료상세</td>
        	</tr>
            <tr>
                <td class="up u-hold u-tt">진단명</td>
                <td class="u-td up u-hold2"><div id="diaName" class="diaName"></div></td>
                <td class="u-tt up u-hold">증상</td>
                <td colspan="3" id="area1" class="u-td2"><div id="sym"  class="sym"></div></td>
            </tr>
            <tr>
                <td colspan="2" class="u-td u-th" style="height: 185px">검사 내용 및 결과</td>
                 <td colspan="4" id="area2" class="u-td2" colspan="2"><div class="area2" id="summary"></div></td>
             </tr>
             <tr>
                 <td colspan="2" class="u-td u-th">처치/수술내용</td>
                 <td colspan="4" id="area3" class="u-td2" colspan="2"><div class="area3" id="treatment"></div></td>
             </tr>
             <tr>
                 <td colspan="2" class="u-td u-th">처방전</td>
                 <td colspan="4" id="area4" class="u-td2" colspan="2"><div class="area4" id="pre"></div></td>
             </tr>
             <tr>
                 <td colspan="2" class="u-td u-th">의사의 말</td>
                 <td colspan="4" id="area5" class="u-td2" colspan="2"><div class="area5" id="docComm"></div></td>
             </tr>
         </table>
     </div>
 </div>