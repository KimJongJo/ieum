package dao.member;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import dto.MemberDto;

import util.MybatisSqlSessionFactory;

public class MemberDaoImpl implements MemberDao{		
	private SqlSession session;
	
	public MemberDaoImpl() {
		session = MybatisSqlSessionFactory.getSessionFactory().openSession();
	}
	
	@Override
	public MemberDto checkId(String userId) {
		
		return session.selectOne("checkId", userId);
	}

	@Override
	public void normalJoin(MemberDto member) {
		session.insert("normalJoin", member);
		session.commit();
		
	}

	@Override
	public Map<String, Object> findId(String email) {
		
		return session.selectOne("findId", email);
	}

	@Override
	public void changePw(Map<String, Object> userMap) {
		session.update("changePw", userMap);
  }
  @Override
	public MemberDto selectByNickName(Integer uNo) throws Exception {
		return session.selectOne("mapper.member.selectByNickName", uNo);
	}

	@Override
	public MemberDto selectProfileInfo(Integer uNo) throws Exception {
		return session.selectOne("mapper.member.selectProfileInfo", uNo);
	}

	@Override
	public void updateProfile(MemberDto memberDto) throws Exception {
		session.update("mapper.member.updateProfile", memberDto);
		session.commit();
	}

	@Override
	public String beforePw(String userId) {
		
		return session.selectOne("beforePw", userId);
	}

	// 아이디를 검색해서 존재하는 회원이면 암호화된 비밀번호 반환
	@Override
	public Map<String, Object> existIdtoPw(String userId) {
		
		return session.selectOne("existId", userId);
	}
	public MemberDto selectFindById(Integer uNo) throws Exception {
		return session.selectOne("mapper.member.selectId", uNo);
	}

	@Override
	public void updatePassword(MemberDto memberDto) throws Exception {
		session.update("mapper.member.updatePass", memberDto);
		session.commit();
		
	}
}
