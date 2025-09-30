package service.myPage;

import dto.FileDto;

public interface FileService {
	FileDto getFileByFileNo(Integer fileNo) throws Exception;
	void insertFile(FileDto fileDto) throws Exception;
	void updateFile(FileDto fileDto) throws Exception;
}
