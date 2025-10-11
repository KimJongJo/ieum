
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
		          <td class="u-td up" id="infopNo"></td>
		          <td class="u-td u-th up" style="width:100px;">생년월일</td>
		          <td class="u-td up" style="width:130px;" id="infoBirthDate"></td>
		          <td class="u-td u-th" style="width:100px;">연락처</td>
		          <td class="u-td add" id="infoTel"></td>
		      </tr>
		      <tr>
		          <td class="u-td u-th up" style="width:100px;">이름</td>
		          <td class="u-td up" id="infoUsername"></td>
		          <td class="u-td u-th up" style="width:100px;">성별</td>
		          <td class="u-td up" id="infoGender"></td>
		          <td class="u-td u-th " style="width:100px;">주소</td>
		          <td class="u-td add" id="infouAddress"></td>
		      </tr>
		  	<tr>
		  		<td colspan="6" class="td-name">상담 내용</td>
		  	</tr>
		      <tr>
		          <td colspan="6"><div class="p-info-content" id="content"></div></td>
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
		           		<table class="dia-table2" id="dia-table2">
		           			<tbody>
		           			<tr>
		           				<td class="dia-table-td dia-table-td2"></td>
		           				<td class="dia-table-td dia-table-td2"></td>
		           				<td class="dia-table-td">
		           					<div class="dia-name-div">
		           						<span>성인 ADHD</span>
		           						<button class="show-btn">보기</button>
		           					</div>
	          					</td>
		           			</tr>
		           			</tbody>
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
                                        <table class="dia-table2" id="diary-table">
                                        	<tr>
                                        		<td class="dia-table-td dia-table-td2"></td>
                                        		<td class="dia-table-td dia-table-td2"><i class="fa-regular fa-face-smile"></i></td>
                                        		<td class="dia-table-td">
                                        			<div class="dia-name-div">
                                       					<div class="patient-comment-div">
                                      						<div class="patient-comment-title"></div>
                                        							
                                       						<div class="patient-comment-content" id="patient-content">
																
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