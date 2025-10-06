package dto.otherDto;

import java.util.List;

import dto.HospitalDto;

public class HospitalPageResponseDto<T> {
	
    private List<T> list;
    private int curPage;
    private int allPage;
    private int startPage;
    private int endPage;
    private int totalCount;
    
	public HospitalPageResponseDto(List<T> list, int curPage, int allPage, int startPage, int endPage,
			int totalCount) {
		super();
		this.list = list;
		this.curPage = curPage;
		this.allPage = allPage;
		this.startPage = startPage;
		this.endPage = endPage;
		this.totalCount = totalCount;
	}


	public List<T> getList() {
		return list;
	}

	public void setList(List<T> list) {
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
