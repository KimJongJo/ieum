package dao.member;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import dto.MemberDto;
import util.MybatisSqlSessionFactory;

public class MemberDaoImpl implements MemberDao {

	SqlSession session;
	
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
		session.commit();
	}

	@Override
	public String beforePw(String userId) {
		
		return session.selectOne("beforePw", userId);
	}

}
