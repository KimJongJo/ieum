package service.myPage;

import dto.FileDto;

public interface FileService {
	 FileDto getFileByFileNo(int fileNo) throws Exception;
}
