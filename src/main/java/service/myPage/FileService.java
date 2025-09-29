package service.myPage;

import dto.FileDto;

public interface FileService {
	 FileDto getFileByUserId(int userId) throws Exception;
}
