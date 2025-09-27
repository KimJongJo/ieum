package dao.member;

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

}
