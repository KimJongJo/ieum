package dao.file;

import dto.FileDto;

public interface FileDao {
	FileDto selectFileByFileNo(Integer fileNo) throws Exception;
	void insertFile(FileDto fileDto) throws Exception;
	void updateFile(FileDto fileDto) throws Exception;
	Integer uploadFile(FileDto fileDto);
	
	
}
