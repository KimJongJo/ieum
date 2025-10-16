package service.allCommunity;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import dao.allCommunity.AllCommunityDao;
import dao.allCommunity.AllCommunityDaoImpl;
import dto.AllCommunityDto;
import util.MybatisSqlSessionFactory;
import util.PageInfo;

public class AllCommunityServiceImpl implements AllCommunityService{
	private SqlSessionFactory sqlSessionFactory = MybatisSqlSessionFactory.getSessionFactory();
	
	private AllCommunityDao allCommunityDao;
	
	public AllCommunityServiceImpl() {
		allCommunityDao = new AllCommunityDaoImpl();
	}
	
	@Override
	public List<AllCommunityDto> getAllCommunity() {
		
		return allCommunityDao.selectAllCommunityList();
	}

	@Override
	public List<AllCommunityDto> listByPage(PageInfo pageInfo , String sort, String category) throws Exception {// String sort 추가도
	    try (SqlSession session = sqlSessionFactory.openSession()) {

	        // 1️⃣ 현재 페이지
	        int curPage = pageInfo.getCurPage() != null ? pageInfo.getCurPage() : 1;

	        // 2️⃣ 시작 row 계산 (20개 기준)
	        int row = (curPage - 1) * 20;

	        // 3️⃣ 전체 페이지 수 계산
	        int totalCount = allCommunityDao.selectCount(category);
	        int allPage = (int) Math.ceil((double) totalCount / 20); // 한 페이지 20개 기준

	        // 4️⃣ 페이지 블록 계산 (한 블록에 10페이지)
	        int startPage = ((curPage - 1) / 10) * 10 + 1;
	        int endPage = startPage + 10 - 1;
	        if (endPage > allPage) endPage = allPage;

	        // 5️⃣ PageInfo에 세팅
	        pageInfo.setCurPage(curPage);
	        pageInfo.setAllPage(allPage);
	        pageInfo.setStartPage(startPage);
	        pageInfo.setEndPage(endPage);

	        // 6️⃣ 게시글 리스트 조회
	        Map<String, Object> param = new HashMap<>();
	        param.put("row", row);
	        param.put("sort", sort); // ✅ 정렬 기준 추가 // 추가됨
	        param.put("category", category);
	        return session.selectList("mapper.community.selectList", param);
	    }
		
	}
	
	@Override
	public Integer getSearchCnt(String keyword) throws Exception {
		return allCommunityDao.getSearchCnt(keyword);
	}

	@Override
	public List<AllCommunityDto> getSearchList(String keyword) throws Exception {
		return allCommunityDao.getSearchList(keyword);
	}
}
