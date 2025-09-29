package service.file;

import dao.file.FileDao;
import dao.file.FileDaoImpl;
import dto.FileDto;

public class FileServiceImpl implements FileService {
	
	FileDao fileDao;
	
	public FileServiceImpl() {
		fileDao = new FileDaoImpl();
	}

	// 회원가입시 일반 회원 이미지 넣기
	@Override
	public Integer normalImg(FileDto file) {
		
		return fileDao.normalImg(file);
	}

}
