package service.member;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.mindrot.jbcrypt.BCrypt;

import dao.member.MemberDao;
import dao.member.MemberDaoImpl;
import dto.FileDto;
import dto.MemberDto;
import dto.otherDto.HospitalDocDto;
import dto.otherDto.ManagerInfoDto;
import dto.otherDto.ManagerPageResponseDto;
import dto.otherDto.MemberFileDto;
import dto.otherDto.MemberPageResponseDto;
import service.file.FileService;
import service.file.FileServiceImpl;
public class MemberServiceImpl implements MemberService {

	MemberDao memberDao;
	FileService fileService;
	private ServletContext servletContext;
	
	public MemberServiceImpl() {
		memberDao = new MemberDaoImpl();
		fileService = new FileServiceImpl();
	}
	
	public MemberServiceImpl(ServletContext servletContext) {
		memberDao = new MemberDaoImpl();
		fileService = new FileServiceImpl();
		this.servletContext = servletContext;
	}
	
	// 사용 가능한 아이디인지 확인
	@Override
	public boolean checkUserId(String userId) {
		
		MemberDto member = memberDao.checkId(userId);
		
		if(member == null) {
			return false; // 사용 가능
		}else {
			return true; // 존재하는 아이디
			
		}
	}
	
	// 일반 유저, 병원관리자 회원가입 
	@Override
	public void normalJoin(MemberDto member) {
		
		String filePath = "img";
		FileDto file;
		Integer fileNo;
		// 일반회원
		if(member.gethNo() == null) {
			file = new FileDto("회원이미지.jpg",filePath,"userProfile");
		}else { // 병원 관리자
			file = new FileDto("회원이미지.jpg",filePath,"managerProfile");
		}
		fileNo = fileService.normalImg(file);
		member.setFileNo(fileNo);
		
		if(member.gethNo() == null) {
			memberDao.normalJoin(member);
		}else {
			memberDao.managerJoin(member);
		}
		
	}

	// 아이디 찾기 시 보여줄 아이디 반환
	@Override
	public Map<String, Object> findId(String email) {
		
		Map<String, Object> userMap = memberDao.findId(email);
		String userType = (String)userMap.get("userType");
		if(userType.equals("USER")) {
			userMap.put("userType", "일반회원");
		}else {
			userMap.put("userType", "병원관리자");
		}
		
		return userMap;
	}

	// 비밀번호 변경
	@Override
	public int changePw(String userId, String password) {
		Map<String, Object> userMap = new HashMap<String, Object>();
		
		// 현재 사용중인 비밀번호와 비교
		String beforePw = memberDao.beforePw(userId);
		
		// 값이 안들어왔을때
		if(userId == null || password == null) {
			return 2;
		}
		
		if(BCrypt.checkpw(password, beforePw)) {
			return 1;
		}else {
			// 비밀번호 암호화
			String securityPw = BCrypt.hashpw(password, BCrypt.gensalt());
			
			userMap.put("userId", userId);
			userMap.put("password", securityPw);
			memberDao.changePw(userMap);
			
			return 0;
		}
		
		
		
	}

	// 로그인
	@Override
	public int login(String userId, String password) {
		
		Map<String, Object> userNoAndPw = memberDao.existIdtoPw(userId);
		if(userNoAndPw == null) return 0; // 아이디가 존재하지 않을때
		
		String hashedPw = userNoAndPw.get("password").toString().trim();
		
		if (hashedPw == null || !BCrypt.checkpw(password, hashedPw)) {
		    return -1; // 비밀번호가 틀렸을때
		}else { // 로그인 성공했을때
			return (Integer)userNoAndPw.get("userNo");
		}
	}
	
	@Override
	public MemberDto selectByNickName(Integer uNo) throws Exception {
		return memberDao.selectByNickName(uNo);
	}
	
	// 의사 리스트 가져오기
	@Override
	public List<HospitalDocDto> DoclistBy2(Integer hNo) throws Exception {
		return memberDao.docList(hNo);
		
	}

	// 소셜로그인 할때 아이디가 존재하는지 검사
	@Override
	public MemberDto socialIdCheck(String idStr) {

		return memberDao.checkId(idStr);
	}

	
	// 카카오 회원가입
	@Override
	public Integer socialSignUp(MemberDto member) {
		
		return memberDao.kakaoSignUp(member);
	}

	// 네이버 이메일 체크
	@Override
	public MemberDto emailCheck(String email) {

		return memberDao.checkEmail(email);
	}
	
	// 병합할때 비밀번호 확인
	@Override
	public boolean checkPw(String email, String password) {
		
		MemberDto member = memberDao.checkEmail(email);

		System.out.println(BCrypt.checkpw(password, member.getPassword()));

		return BCrypt.checkpw(password, member.getPassword());
	}

	@Override
	public MemberDto socialUpdate(String email, String id) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("email", email);
		map.put("id", id);
		memberDao.socialUpdate(map);		
		return memberDao.checkEmail(email);
	}

	//예약한 유저
	@Override
	public MemberDto selectResUser(Integer uNo) throws Exception {
		return memberDao.selectProfileInfo(uNo);
	}
	
	//의사 디테일 
	@Override
	public HospitalDocDto getDocDetail(Integer mNo) throws Exception {
		return memberDao.docDetail(mNo);
	}


	// 일반 회원 리스트
	@Override
	public MemberPageResponseDto userList(int curPage, String filter, Integer state) {
		String sort;
		// 신청일(최신순)일 경우
		if ("created_at".equals(filter) || "warning_count".equals(filter)) {
			sort = "DESC";
		} else {
			sort = "ASC";
		}

		// 정렬 조건이 없을경우
		String sortValue;

		if (filter.equals("created_at")) {
			sortValue = "created_at";
		} else if (filter.equals("warning_count")) {
			sortValue = "warning_count";
		} else {
			sortValue = "u_no";
		}

		int pageSize = 8; // 한 페이지당 데이터 수
		int blockSize = 5; // 한 화면에 보여줄 페이지 번호 개수

		int memberCount = memberDao.memberCount(state); // 전체 데이터 수
		int allPage = (int) Math.ceil((double) memberCount / pageSize); // 전체 페이지 수

		int startPage = ((curPage - 1) / blockSize) * blockSize + 1; // 시작 페이지
		int endPage = Math.min(startPage + blockSize - 1, allPage); // 끝 페이지

		int offset = (curPage - 1) * pageSize; // DB 조회 시작 위치

		Map<String, Object> page = new HashMap<>();
		page.put("offset", offset);
		page.put("pageSize", pageSize);
		page.put("sort", sort);
		page.put("sortValue", sortValue);
		page.put("state", state);
		
		

		List<MemberDto> list = memberDao.selectMembers(page);
		// 데이터 + 페이지 정보 같이 반환
		return new MemberPageResponseDto(list, curPage, allPage, startPage, endPage, memberCount);
	}

	@Override
	public MemberPageResponseDto memberListByKeyword(int requestPage, String keyword, String filter, Integer state) {
		String sort;
		// 신청일(최신순)일 경우
		if ("created_at".equals(filter) || "warning_count".equals(filter)) {
			sort = "DESC";
		} else {
			sort = "ASC";
		}

		// 정렬 조건이 없을경우
		String sortValue;

		if (filter.equals("created_at")) {
			sortValue = "created_at";
		} else if (filter.equals("warning_count")) {
			sortValue = "warning_count";
		} else {
			sortValue = "u_no";
		}

		int pageSize = 8;
		int blockSize = 5;
		
		Map<String, Object> keywordPage = new HashMap<String, Object>();
		keywordPage.put("keyword", keyword);
		keywordPage.put("state", state);

		int memberCount = memberDao.memberListByKeyword(keywordPage); // 검색어 기준 총 개수
		int allPage = (int) Math.ceil((double) memberCount / pageSize);

		int startPage = ((requestPage - 1) / blockSize) * blockSize + 1;
		int endPage = Math.min(startPage + blockSize - 1, allPage);

		int offset = (requestPage - 1) * pageSize;

		Map<String, Object> page = new HashMap<>();
		page.put("offset", offset);
		page.put("pageSize", pageSize);
		page.put("keyword", keyword); // 검색어 전달
		page.put("sort", sort);
		page.put("sortValue", sortValue);
		page.put("state", state);

		List<MemberDto> list = memberDao.selectUserListByKeyword(page);

		return new MemberPageResponseDto(list, requestPage, allPage, startPage, endPage, memberCount);
	}


	// 유저 상태 변경
	@Override
	public void userState(Integer uNo, Integer stateCode) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("stateCode", stateCode);
		map.put("uNo", uNo);
		
		memberDao.userState(map);
		
	}

	@Override
	public MemberFileDto memberInfoAndFile(Integer uNo) {
		
		return memberDao.memberInfoAndFile(uNo);
	}

	
	// 병원 매니저 정보와 병원 매니저가 속한 병원 정보를 받아오기
	@Override
	public ManagerPageResponseDto managerList(int curPage, String filter, int state, String role) {
		
		String sort;
		// 신청일(최신순)일 경우
		if ("created_at".equals(filter)) {
			sort = "DESC";
		} else {
			sort = "ASC";
		}

		// 정렬 조건이 없을경우
		String sortValue;

		if (filter.equals("created_at")) {
			sortValue = "created_at";
		} else if (filter.equals("h_nm")) {
			sortValue = "h_nm";
		} else {
			sortValue = "u_no";
		}

		int pageSize = 8; // 한 페이지당 데이터 수
		int blockSize = 5; // 한 화면에 보여줄 페이지 번호 개수

		Map<String, Object> filterMap = new HashMap<String, Object>();
		filterMap.put("state", state);
		filterMap.put("userType", role);
		
		int memberCount = memberDao.managerCount(filterMap); // 전체 데이터 수
		
		int allPage = (int) Math.ceil((double) memberCount / pageSize); // 전체 페이지 수

		int startPage = ((curPage - 1) / blockSize) * blockSize + 1; // 시작 페이지
		int endPage = Math.min(startPage + blockSize - 1, allPage); // 끝 페이지

		int offset = (curPage - 1) * pageSize; // DB 조회 시작 위치

		Map<String, Object> page = new HashMap<>();
		page.put("offset", offset);
		page.put("pageSize", pageSize);
		page.put("sort", sort);
		page.put("sortValue", sortValue);
		page.put("state", state);
		page.put("userType", role);
		
		List<ManagerInfoDto> list = memberDao.selectManagers(page);
		
		// 데이터 + 페이지 정보 같이 반환
		return new ManagerPageResponseDto(list, curPage, allPage, startPage, endPage, memberCount);
		
		
	}

	// 키워드가 있을 때 병원 관리자 리스트
	@Override
	public ManagerPageResponseDto managerListByKeyword(int requestPage, String keyword, String filter, Integer state,
			String role) {
		
		String sort;
		// 신청일(최신순)일 경우
		if ("created_at".equals(filter)) {
			sort = "DESC";
		} else {
			sort = "ASC";
		}

		// 정렬 조건이 없을경우
		String sortValue;

		if (filter.equals("created_at")) {
			sortValue = "created_at";
		} else if (filter.equals("h_nm")) {
			sortValue = "h_nm";
		} else {
			sortValue = "u_no";
		}

		int pageSize = 8;
		int blockSize = 5;
		
		Map<String, Object> keywordPage = new HashMap<String, Object>();
		keywordPage.put("keyword", keyword);
		keywordPage.put("state", state);
		keywordPage.put("userType", role);

		int memberCount = memberDao.managerListByKeyword(keywordPage); // 검색어 기준 총 개수
		
		int allPage = (int) Math.ceil((double) memberCount / pageSize);

		int startPage = ((requestPage - 1) / blockSize) * blockSize + 1;
		int endPage = Math.min(startPage + blockSize - 1, allPage);

		int offset = (requestPage - 1) * pageSize;

		Map<String, Object> page = new HashMap<>();
		page.put("offset", offset);
		page.put("pageSize", pageSize);
		page.put("keyword", keyword); // 검색어 전달
		page.put("sort", sort);
		page.put("sortValue", sortValue);
		page.put("state", state);
		page.put("userType", role);

		List<ManagerInfoDto> list = memberDao.selectManagerListByKeyword(page);
		
		return new ManagerPageResponseDto(list, requestPage, allPage, startPage, endPage, memberCount);
	}

	// 매니저 정보랑 병원정보, 파일 경로까지
	@Override
	public ManagerInfoDto managerInfoAndFile(Integer uNo) {
		return memberDao.managerInfoAndFile(uNo);
	}

	// 회원 번호를 통해 회원 정보 가져오기
	@Override
	public MemberDto selectUserByNo(Integer uNo) {
		return memberDao.selectUserByNo(uNo);
	}

	@Override
	public String profileDown(String id, String profile) {
		InputStream in = null;
        FileOutputStream out = null;

        try {
            // 1. URL 연결
            URL url = new URL(profile);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.setConnectTimeout(5000);
            conn.setReadTimeout(5000);

            // 2. 파일 확장자 추출
            String ext = ".jpg"; // 기본 jpg
            String urlLower = profile.toLowerCase();
            if (urlLower.endsWith(".png")) ext = ".png";
            else if (urlLower.endsWith(".jpeg") || urlLower.endsWith(".jpg")) ext = ".jpg";
            else if (urlLower.endsWith(".gif")) ext = ".gif";

            // 3. 저장할 파일명 (UUID 기반)
            String fileName = UUID.randomUUID().toString() + ext;

            // 4. 저장 폴더 경로
            String folderPath = servletContext.getRealPath("/img/userProfile/");
            
            File folder = new File(folderPath);
            if (!folder.exists()) folder.mkdirs(); // 폴더 없으면 생성

            // 5. 파일 다운로드
            in = conn.getInputStream();
            File file = new File(folder, fileName);
            out = new FileOutputStream(file);

            byte[] buffer = new byte[4096];
            int bytesRead = -1;
            while ((bytesRead = in.read(buffer)) != -1) {
                out.write(buffer, 0, bytesRead);
            }

            // 6. DB 저장용 경로 반환
            return fileName;

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            try { if (in != null) in.close(); } catch (Exception e) {}
            try { if (out != null) out.close(); } catch (Exception e) {}
        }
	}

	@Override
	public int getTotalUser() {
		return memberDao.getTotalUser();
	}

	@Override
	public int getTotalManager() {
		return memberDao.getTotalManager();
	}

	@Override
	public int getTotalMember() {
		return memberDao.getTotalMember();
	}


}
