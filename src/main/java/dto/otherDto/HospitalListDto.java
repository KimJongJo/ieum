package dto.otherDto;

import java.util.List;

import util.PageInfo;

public class HospitalListDto {
	private PageInfo pageInfo;	
	private List<HosSearchListDto> hosSearchDto;
	public PageInfo getPageInfo() {
		return pageInfo;
	}
	public void setPageInfo(PageInfo pageInfo) {
		this.pageInfo = pageInfo;
	}
	public List<HosSearchListDto> getHosSearchDto() {
		return hosSearchDto;
	}
	public void setHosSearchDto(List<HosSearchListDto> hosSearchDto) {
		this.hosSearchDto = hosSearchDto;
	}
	@Override
	public String toString() {
		return "HospitalListDto [pageInfo=" + pageInfo + ", hosSearchDto=" + hosSearchDto + "]";
	}
	
	
}
