package dto;

public class FileDto {
	Integer fileNo;
	String fileName;
	String filePath;
	String fileCategory; 
	
	public FileDto() {}
	
	public FileDto(Integer fileNo, String fileName, String filePath,
			String fileCategory) {
		super();
		this.fileNo = fileNo; //저장번호
		this.fileName = fileName; //지성.jpg
		this.filePath = filePath; //어디로 저장되는지? webapp -> img -> 이안에 지성.jpg
		this.fileCategory = fileCategory; //null로 주세요
	}	

	@Override
	public String toString() {
		return "file [fileNo=" + fileNo + ", fileName=" + fileName + ", filePath=" + filePath + ", fileSize=" + ", filecategory=" + fileCategory + "]";
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
