package dao.allCommunity;

import org.apache.ibatis.session.SqlSession;

import dto.CommunityDto;
import dto.MyCommunityDto;
import util.MybatisSqlSessionFactory;

public class CommunityDaoImpl implements CommunityDao{
	private SqlSession session;
	public CommunityDaoImpl() {
		session = MybatisSqlSessionFactory.getSessionFactory().openSession();
	}
	
	@Override
	public void insert(CommunityDto community) throws Exception {
			session.insert("mapper.community.insertCommunity", community);
			session.commit();
	}
	
	// 게시글 삭제
	@Override
	public int deleteCommunity(int commuNo) throws Exception {
		int result = session.delete("mapper.community.deleteCommunity", commuNo);
		session.commit();
		return result;
		
	}
	 // 게시글 조회
	@Override
	public CommunityDto selectByNo(int commuNo) throws Exception {
		return session.selectOne("mapper.community.selectByNo", commuNo);
	}

	@Override
	public void updateCommu(MyCommunityDto myCommunityDto) throws Exception {
		session.update("mapper.community.updateCommunity", myCommunityDto);
		session.commit();
	}

}
