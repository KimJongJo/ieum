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

   // 관리자 회원 회원가입 기본 회원 이미지 넣기
   @Override
   public Integer managerJoin(FileDto file) {

      return fileDao.uploadFile(file);
   }

   // 병원 파일 업로드
   @Override
   public Integer uploadFile(Part file, String type, String realFilePath) throws IOException {

      String fileName = file.getSubmittedFileName();

      String filePath;
      FileDto fileDto;
      if (type.equals("hosImg")) { // 병원 이미지 파일이면
         realFilePath += "img\\hosImg";
         filePath = "img\\hosImg\\";
         fileDto = new FileDto(fileName, filePath, "hosProfile");
      } else if (type.equals("noticeFile")) { // 공지사항 파일이면
         realFilePath += "file\\notice";
         filePath = "file\\notice\\";
         fileDto = new FileDto(fileName, filePath, "noticeFile");
         System.out.println("fileDto"  +  fileDto);
      } else { // 사업자등록증파일이면
         realFilePath += "img\\hosRe";
         filePath = "img\\hosRe\\";
         fileDto = new FileDto(fileName, filePath, "hosRequestFile");
      }
      
      // ✅ 경로가 존재하지 않으면 폴더 생성
      File dir = new File(realFilePath);
      if (!dir.exists()) {
          boolean created = dir.mkdirs(); // 상위 디렉토리까지 전부 생성
          if (created) {
              System.out.println("📁 디렉토리 생성 완료: " + realFilePath);
          } else {
              System.out.println("⚠️ 디렉토리 생성 실패: " + realFilePath);
          }
      }
      
      // 파일을 서버에 실제로 저장 (write)
      file.write(realFilePath + File.separator + fileName);

      Integer no = fileDao.uploadFile(fileDto);
      return no;
   }

	@Override
	public FileDto getFile(Integer fileNo) {
		FileDto dto = fileDao.getFile(fileNo);
		return fileDao.getFile(fileNo);
	}

	@Override
	public FileDto updateFile(Part file, String type, FileDto fileDto, String realPath) throws Exception{
        String filePath;
        if("user".equals(type)) {
        	filePath = "img/userProfile";
        }else {
        	filePath = "img/managerProfile";
        }
        
        // 파일 이름 중복 방지 기본 이름 앞에 UUID를 붙임
        String originalFileName = file.getSubmittedFileName();
        String newFileName = UUID.randomUUID().toString() + "-" + originalFileName;
        
        fileDto.setFileName(newFileName);
        
        fileDto.setFilePath(filePath);
        file.write(realPath + filePath + File.separator + newFileName);
        fileDao.updateFile(fileDto);
        
        return fileDto;
	}

	// 기존 이미지 파일 제거
	@Override
	public void deleteFile(FileDto fileDto, String realPath) {
		
        // 기존 파일 삭제
        String oldFileName = fileDto.getFileName(); // DB에 저장되어 있는 기존 파일명
        
        if(oldFileName != null && !oldFileName.isEmpty()) {
            File oldFile = new File(realPath + fileDto.getFilePath() + File.separator + oldFileName);
            if(oldFile.exists()) {
                if(oldFile.delete()) {
                    System.out.println("기존 파일 삭제 성공: " + oldFileName);
                } else {
                    System.out.println("기존 파일 삭제 실패: " + oldFileName);
                }
            }
        }
	}
}
