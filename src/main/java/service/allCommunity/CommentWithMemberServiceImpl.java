package service.allCommunity;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import dao.allCommunity.CommentWithMemberDao;
import dao.allCommunity.CommentWithMemberDaoImpl;
import dto.CommentWithMemberDto;
import dto.MyCommunityDto;
import util.MybatisSqlSessionFactory;
import util.PageInfo;

public class CommentWithMemberServiceImpl implements CommentWithMemberService{
	private SqlSessionFactory sqlSessionFactory = MybatisSqlSessionFactory.getSessionFactory();
	private CommentWithMemberDao commentWithMemberDao;
	
	public CommentWithMemberServiceImpl() {
		commentWithMemberDao = new CommentWithMemberDaoImpl(); 
	}
	@Override
	public List<CommentWithMemberDto> getMemWithCom(Integer uNo) throws Exception {
		return commentWithMemberDao.selectMemberWithComment(uNo);
	}
	@Override
	public List<CommentWithMemberDto> listByCommentPage(PageInfo pageInfo, Integer uNo) throws Exception {
		try(SqlSession session = sqlSessionFactory.openSession()) {
			Map<String, Object> param = new HashMap<>();
			param.put("row", (pageInfo.getCurPage() - 1) * 10); // <- 음수 제거
		    param.put("uNo", uNo);
		    
		    Integer allPage = (int)Math.ceil((double)commentWithMemberDao.selectCommentCount(uNo)/10); // 전체 페이지 수
			// startPage : 1 ~ 10 => 1, 11 ~ 20 => 11
			Integer startPage = (pageInfo.getCurPage()-1)/10 * 10 + 1;
			Integer endPage = startPage  +10 - 1;
			if(endPage > allPage) endPage = allPage;
			
			pageInfo.setAllPage(allPage);
			pageInfo.setStartPage(startPage);
			pageInfo.setEndPage(endPage);
		    return session.selectList("mapper.comment.selectMemberWithComment", param);
		}
	}
	
}
