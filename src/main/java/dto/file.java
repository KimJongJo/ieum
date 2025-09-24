package dto;

public class file {
	Integer fileNo;
	String fileName;
	String filePath;
	String fileSize;
	String filePart;
	String filecategory;
	
	public file() {}
	
	public file(Integer fileNo, String fileName, String filePath, String fileSize, String filePart,
			String filecategory) {
		super();
		this.fileNo = fileNo;
		this.fileName = fileName;
		this.filePath = filePath;
		this.fileSize = fileSize;
		this.filePart = filePart;
		this.filecategory = filecategory;
	}	

	@Override
	public String toString() {
		return "file [fileNo=" + fileNo + ", fileName=" + fileName + ", filePath=" + filePath + ", fileSize=" + fileSize
				+ ", filePart=" + filePart + ", filecategory=" + filecategory + "]";
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

	public String getFilecategory() {
		return filecategory;
	}

	public void setFilecategory(String filecategory) {
		this.filecategory = filecategory;
	}
	
	
	
}


