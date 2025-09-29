package service.allCommunity;

import java.util.List;

import dto.CommuCategoryDto;

public interface CategoryService {
	List<CommuCategoryDto> selectAll() throws Exception;
	
	CommuCategoryDto selectByNo(Integer categoryNo) throws Exception;
	
}
