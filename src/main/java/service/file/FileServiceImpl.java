package service.file;

import java.util.UUID;

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
		
		return fileDao.uploadFile(file);
	}

	// 병원 파일 업로드
	@Override
	public Integer uploadFile(String hosImgFileName, String type) {
		// 파일 이름이 똑같으면 안되니까 UUID를 추가한 파일명으로 개명
		String newFileName = hosImgFileName + UUID.randomUUID().toString();
		String filePath;
		if(type.equals("hosImg")) { // 병원 이미지 파일이면
			filePath = "C:\\Users\\KOSTA\\git\\kosta-ieum\\src\\main\\webapp\\img\\hosImg";
		}else { // 사업자등록증파일이면 
			filePath = "C:\\Users\\KOSTA\\git\\kosta-ieum\\src\\main\\webapp\\img\\hogReImg";
		}
		FileDto fileDto = new FileDto(newFileName, filePath, "hosProfile");
		
		return fileDao.uploadFile(fileDto);
	}
	
	

}
