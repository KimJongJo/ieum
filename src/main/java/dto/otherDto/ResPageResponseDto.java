package dto.otherDto;

import java.util.List;

public class ResPageResponseDto {
	
	private List<DiagnosisInfoDto> list;
    private int curPage;
    private int allPage;
    private int startPage;
    private int endPage;
    private int totalCount;
    
	public ResPageResponseDto(List<DiagnosisInfoDto> list, int curPage, int allPage, int startPage, int endPage,
			int totalCount) {
		super();
		this.list = list;
		this.curPage = curPage;
		this.allPage = allPage;
		this.startPage = startPage;
		this.endPage = endPage;
		this.totalCount = totalCount;
	}

	@Override
	public String toString() {
		return "ResPageResponseDto [list=" + list + ", curPage=" + curPage + ", allPage=" + allPage + ", startPage="
				+ startPage + ", endPage=" + endPage + ", totalCount=" + totalCount + "]";
	}

	public List<DiagnosisInfoDto> getList() {
		return list;
	}

	public void setList(List<DiagnosisInfoDto> list) {
		this.list = list;
	}

	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}

	public int getAllPage() {
		return allPage;
	}

	public void setAllPage(int allPage) {
		this.allPage = allPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	
    
    

}
