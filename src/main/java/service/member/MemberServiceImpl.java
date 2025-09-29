package service.member;

import java.util.HashMap;
import java.util.Map;

import org.mindrot.jbcrypt.BCrypt;

import dao.member.MemberDao;
import dao.member.MemberDaoImpl;
import dto.MemberDto;
public class MemberServiceImpl implements MemberService {

	MemberDao memberDao;
	
	public MemberServiceImpl() {
		memberDao = new MemberDaoImpl();
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
	
	// 일반 유저 회원가입 
	@Override
	public void normalJoin(MemberDto member) {
		memberDao.normalJoin(member);
		
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
	@Override
	public MemberDto selectByNickName(Integer uNo) throws Exception {
		return memberDao.selectByNickName(uNo);
	}

}
