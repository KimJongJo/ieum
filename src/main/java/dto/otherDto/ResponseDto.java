package dto.otherDto;

public class ResponseDto {
	private boolean success; // 성공 여부
    private String message;  // 성공/실패 메시지
    private Object object;
    
	public ResponseDto() {
		super();
	}

	public ResponseDto(boolean success, String message) {
		super();
		this.success = success;
		this.message = message;
	}
	
	public ResponseDto(boolean success, String message, Object object) {
		super();
		this.success = success;
		this.message = message;
		this.object = object;
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

	public Object getObject() {
		return object;
	}

	public void setObject(Object object) {
		this.object = object;
	}
	
	
    
    
}
