package service.myPage;

import javax.servlet.http.Part;

import service.file.FileService;
import service.file.FileServiceImpl;
import dao.member.MemberDao;
import dao.member.MemberDaoImpl;
import dto.FileDto;
import dto.MemberDto;
import dto.MemberProfileDto;

public class ProfileInfoServiceImpl implements ProfileInfoService{
	private MemberDao memberDao;
	private FileService fileService;
	
	
	public ProfileInfoServiceImpl() {
		memberDao = new MemberDaoImpl();
		fileService = new FileServiceImpl();
	}

	@Override
	public MemberDto selectProfileView(Integer uNo) throws Exception {
		return memberDao.selectProfileInfo(uNo);
	}

	@Override
	public void updateProfile(MemberDto memberDto, Part file, String type, String realPath) throws Exception {
		// 일반 유저일때랑 병원관리자일때랑 들어가는 값이 다름
		if("user".equals(type)) { // 일반유저일때
			memberDao.updateProfile(memberDto);
		}else { // 병원 관리자일때
			memberDao.updateManageProfile(memberDto);
		}
		
		Integer fileNo = memberDao.selectFileNo(memberDto.getuNo());
		FileDto fileDto = fileService.getFile(fileNo);
		 // 파일 경로가 img 또는 img/userProfile인 경우 업데이트
		
		if(fileDto != null) {
			if(!fileDto.getFilePath().equals("img")) { // 만약 기본 회원 사진이 아닐때 기존 사진을 제거
				
				fileService.deleteFile(fileDto, realPath);
			}
			// 파일 이미지 변경
			fileService.updateFile(file, type, fileDto, realPath);
		}

        
	}

	@Override
	public MemberProfileDto selectMemberWithProfile(Integer uNo) throws Exception {
		return memberDao.selectMemberWithProfile(uNo);
	}

	@Override
	public MemberProfileDto selectMemberWithProFileImg(Integer uNo) throws Exception {
		return memberDao.selectProFileView(uNo);
	}	

}
