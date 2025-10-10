package service.file;

import java.io.IOException;

import javax.servlet.http.Part;

import dto.FileDto;

public interface FileService {
	Integer normalImg(FileDto file);

	Integer uploadFile(Part file, String type) throws IOException;

	Integer managerJoin(FileDto file);

	FileDto getFile(Integer fileNo);

	void updateFile(Part file, String string, FileDto fileDto, String realPath)throws Exception;

	void deleteFile(FileDto fileDto, String realPath);
	
}
