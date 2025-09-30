package service.file;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.Part;

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
	public Integer uploadFile(Part file, String type) throws IOException {
		
        String fileName = file.getSubmittedFileName();
		
		String filePath;
		FileDto fileDto;
		String realFilePath;
		if(type.equals("hosImg")) { // 병원 이미지 파일이면
			realFilePath = "C:\\Users\\KOSTA\\git\\kosta-ieum\\src\\main\\webapp\\img\\hosImg";
//			realFilePath="C:\\testImg";
			filePath = "img\\hosImg\\";
			fileDto = new FileDto(fileName, filePath, "hosProfile");
		}else { // 사업자등록증파일이면
			realFilePath = "C:\\Users\\KOSTA\\git\\kosta-ieum\\src\\main\\webapp\\img\\hosRe";
//			realFilePath="C:\\testImg";
			filePath = "img\\hosRe\\";
			fileDto = new FileDto(fileName, filePath, "hosRequestFile");
		}
	    // 파일을 서버에 실제로 저장 (write)
	    
		file.write(realFilePath + File.separator + fileName);

		Integer no = fileDao.uploadFile(fileDto);
		return no;
	}
	
	

}
