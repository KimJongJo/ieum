package dao.member;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import dto.MemberDto;
import dto.MemberProfileDto;
import util.MybatisSqlSessionFactory;

public class MemberDaoImpl implements MemberDao{		
	private SqlSession session;
	
	public MemberDaoImpl() {
		session = MybatisSqlSessionFactory.getSessionFactory().openSession(true);
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
	public void managerJoin(MemberDto member) {
		session.insert("managerJoin", member);
		session.commit();
		
	}

	@Override
	public Map<String, Object> findId(String email) {
		
		return session.selectOne("findId", email);
	}

	@Override
	public void changePw(Map<String, Object> userMap) {
		session.update("changePw", userMap);
		session.commit();
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
    public MemberProfileDto selectMemberWithProfile(int uNo) throws Exception {
        return session.selectOne("mapper.member.selectMemberWithProfile", uNo);
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
	
	
	// 지성이가 작성한 .....
	public MemberDto selectFindById(Integer uNo) throws Exception {
		return session.selectOne("mapper.member.selectId", uNo);
	}
	
	
	
	//비밀번호를 알고 있다고는 가정으로 비밀번호 업데이트
	@Override
	public void updatePassword(MemberDto memberDto) throws Exception {
		session.update("mapper.member.updatePass", memberDto);
		session.commit();
		
	}
	//병원에 근무하는 의사 수, 의사 리스트
	@Override
	public Integer docCnt(Integer hNo) throws Exception {
		return session.selectOne("mapper.member.docCnt",hNo);
	}

	@Override
	public List<MemberDto> docList(Integer hNo) throws Exception {
		return session.selectList("mapper.member.docList",hNo);
	}
}
