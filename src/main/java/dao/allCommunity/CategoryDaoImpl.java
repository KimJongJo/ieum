package dao.allCommunity;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dto.CommuCategoryDto;
import util.MybatisSqlSessionFactory;

public class CategoryDaoImpl implements CategoryDao{
	private SqlSession session;
	
	public CategoryDaoImpl() {
		session = MybatisSqlSessionFactory.getSessionFactory().openSession();
	}
	@Override
	public List<CommuCategoryDto> selectAllCategory() throws Exception {
		return session.selectList("mapper.commu_category.selectAll");
	}

}
