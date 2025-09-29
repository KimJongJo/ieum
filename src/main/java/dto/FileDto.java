package dto;

public class FileDto {
	Integer fileNo;
	String fileName;
	String filePath;
	String fileCategory;
	
	public FileDto() {}

	public FileDto(Integer fileNo, String fileName, String filePath, String fileCategory) {
		super();
		this.fileNo = fileNo;
		this.fileName = fileName;
		this.filePath = filePath;
		this.fileCategory = fileCategory;
	}

	public FileDto(String fileName, String filePath, String fileCategory) {
		super();
		this.fileName = fileName;
		this.filePath = filePath;
		this.fileCategory = fileCategory;
	}
	
	
	@Override
	public String toString() {
		return "FileDto [fileNo=" + fileNo + ", fileName=" + fileName + ", filePath=" + filePath + ", fileCategory="
				+ fileCategory + "]";
	}

	public Integer getFileNo() {
		return fileNo;
	}

	public void setFileNo(Integer fileNo) {
		this.fileNo = fileNo;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getFileCategory() {
		return fileCategory;
	}

	public void setFileCategory(String fileCategory) {
		this.fileCategory = fileCategory;
	}
	
	
	
}
