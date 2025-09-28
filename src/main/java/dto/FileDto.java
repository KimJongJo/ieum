package dto;

public class FileDto {
	Integer fileNo;
	String fileName;
	String filePath;
	String fileSize;
	String filePart;
	String fileCategory;
	Integer uNo;
	
	public FileDto() {}
	
	public FileDto(Integer fileNo, String fileName, String filePath, String fileSize, String filePart,
			String fileCategory, Integer uNo) {
		super();
		this.fileNo = fileNo;
		this.fileName = fileName;
		this.filePath = filePath;
		this.fileSize = fileSize;
		this.filePart = filePart;
		this.fileCategory = fileCategory;
		this.uNo = uNo;
	}	

	@Override
	public String toString() {
		return "file [fileNo=" + fileNo + ", fileName=" + fileName + ", filePath=" + filePath + ", fileSize=" + fileSize
				+ ", filePart=" + filePart + ", filecategory=" + fileCategory + "]";
	}
	
	

	public Integer getuNo() {
		return uNo;
	}

	public void setuNo(Integer uNo) {
		this.uNo = uNo;
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

	public String getFileSize() {
		return fileSize;
	}

	public void setFileSize(String fileSize) {
		this.fileSize = fileSize;
	}

	public String getFilePart() {
		return filePart;
	}

	public void setFilePart(String filePart) {
		this.filePart = filePart;
	}

	public String getFileCategory() {
		return fileCategory;
	}

	public void setFileCategory(String fileCategory) {
		this.fileCategory = fileCategory;
	}
}
