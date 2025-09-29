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
	public FileDto getFileByFileNo(Integer fileNo) throws Exception {
		
		return fileDao.selectFileByFileNo(fileNo);
	}

	@Override
	public void insertFile(FileDto fileDto) throws Exception {
		fileDao.insertFile(fileDto);
		
	}

	@Override
	public void updateFile(FileDto fileDto) throws Exception {
		fileDao.updateFile(fileDto);
		
	}
}
