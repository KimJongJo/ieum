package service.allCommunity;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import dao.allCommunity.CommentDao;
import dao.allCommunity.CommentDaoImpl;
import dao.allCommunity.CommunityDao;
import dao.allCommunity.CommunityDaoImpl;
import dto.AllCommunityDto;
import dto.CommunityDto;
import dto.MyCommunityDto;
import util.MybatisSqlSessionFactory;
import util.PageInfo;

public class CommunityServiceImpl implements CommunityService{
	private SqlSessionFactory sqlSessionFactory = MybatisSqlSessionFactory.getSessionFactory();
	private CommunityDao communityDao;
	private CommentDao commentDao;
	private SqlSession session;
	
	public CommunityServiceImpl() {
		session = MybatisSqlSessionFactory.getSessionFactory().openSession();
		communityDao = new CommunityDaoImpl();
		commentDao = new CommentDaoImpl();
	}

	@Override
	public Integer insertCommunity(CommunityDto community) throws Exception {
		communityDao.insert(community);
		session.commit();
		return community.getCommuNo();
	}

	@Override
	public CommunityDto selectByNo(Integer commuNo) throws Exception {
		return session.selectOne("mapper.community.selectByNo", commuNo);
	} 
	
	
	@Override
	public void deleteCommunityWithComments(int commuNo) throws Exception {
		// 1. 댓글 삭제
        commentDao.deleteCommentsByCommuNo(commuNo);
        // 2. 게시글 삭제
        communityDao.deleteCommunity(commuNo);
        session.commit();
		
	}

	@Override
	public void updateCommunity(MyCommunityDto myCommunity) throws Exception {
		communityDao.updateCommu(myCommunity);
		session.commit();
		
	}

	@Override
	public CommunityDto updateViews(int commuNo) throws Exception {
		communityDao.updateViewsCount(commuNo);
		return communityDao.selectByNo(commuNo);
	}

	@Override
	public int getWriterNoByCommuNo(int commuNo) throws Exception {
		
		return communityDao.selectWriterNoByCommuNo(commuNo);
	}

	@Override
	public Integer getCommunityAuthorNo(int commuNo) throws Exception{
		return communityDao.getCommunityAuthorNo(commuNo);
	}
}
