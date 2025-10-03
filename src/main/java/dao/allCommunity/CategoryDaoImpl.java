package dao.allCommunity;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import dto.CommuCategoryDto;
import util.MybatisSqlSessionFactory;

public class CategoryDaoImpl implements CategoryDao{
	private SqlSessionFactory sqlSessionFactory = MybatisSqlSessionFactory.getSessionFactory();
	
	@Override
	public List<CommuCategoryDto> selectAllCategory() throws Exception {
		try(SqlSession session = sqlSessionFactory.openSession()) {
			return session.selectList("mapper.commu_category.selectAll");
		}
	}
	@Override
	public CommuCategoryDto selectByNo(Integer categoryNo) throws Exception {
		try(SqlSession session = sqlSessionFactory.openSession()) {
			return session.selectOne("mapper.commu_category.selectByNo", categoryNo);
		}
	}

}
