package dto.otherDto;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.temporal.ChronoUnit;

public class ReservationInfoDto {
	
	Integer rNo; // 예약 번호
	Integer uNo;	// 예약자 번호
	Integer hNo;	// 병원 번호
	Integer mNo;	// 의사 번호
	LocalDate rDate;	// 예약 날짜
	LocalTime rTime;	// 예약 시간
	String rContent;	// 상담 내용
	String actName;	// 실제 방문자
	String actTel;	// 실제 전화번호
	String rStatus;	// 예약상태
	String rDay;	// 요일
	
	String hNm; // 병원 이름
	Integer categoryNo; // 카테고리
	String hAddress; // 병원 주소
	String hLocationY; // 병원 위치 위도
	String hLocationX; // 병원 위치 경도
	String transferInfo; // 근거리 교통 정보
	String holidayInfo; // 휴무 정보
	String hTel; // 전화번호
	String hLink; // 홈페이지 링크
	Integer hosImgFileNo; // 병원 썸네일 파일
	String status; // 활동 상태
	String hCode; // 병원코드
	String city; // 시도
	String gungu; // 시군구
	String services; // 제공하는 편의 시설
	boolean silson; // 실손 24 서비스 제공 여부
	String newsTitle; // 뉴스 제목
	String newsContent; // 뉴스 내용
	
	String categoryName; //카테고리 이름
	
	String username;	// 이름
	String gender;	//성별
	String uTel; //전화번호
	String email;	//이메일
	String userType;	// 회원분류 -> 
	String major; //전공
	String introduction; //자기소개
	Integer stateCode;	//상태코드
	Integer fileNo;	//회원 프로필
	
	String fileName; //파일명
	String filePath; // 경로
	
	long dDay; //디데이
	boolean favorite;
	
	String diagnosisName; // 진단명
	
	public long getdDay() {
		LocalDate today = LocalDate.now();
		return ChronoUnit.DAYS.between(today, rDate);
	}
	
	
	ReservationInfoDto(){
		super();
	}


	

	


	@Override
	public String toString() {
		return "ReservationInfoDto [rNo=" + rNo + ", uNo=" + uNo + ", hNo=" + hNo + ", mNo=" + mNo + ", rDate=" + rDate
				+ ", rTime=" + rTime + ", rContent=" + rContent + ", actName=" + actName + ", actTel=" + actTel
				+ ", rStatus=" + rStatus + ", rDay=" + rDay + ", hNm=" + hNm + ", categoryNo=" + categoryNo
				+ ", hAddress=" + hAddress + ", hLocationY=" + hLocationY + ", hLocationX=" + hLocationX
				+ ", transferInfo=" + transferInfo + ", holidayInfo=" + holidayInfo + ", hTel=" + hTel + ", hLink="
				+ hLink + ", hosImgFileNo=" + hosImgFileNo + ", status=" + status + ", hCode=" + hCode + ", city="
				+ city + ", gungu=" + gungu + ", services=" + services + ", silson=" + silson + ", newsTitle="
				+ newsTitle + ", newsContent=" + newsContent + ", categoryName=" + categoryName + ", username="
				+ username + ", gender=" + gender + ", uTel=" + uTel + ", email=" + email + ", userType=" + userType
				+ ", major=" + major + ", introduction=" + introduction + ", stateCode=" + stateCode + ", fileNo="
				+ fileNo + ", fileName=" + fileName + ", filePath=" + filePath + ", dDay=" + dDay + ", favorite="
				+ favorite + ", diagnosisName=" + diagnosisName + "]";
	}


	public ReservationInfoDto(Integer rNo, Integer uNo, Integer hNo, Integer mNo, LocalDate rDate, LocalTime rTime,
			String rContent, String actName, String actTel, String rStatus, String rDay, String hNm, Integer categoryNo,
			String hAddress, String hLocationY, String hLocationX, String transferInfo, String holidayInfo, String hTel,
			String hLink, Integer hosImgFileNo, String status, String hCode, String city, String gungu, String services,
			boolean silson, String newsTitle, String newsContent, String categoryName, String username, String gender,
			String uTel, String email, String userType, String major, String introduction, Integer stateCode,
			Integer fileNo, String fileName, String filePath, long dDay, boolean favorite, String diagnosisName) {
		super();
		this.rNo = rNo;
		this.uNo = uNo;
		this.hNo = hNo;
		this.mNo = mNo;
		this.rDate = rDate;
		this.rTime = rTime;
		this.rContent = rContent;
		this.actName = actName;
		this.actTel = actTel;
		this.rStatus = rStatus;
		this.rDay = rDay;
		this.hNm = hNm;
		this.categoryNo = categoryNo;
		this.hAddress = hAddress;
		this.hLocationY = hLocationY;
		this.hLocationX = hLocationX;
		this.transferInfo = transferInfo;
		this.holidayInfo = holidayInfo;
		this.hTel = hTel;
		this.hLink = hLink;
		this.hosImgFileNo = hosImgFileNo;
		this.status = status;
		this.hCode = hCode;
		this.city = city;
		this.gungu = gungu;
		this.services = services;
		this.silson = silson;
		this.newsTitle = newsTitle;
		this.newsContent = newsContent;
		this.categoryName = categoryName;
		this.username = username;
		this.gender = gender;
		this.uTel = uTel;
		this.email = email;
		this.userType = userType;
		this.major = major;
		this.introduction = introduction;
		this.stateCode = stateCode;
		this.fileNo = fileNo;
		this.fileName = fileName;
		this.filePath = filePath;
		this.dDay = dDay;
		this.favorite = favorite;
		this.diagnosisName = diagnosisName;
	}


	public Integer getrNo() {
		return rNo;
	}


	public void setrNo(Integer rNo) {
		this.rNo = rNo;
	}


	public Integer getuNo() {
		return uNo;
	}


	public void setuNo(Integer uNo) {
		this.uNo = uNo;
	}


	public Integer gethNo() {
		return hNo;
	}


	public void sethNo(Integer hNo) {
		this.hNo = hNo;
	}


	public Integer getmNo() {
		return mNo;
	}


	public void setmNo(Integer mNo) {
		this.mNo = mNo;
	}


	public LocalDate getrDate() {
		return rDate;
	}


	public void setrDate(LocalDate rDate) {
		this.rDate = rDate;
	}


	public LocalTime getrTime() {
		return rTime;
	}


	public void setrTime(LocalTime rTime) {
		this.rTime = rTime;
	}


	public String getrContent() {
		return rContent;
	}


	public void setrContent(String rContent) {
		this.rContent = rContent;
	}


	public String getActName() {
		return actName;
	}


	public void setActName(String actName) {
		this.actName = actName;
	}


	public String getActTel() {
		return actTel;
	}


	public void setActTel(String actTel) {
		this.actTel = actTel;
	}


	public String getrStatus() {
		return rStatus;
	}


	public void setrStatus(String rStatus) {
		this.rStatus = rStatus;
	}


	public String getrDay() {
		return rDay;
	}


	public void setrDay(String rDay) {
		this.rDay = rDay;
	}


	public String gethNm() {
		return hNm;
	}


	public void sethNm(String hNm) {
		this.hNm = hNm;
	}


	public Integer getCategoryNo() {
		return categoryNo;
	}


	public void setCategoryNo(Integer categoryNo) {
		this.categoryNo = categoryNo;
	}


	public String gethAddress() {
		return hAddress;
	}


	public void sethAddress(String hAddress) {
		this.hAddress = hAddress;
	}


	public String gethLocationY() {
		return hLocationY;
	}


	public void sethLocationY(String hLocationY) {
		this.hLocationY = hLocationY;
	}


	public String gethLocationX() {
		return hLocationX;
	}


	public void sethLocationX(String hLocationX) {
		this.hLocationX = hLocationX;
	}


	public String getTransferInfo() {
		return transferInfo;
	}


	public void setTransferInfo(String transferInfo) {
		this.transferInfo = transferInfo;
	}


	public String getHolidayInfo() {
		return holidayInfo;
	}


	public void setHolidayInfo(String holidayInfo) {
		this.holidayInfo = holidayInfo;
	}


	public String gethTel() {
		return hTel;
	}


	public void sethTel(String hTel) {
		this.hTel = hTel;
	}


	public String gethLink() {
		return hLink;
	}


	public void sethLink(String hLink) {
		this.hLink = hLink;
	}


	public Integer getHosImgFileNo() {
		return hosImgFileNo;
	}


	public void setHosImgFileNo(Integer hosImgFileNo) {
		this.hosImgFileNo = hosImgFileNo;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public String gethCode() {
		return hCode;
	}


	public void sethCode(String hCode) {
		this.hCode = hCode;
	}


	public String getCity() {
		return city;
	}


	public void setCity(String city) {
		this.city = city;
	}


	public String getGungu() {
		return gungu;
	}


	public void setGungu(String gungu) {
		this.gungu = gungu;
	}


	public String getServices() {
		return services;
	}


	public void setServices(String services) {
		this.services = services;
	}


	public boolean isSilson() {
		return silson;
	}


	public void setSilson(boolean silson) {
		this.silson = silson;
	}


	public String getNewsTitle() {
		return newsTitle;
	}


	public void setNewsTitle(String newsTitle) {
		this.newsTitle = newsTitle;
	}


	public String getNewsContent() {
		return newsContent;
	}


	public void setNewsContent(String newsContent) {
		this.newsContent = newsContent;
	}


	public String getCategoryName() {
		return categoryName;
	}


	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}


	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public String getuTel() {
		return uTel;
	}


	public void setuTel(String uTel) {
		this.uTel = uTel;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getUserType() {
		return userType;
	}


	public void setUserType(String userType) {
		this.userType = userType;
	}


	public String getMajor() {
		return major;
	}


	public void setMajor(String major) {
		this.major = major;
	}


	public String getIntroduction() {
		return introduction;
	}


	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}


	public Integer getStateCode() {
		return stateCode;
	}


	public void setStateCode(Integer stateCode) {
		this.stateCode = stateCode;
	}


	public Integer getFileNo() {
		return fileNo;
	}


	public void setFileNo(Integer fileNo) {
		this.fileNo = fileNo;
	}


	public String getFileName() {
		return fileName;
	}


	public void setFileName(String fileName) {
		this.fileName = fileName;
	}


	public String getFilePath() {
		return filePath;
	}


	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}


	public void setdDay(long dDay) {
		this.dDay = dDay;
	}


	public boolean isFavorite() {
		return favorite;
	}


	public void setFavorite(boolean favorite) {
		this.favorite = favorite;
	}


	public String getDiagnosisName() {
		return diagnosisName;
	}


	public void setDiagnosisName(String diagnosisName) {
		this.diagnosisName = diagnosisName;
	}

	
	


}
