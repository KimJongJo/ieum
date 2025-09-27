package dao.allCommunity;

import java.util.List;

import dto.CommuCategoryDto;

public interface CategoryDao {
	List<CommuCategoryDto> selectAllCategory() throws Exception;
	
	CommuCategoryDto selectByNo(Integer categoryNo) throws Exception;
	
}
