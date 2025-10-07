package dto.otherDto;

import java.sql.Date;

public class ManagerDto {
	
	private Integer uNo; // 관리자 번호
	private String type; // 타입(의사, 병원관리자)
	private String username; // 이름
	private String hosName; // 병원 이름
	private String email; // 이메일
	private Date createdAt; // 가입일
	private Integer stateCode;

}
