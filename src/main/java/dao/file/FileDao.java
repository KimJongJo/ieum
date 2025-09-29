package dao.file;

import dto.FileDto;

public interface FileDao {
	FileDto selectFileByUserId(Integer fileNo) throws Exception;
	int insertFile(FileDto fileDto) throws Exception;
	int updateFile(FileDto fileDto) throws Exception;
}
