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
	public MemberDto selectFindById(Integer uNo) throws Exception {
		return session.selectOne("mapper.member.selectId", uNo);
	}

	@Override
	public void updatePassword(MemberDto memberDto) throws Exception {
		session.update("mapper.member.updatePass", memberDto);
		session.commit();
		
	}
	
	
	
}
