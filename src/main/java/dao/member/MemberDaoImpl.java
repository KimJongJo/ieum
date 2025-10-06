package dao.member;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import dto.MemberDto;
import dto.MemberProfileDto;
import util.MybatisSqlSessionFactory;

public class MemberDaoImpl implements MemberDao{		
	private SqlSessionFactory sqlSessionFactory = MybatisSqlSessionFactory.getSessionFactory();
	
	@Override
	public MemberDto checkId(String userId) {
		try(SqlSession session = sqlSessionFactory.openSession()) {
			return session.selectOne("checkId", userId);
		}
	}

	@Override
	public void normalJoin(MemberDto member) {
		try(SqlSession session = sqlSessionFactory.openSession()) {
			session.insert("normalJoin", member);
			session.commit();
		}
		
	}
	
	@Override
	public void managerJoin(MemberDto member) {
		try(SqlSession session = sqlSessionFactory.openSession()) {
			session.insert("managerJoin", member);
			session.commit();
		}
		
	}

	@Override
	public Map<String, Object> findId(String email) {
		try(SqlSession session = sqlSessionFactory.openSession()) {		
			return session.selectOne("findId", email);
		}
	}

	@Override
	public void changePw(Map<String, Object> userMap) {
		try(SqlSession session = sqlSessionFactory.openSession()) {
			session.update("changePw", userMap);
			session.commit();
		}
  }
  @Override
	public MemberDto selectByNickName(Integer uNo) throws Exception {
		try(SqlSession session = sqlSessionFactory.openSession()) {
			return session.selectOne("mapper.member.selectByNickName", uNo);
		}
	}

	@Override
	public MemberDto selectProfileInfo(Integer uNo) throws Exception {
		try(SqlSession session = sqlSessionFactory.openSession()) {
			return session.selectOne("mapper.member.selectProfileInfo", uNo);
		}
	}
	//정보 수정	
	@Override
    public MemberProfileDto selectMemberWithProfile(int uNo) throws Exception {
		try(SqlSession session = sqlSessionFactory.openSession()) {
			return session.selectOne("mapper.member.selectMemberWithProfile", uNo);
		}
    }
	
	// 업데이트
	@Override
	public void updateProfile(MemberDto memberDto) throws Exception {
		try(SqlSession session = sqlSessionFactory.openSession()) {
			session.update("mapper.member.updateProfile", memberDto);
			session.commit();
		}
	}

	@Override
	public String beforePw(String userId) {
		try(SqlSession session = sqlSessionFactory.openSession()) {
			return session.selectOne("beforePw", userId);
		}
	}

	// 아이디를 검색해서 존재하는 회원이면 암호화된 비밀번호 반환
	@Override
	public Map<String, Object> existIdtoPw(String userId) {
		try(SqlSession session = sqlSessionFactory.openSession()) {
			return session.selectOne("existId", userId);
		}
	}
	
	
	// 지성이가 작성한 .....
	public MemberDto selectFindById(Integer uNo) throws Exception {
		try(SqlSession session = sqlSessionFactory.openSession()) {
			return session.selectOne("mapper.member.selectId", uNo);
		}
	}
	
	
	
	//비밀번호를 알고 있다고는 가정으로 비밀번호 업데이트
	@Override
	public void updatePassword(MemberDto memberDto) throws Exception {
		try(SqlSession session = sqlSessionFactory.openSession()) {
			session.update("mapper.member.updatePass", memberDto);
			session.commit();
		}
		
	}
	//병원에 근무하는 의사 수, 의사 리스트
	@Override
	public Integer docCnt(Integer hNo) throws Exception {
		try(SqlSession session = sqlSessionFactory.openSession()) {
			return session.selectOne("mapper.member.docCnt",hNo);
		}
	}

	@Override
	public List<MemberDto> docList(Integer hNo) throws Exception {
		try(SqlSession session = sqlSessionFactory.openSession()) {
			return session.selectList("mapper.member.docList",hNo);
		}
	}

	@Override
	public Integer kakaoSignUp(MemberDto member) {
		System.out.println(member);
		try(SqlSession session = sqlSessionFactory.openSession()) {
		Integer uNo = session.insert("kakaoSignUp", member);
		session.commit();
		return uNo;
		}
		
	}

	// 네이버 로그인시 이메일이 이미 있는 경우
	@Override
	public MemberDto checkEmail(String email) {
		System.out.println(email);
		try(SqlSession session = sqlSessionFactory.openSession()) {
		return session.selectOne("checkNaverEmail",email);
		}
	}

	@Override
	public void socialUpdate(Map<String, String> map) {
		try(SqlSession session = sqlSessionFactory.openSession()){
			session.update("socialUpdate", map);
			session.commit();
		}
		
	}

	// 예약된 의사 정보
	@Override
	public MemberDto resDoc(Integer mNo) throws Exception {
		try(SqlSession session = sqlSessionFactory.openSession()){
			return session.selectOne("selectMnoDoc", mNo);
		}
	}
}
