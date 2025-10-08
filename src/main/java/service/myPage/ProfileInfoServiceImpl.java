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
	public void updateProfile(MemberDto memberDto, Part file) throws Exception {
		memberDao.updateProfile(memberDto);
		Integer fileNo = memberDao.selectFileNo(memberDto.getuNo());
		FileDto fileDto = fileService.getFile(fileNo);
		 // 파일 경로가 img 또는 img/userProfile인 경우 업데이트
        if(fileDto != null && 
           (fileDto.getFilePath().equals("img") || fileDto.getFilePath().equals("img/userProfile"))) {
            fileService.updateFile(file, "userFile", fileDto);
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
