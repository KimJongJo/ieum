package dto.otherDto;

import java.util.List;

import dto.MemberDto;

public class MemberPageResponseDto {
	
	private List<MemberDto> list;
    private int curPage;
    private int allPage;
    private int startPage;
    private int endPage;
    private int totalCount;
    
	public MemberPageResponseDto(List<MemberDto> list, int curPage, int allPage, int startPage, int endPage,
			int totalCount) {
		super();
		this.list = list;
		this.curPage = curPage;
		this.allPage = allPage;
		this.startPage = startPage;
		this.endPage = endPage;
		this.totalCount = totalCount;
	}

	public List<MemberDto> getList() {
		return list;
	}

	public void setList(List<MemberDto> list) {
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
