
<%@ page pageEncoding="UTF-8" %>
	<div class="modal-dia2" id="modal-dia2">
		<div class="form-div">
		    <div class="save-div">
		        <div class="xmark-div"><i class="fa-solid fa-xmark patientInfoX" id="p-info-div"></i></div>
		        <table class="user-dia-table">
		        	<tr>
		        		<td colspan="6" class="td-name">환자 정보</td>
		        	</tr>
		            <tr>
		                <td class="u-td u-th up" style="width:100px;">환자ID</td>
		          <td class="u-td up">2241</td>
		          <td class="u-td u-th up" style="width:100px;">나이</td>
		          <td class="u-td up" style="width:130px;">26</td>
		          <td class="u-td u-th" style="width:100px;">연락처</td>
		          <td class="u-td add">010-1234-5678</td>
		      </tr>
		      <tr>
		          <td class="u-td u-th up" style="width:100px;">이름</td>
		          <td class="u-td up">김종조</td>
		          <td class="u-td u-th up" style="width:100px;">성별</td>
		          <td class="u-td up">남</td>
		          <td class="u-td u-th " style="width:100px;">주소</td>
		          <td class="u-td add">서울시 중랑구 어쩌구 저쩌구</td>
		      </tr>
		  	<tr>
		  		<td colspan="6" class="td-name">상담 내용</td>
		  	</tr>
		      <tr>
		          <td colspan="6"><div class="p-info-content">상처를 치료해줄 사람어디 없나 가만히 놔두다간 끊임없이 덧나</div></td>
		      </tr>
		      <tr>
		  		<td colspan="6" class="td-name">진단기록</td>
		  	</tr>
		      <tr>
		          <td colspan="6">
		          	<div class="p-info-diagnosis">
		          		<table class="dia-table">
		          			<tr>
		          				<td class="dia-table-th" style="width:100px; text-align:center">일자</td>
		           			<td class="dia-table-th" style="width:100px; text-align:center">담당의사</td>
		           			<td class="dia-table-th" style="padding-right:9px; padding-left:6px;">진단명</td>
		          			</tr>
		          			
		          		</table>
		          		<div class="p-info-dia-div">
		           		<table class="dia-table2">
		           			<tr>
		           				<td class="dia-table-td dia-table-td2">2022.07.02</td>
		           				<td class="dia-table-td dia-table-td2">김종조</td>
		           				<td class="dia-table-td">
		           					<div class="dia-name-div">
		           						<span>성인 ADHD</span>
		           						<button id="show-btn">보기</button>
		           					</div>
		          					</td>
		           			</tr>
		           		</table>
		          		</div>
		          		
		          	</div>
		          </td>
		      </tr>
		      <tr>
		  		<td colspan="6" class="td-name">다이어리</td>
		  	</tr>
		      <tr>
		          <td colspan="6"><div class="p-info-diary">
		          	<table class="dia-table">
		         			<tr>
		         				<td class="dia-table-th" style="width:100px; text-align:center">일자</td>
		         				<td class="dia-table-th" style="width:100px; text-align:center">기분</td>
		          			<td class="dia-table-th" style="padding-right:9px; padding-left:6px;">제목</td>
		                                       			</tr>
		                                       		</table>
		                                       		<div class="p-info-dia-div">
		                                        		<table class="dia-table2">
		                                        			<tr>
		                                        				<td class="dia-table-td dia-table-td2">2022.07.02</td>
		                                        				<td class="dia-table-td dia-table-td2"><i class="fa-regular fa-face-smile"></i></td>
		                                        				<td class="dia-table-td">
		                                        					<div class="dia-name-div">
		                                        						<div class="patient-comment-div">
		                                        							<div class="patient-comment-title">7월2일의 기록 - 오늘의 기분 맑음</div>
		                                        							
		                                        							<div class="patient-comment-content" id="patient-content">
		내 기분이 맑은건가, 아니면 맑고 싶은건가.. 의식을 하고 있어서 그런가 아무느낌도 안드는데 웃고만 있다..
		9월25일 오후 9시 6분 토스, 카카오페이에서 민생지원금 2차 신청하라고 알림이 왔다. 거울을 보니 내 입가에 미소가...
																			</div>
		                                        						</div>
		                                        						<button class="view-more" id="view-more">
		                                        							<img src="../img/btn1.png" style="width:15px; height:15px;"/>
		                						</button>
		                						
		                					</div>
		               					</td>
		                			</tr>
		                		</table>
		               		</div>
		                </div>
		               </td>
		            </tr>
		        </table>
		    </div>
		    
		</div>
		
	   <jsp:include page="showDia.jsp"></jsp:include>
	</div>