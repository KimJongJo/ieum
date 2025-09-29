package service.allCommunity;

import java.util.List;

import dao.allCommunity.CategoryDao;
import dao.allCommunity.CategoryDaoImpl;
import dto.CommuCategoryDto;
import dto.CommunityDto;

public class CategoryServiceImpl implements CategoryService{
	
	private CategoryDao categoryDao;
	
	public CategoryServiceImpl() {
		categoryDao = new CategoryDaoImpl();
	}

	@Override
	public List<CommuCategoryDto> selectAll() throws Exception {

		return categoryDao.selectAllCategory();
	}

	@Override
	public CommuCategoryDto selectByNo(Integer categoryNo) throws Exception {
		return categoryDao.selectByNo(categoryNo);
	}
}
