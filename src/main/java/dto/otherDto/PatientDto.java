package dto.otherDto;

import java.util.List;

import dto.DiaryDto;
import dto.MemberDto;

public class PatientDto {
	private MemberDto memberDto; // 환자 정보
	private String rContent; // 상담 내용
	private List<DiagnosisInfoDto> diaList; // 진단서 기록
	private List<DiaryDto> diaryList; // 다이어리 기록
	
	public PatientDto(MemberDto memberDto, String rContent, List<DiagnosisInfoDto> diaList,
			List<DiaryDto> diaryList) {
		super();
		this.memberDto = memberDto;
		this.rContent = rContent;
		this.diaList = diaList;
		this.diaryList = diaryList;
	}

	public PatientDto(MemberDto memberDto, String rContent, List<DiagnosisInfoDto> diaList) {
		super();
		this.memberDto = memberDto;
		this.rContent = rContent;
		this.diaList = diaList;
	}

	@Override
	public String toString() {
		return "PatientDto [memberDto=" + memberDto + ", rContent=" + rContent + ", diaList=" + diaList + ", diaryList="
				+ diaryList + "]";
	}
	
	

	public MemberDto getMemberDto() {
		return memberDto;
	}

	public void setMemberDto(MemberDto memberDto) {
		this.memberDto = memberDto;
	}

	public String getrComment() {
		return rContent;
	}

	public void setrComment(String rContent) {
		this.rContent = rContent;
	}

	public List<DiagnosisInfoDto> getDiaList() {
		return diaList;
	}

	public void setDiaList(List<DiagnosisInfoDto> diaList) {
		this.diaList = diaList;
	}

	public List<DiaryDto> getDiaryList() {
		return diaryList;
	}

	public void setDiaryList(List<DiaryDto> diaryList) {
		this.diaryList = diaryList;
	}
	
	
	
	
	
	
}
