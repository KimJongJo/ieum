package dto.otherDto;

import java.util.List;

import util.PageInfo;

public class HospitalListDto {
	private PageInfo pageInfo;	
	private List<HospitalDetailDto> hospitalDetailDto;
	
	@Override
	public String toString() {
		return "HospitalListDto [pageInfo=" + pageInfo + ", hospitalDetailDto=" + hospitalDetailDto + "]";
	}

	public PageInfo getPageInfo() {
		return pageInfo;
	}

	public void setPageInfo(PageInfo pageInfo) {
		this.pageInfo = pageInfo;
	}

	public List<HospitalDetailDto> getHospitalDetailDto() {
		return hospitalDetailDto;
	}

	public void setHospitalDetailDto(List<HospitalDetailDto> hospitalDetailDto) {
		this.hospitalDetailDto = hospitalDetailDto;
	}
	
	
	
	
	
}
