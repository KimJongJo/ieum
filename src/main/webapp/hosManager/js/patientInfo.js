$(document).ready(function(){
	
		$(document).on("click", ".show-pInfo-btn", function(e){
	    e.stopPropagation();
	    $.ajax({
			url:"/ieum/hosManager/patientMyDiaList",
			type:"POST",
			data:{diaNo:$(this).val()}, // 진단서 번호를 서버에 전달해서
			dataType:"json",			// 해당 환자 번호와, 담당의사 번호를 가져와서
			success:function(res){      // 해당환자와 담당의사의 진단 리스트를 가져와서 화면에 보여줌
				if(res.success){
					var object = res.object;
					var member = object.memberDto;
					var diaList = object.diaList;
					var diaryList = object.diaryList;
					// 화면에 값 넣기
					// 환자정보
					$("#infopNo").text(member.uNo);
					$("#infoBirthDate").text(member.birthDate);
					$("#infoTel").text(member.uTel);
					$("#infoUsername").text(member.username);
					$("#infoGender").text(member.gender);
					$("#infouAddress").text(member.uAddress);
					// 상담 내용
					$("#content").text(object.rContent);
					// 진단기록
					if(diaList.length === 0){
		                $("#dia-table2 tbody").html(
		                   `<tr>
								<td colspan="7">환자의 진단기록이 존재하지 않습니다.</td>
							</tr>`
		                );
		                $(".page-div").html("");
					}else{
						
						let rows = "";
						diaList.forEach(item => {
							rows += `
		           			<tr>
		           				<td class="dia-table-td dia-table-td2">${item.date}</td>
		           				<td class="dia-table-td dia-table-td2">${item.mNm}</td>
		           				<td class="dia-table-td">
		           					<div class="dia-name-div">
		           						<span>${item.diaName}</span>
		           						<button value="${item.diaNo}" class="show-btn">보기</button>
		           					</div>
	          					</td>
		           			</tr>
							`
						});
						$("#dia-table2 tbody").html(rows);
						
					}
					//다이어리
					if(diaryList.length === 0){
		                $("#diary-table").html(
		                   `<tr>
								<td colspan="7">환자의 다이어리 기록이 없거나 비공개상태입니다.</td>
							</tr>`
		                );
		                $(".page-div").html("");
					}else{
						
						let rows = "";
						diaryList.forEach(item => {
							rows += `
							<tr>
                        		<td class="dia-table-td dia-table-td2">${item.formatdCreated}</td>
                        		<td class="dia-table-td dia-table-td2"><i class="fa-regular fa-face-${item.mood}"></i></td>
                        		<td class="dia-table-td">
                    			<div class="dia-name-div">
                					<div class="patient-comment-div">
                						<div class="patient-comment-title">${item.title}</div>
                                        							
                						<div class="patient-comment-content" id="patient-content">
											${item.content}
										</div>
                					</div>
                    				<button class="view-more" id="view-more">
                        				<img src="../img/btn1.png" style="width:15px; height:15px;"/>
            						</button>
		                						
                					</div>
               					</td>
                			</tr>
							`
						});
						$("#diary-table").html(rows);
						
					}
					
				}else{
					console.log(res.message);
				}
			},
			error:function(err){
				console.log(err);
			}
		})
	    
	    $("#modal-dia2").css("display","flex");
	    $("body").css("overflow","hidden");
	});
	

	// 진단서 보기 클릭 시 modalProfile 열기
	$(document).on("click", ".show-dia-btn", function(e) {
	    e.stopPropagation(); // td 이벤트 전파 막기
	    
	    $.ajax({
			url:"/ieum/hosManager/pastDia",
			type:"POST",
			data:{dNo:$(this).val()},
			dataType:"json",
			success:function(res){
				if(res.success){
					var object = res.object;
					// 진단서 채우기
					$("#dia2pNo").text(object.pNo);
					$("#dia2birthDate").text(object.birthDate);
					$("#dia2uTel").text(object.uTel);
					$("#dia2username").text(object.pNm);
					$("#dia2gender").text(object.gender);
					$("#dia2uAddress").text(object.uAddress);
					
					$("#dia2dNo").text(object.diaNo);
					$("#dia2rDate").text(object.rDate);
					$("#dia2hNm").text(object.hNm);
					$("#dia2mName").text(object.mNm);
					$("#dia2major").text(object.major);
					$("#dia2hAddress").text(object.hAddress);
					
					$("#dia2diaName").text(object.diaName);
					$("#dia2sym").text(object.sym);
					$("#dia2summary").text(object.summary);
					$("#dia2treatment").text(object.treatment);
					$("#dia2pre").text(object.pre);
					$("#dia2").text(object.docComment);
					
					
					$("#modal-dia3").css("display", "flex");
	    			$("body").css("overflow", "hidden");
				}else{
					console.log(res.message);
				}
			},
			error:function(err){
				console.log(err);
			}
		})
	    
	    
	});
	
	 $(document).on("click", ".show-btn", function() {
		
		$.ajax({
			url:"/ieum/hosManager/pastDia",
			type:"POST",
			data:{dNo:$(this).val()},
			dataType:"json",
			success:function(res){
				
				// 진단서를 다 비우기
/*				$("#pNo").text("");
					$("#birthDate").text("");
					$("#uTel").text("");
					$("#username").text("");
					$("#gender").text("");
					$("#uAddress").text("");
					
					$("#dNo").text("");
					$("#rDate").text("");
					$("#hNm").text("");
					$("#mName").text("");
					$("#major").text("");
					$("#hAddress").text("");
					
					$("#diaName").text("");
					$("#sym").text("");
					$("#summary").text("");
					$("#treatment").text("");
					$("#pre").text("");
					$("#docComm").text("");*/
				
				if(res.success){
					var object = res.object;
					// 진단서 채우기
					$("#pNo").text(object.pNo);
					$("#birthDate").text(object.birthDate);
					$("#uTel").text(object.uTel);
					$("#username").text(object.pNm);
					$("#gender").text(object.gender);
					$("#uAddress").text(object.uAddress);
					
					$("#dNo").text(object.diaNo);
					$("#rDate").text(object.rDate);
					$("#hNm").text(object.hNm);
					$("#mName").text(object.mNm);
					$("#major").text(object.major);
					$("#hAddress").text(object.hAddress);
					
					$("#diaName").text(object.diaName);
					$("#sym").text(object.sym);
					$("#summary").text(object.summary);
					$("#treatment").text(object.treatment);
					$("#pre").text(object.pre);
					$("#docComm").text(object.docComment);
					
					
					console.log($("#pre").text());
					console.log($("#docComm").text());
					
					
					$("#show-dia-info").css("display", "flex");
	    			$("body").css("overflow", "hidden");
				}else{
					console.log(res.message);
				}
			},
			error:function(err){
				console.log(err);
			}
		})
		
    });
});