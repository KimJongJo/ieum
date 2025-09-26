package dao.allCommunity;

import java.util.List;

import dto.CommuCategoryDto;

public interface CategoryDao {
	List<CommuCategoryDto> selectAllCategory() throws Exception;
	
}
