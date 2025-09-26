package dto.otherDto;

public class responseDto {
	private boolean success; // 성공 여부
    private String message;  // 성공/실패 메시지
    
	public responseDto() {
		super();
	}

	public responseDto(boolean success, String message) {
		super();
		this.success = success;
		this.message = message;
	}

	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
    
    
}
