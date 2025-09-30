package service.file;

import dto.FileDto;

public interface FileService {
	Integer normalImg(FileDto file);

	Integer uploadFile(String hosImgFileName, String type);

}
