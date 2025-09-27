package dao.member;

import org.apache.ibatis.session.SqlSession;

import dto.MemberDto;
import util.MybatisSqlSessionFactory;

public class MemberDaoImpl implements MemberDao{		
	private SqlSession session;
	
	public MemberDaoImpl() {
		session = MybatisSqlSessionFactory.getSessionFactory().openSession();
	}
	
	@Override
	public MemberDto selectByNickName(Integer uNo) throws Exception {
		return session.selectOne("mapper.member.selectByNickName", uNo);
	}

}
