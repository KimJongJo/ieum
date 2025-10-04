package service.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mindrot.jbcrypt.BCrypt;

import dao.member.MemberDao;
import dao.member.MemberDaoImpl;
import dto.FileDto;
import dto.MemberDto;
import service.file.FileService;
import service.file.FileServiceImpl;
public class MemberServiceImpl implements MemberService {

	MemberDao memberDao;
	FileService fileService;
	
	public MemberServiceImpl() {
		memberDao = new MemberDaoImpl();
		fileService = new FileServiceImpl();
	}
	
	// 사용 가능한 아이디인지 확인
	@Override
	public boolean checkUserId(String userId) {
		
		MemberDto member = memberDao.checkId(userId);
		
		if(member == null) {
			return false; // 사용 가능
		}else {
			return true; // 존재하는 아이디
			
		}
	}
	
	// 일반 유저, 병원관리자 회원가입 
	@Override
	public void normalJoin(MemberDto member) {
		
		String filePath;
		FileDto file;
		Integer fileNo;
		// 일반회원
		if(member.gethNo() == null) {
			filePath = "img/userProfile";
			file = new FileDto("회원이미지.jpg",filePath,"userProfile");
		}else { // 병원 관리자
			filePath = "img/managerProfile";
			file = new FileDto("회원이미지.jpg",filePath,"managerProfile");
		}
		fileNo = fileService.normalImg(file);
		member.setFileNo(fileNo);
		
		if(member.gethNo() == null) {
			memberDao.normalJoin(member);
		}else {
			memberDao.managerJoin(member);
		}
		
	}

	// 아이디 찾기 시 보여줄 아이디 반환
	@Override
	public Map<String, Object> findId(String email) {
		
		Map<String, Object> userMap = memberDao.findId(email);
		String userType = (String)userMap.get("userType");
		if(userType.equals("USER")) {
			userMap.put("userType", "일반회원");
		}else {
			userMap.put("userType", "병원관리자");
		}
		
		return userMap;
	}

	// 비밀번호 변경
	@Override
	public int changePw(String userId, String password) {
		Map<String, Object> userMap = new HashMap<String, Object>();
		
		// 현재 사용중인 비밀번호와 비교
		String beforePw = memberDao.beforePw(userId);
		
		// 값이 안들어왔을때
		if(userId == null || password == null) {
			return 2;
		}
		
		if(BCrypt.checkpw(password, beforePw)) {
			return 1;
		}else {
			// 비밀번호 암호화
			String securityPw = BCrypt.hashpw(password, BCrypt.gensalt());
			
			userMap.put("userId", userId);
			userMap.put("password", securityPw);
			memberDao.changePw(userMap);
			
			return 0;
		}
		
		
		
	}

	// 로그인
	@Override
	public int login(String userId, String password) {
		
		Map<String, Object> userNoAndPw = memberDao.existIdtoPw(userId);
		if(userNoAndPw == null) return 0; // 아이디가 존재하지 않을때
		
		String hashedPw = userNoAndPw.get("password").toString().trim();
		
		if (hashedPw == null || !BCrypt.checkpw(password, hashedPw)) {
		    return -1; // 비밀번호가 틀렸을때
		}else { // 로그인 성공했을때
			return (Integer)userNoAndPw.get("userNo");
		}
	}
	
	@Override
	public MemberDto selectByNickName(Integer uNo) throws Exception {
		return memberDao.selectByNickName(uNo);
	}
	
	// 의사 리스트 가져오기

	@Override
	public List<MemberDto> DoclistBy2(Integer hNo) throws Exception {
		return memberDao.docList(hNo);
		
	}

	// 소셜로그인 할때 아이디가 존재하는지 검사
	@Override
	public MemberDto socialIdCheck(String idStr) {

		return memberDao.checkId(idStr);
	}

	
	// 카카오 회원가입
	@Override
	public Integer socialSignUp(MemberDto member) {
		
		return memberDao.kakaoSignUp(member);
	}

	// 네이버 이메일 체크
	@Override
	public MemberDto emailCheck(String email) {

		return memberDao.checkEmail(email);
	}
	
	// 병합할때 비밀번호 확인
	@Override
	public boolean checkPw(String email, String password) {
		
		MemberDto member = memberDao.checkEmail(email);
		
		return BCrypt.checkpw(password, member.getPassword());
	}

	@Override
	public MemberDto socialUpdate(String email, String id) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("email", email);
		map.put("id", id);
		memberDao.socialUpdate(map);		
		return memberDao.checkEmail(email);
	}

  
	@Override
	public MemberDto selectResUser(Integer uNo) throws Exception {
		return memberDao.selectProfileInfo(uNo);
	}

}
