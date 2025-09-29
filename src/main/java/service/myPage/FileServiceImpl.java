package service.myPage;

import dao.file.FileDao;
import dao.file.FileDaoImpl;
import dto.FileDto;

public class FileServiceImpl implements FileService{
	private FileDao fileDao;
	
	public FileServiceImpl() {
		fileDao = new FileDaoImpl();
	}
	
	@Override
	public FileDto getFileByFileNo(int fileNo) throws Exception {
		return fileDao.selectFileByUserId(fileNo);
	}

}
