package dao.member;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import dto.HospitalDto;
import dto.MemberDto;
import dto.MemberProfileDto;

import dto.otherDto.ManagerInfoDto;
import dto.otherDto.ManagerPageResponseDto;
import dto.otherDto.MemberFileDto;
import dto.otherDto.HospitalDocDto;
import util.MybatisSqlSessionFactory;

public class MemberDaoImpl implements MemberDao {
	private SqlSessionFactory sqlSessionFactory = MybatisSqlSessionFactory.getSessionFactory();

	@Override
	public MemberDto checkId(String userId) {
		try (SqlSession session = sqlSessionFactory.openSession()) {
			return session.selectOne("checkId", userId);
		}
	}

	@Override
	public void normalJoin(MemberDto member) {
		try (SqlSession session = sqlSessionFactory.openSession()) {
			session.insert("normalJoin", member);
			session.commit();
		}

	}

	@Override
	public void managerJoin(MemberDto member) {
		try (SqlSession session = sqlSessionFactory.openSession()) {
			session.insert("managerJoin", member);
			session.commit();
		}

	}

	@Override
	public Map<String, Object> findId(String email) {
		try (SqlSession session = sqlSessionFactory.openSession()) {
			return session.selectOne("findId", email);
		}
	}

	@Override
	public void changePw(Map<String, Object> userMap) {
		try (SqlSession session = sqlSessionFactory.openSession()) {
			session.update("changePw", userMap);
			session.commit();
		}
	}

	@Override
	public MemberDto selectByNickName(Integer uNo) throws Exception {
		try (SqlSession session = sqlSessionFactory.openSession()) {
			return session.selectOne("mapper.member.selectByNickName", uNo);
		}
	}
  	
  
  	// 내가 작성한거임 
	@Override
	public MemberDto selectProfileInfo(Integer uNo) throws Exception {
		try (SqlSession session = sqlSessionFactory.openSession()) {
			return session.selectOne("mapper.member.selectProfileInfo", uNo);
		}
	}
	//정보 수정	
	@Override
	public MemberProfileDto selectMemberWithProfile(int uNo) throws Exception {
		try (SqlSession session = sqlSessionFactory.openSession()) {
			return session.selectOne("mapper.member.selectMemberWithProfile", uNo);
		}
	}
  // 프로파일 업데이트
	@Override
	public void updateProfile(MemberDto memberDto) throws Exception {
		try (SqlSession session = sqlSessionFactory.openSession()) {
			session.update("mapper.member.updateProfile", memberDto);
			session.commit();
		}
	}

	@Override
	public String beforePw(String userId) {
		try (SqlSession session = sqlSessionFactory.openSession()) {
			return session.selectOne("beforePw", userId);
		}
	}

	// 아이디를 검색해서 존재하는 회원이면 암호화된 비밀번호 반환
	@Override
	public Map<String, Object> existIdtoPw(String userId) {
		try (SqlSession session = sqlSessionFactory.openSession()) {
			return session.selectOne("existId", userId);
		}
	}

	// 지성이가 작성한 .....
	public MemberDto selectFindById(Integer uNo) throws Exception {
		try (SqlSession session = sqlSessionFactory.openSession()) {
			return session.selectOne("mapper.member.selectId", uNo);
		}
	}

	// 비밀번호를 알고 있다고는 가정으로 비밀번호 업데이트
	@Override
	public void updatePassword(MemberDto memberDto) throws Exception {
		try (SqlSession session = sqlSessionFactory.openSession()) {
			session.update("mapper.member.updatePass", memberDto);
			session.commit();
		}

	}

	@Override
	public Integer kakaoSignUp(MemberDto member) {
		try (SqlSession session = sqlSessionFactory.openSession()) {
			Integer uNo = session.insert("kakaoSignUp", member);
			session.commit();
			return uNo;
		}

	}

	// 네이버 로그인시 이메일이 이미 있는 경우
	@Override
	public MemberDto checkEmail(String email) {
		try (SqlSession session = sqlSessionFactory.openSession()) {
			return session.selectOne("checkNaverEmail", email);
		}
	}

	@Override
	public void socialUpdate(Map<String, String> map) {
		try (SqlSession session = sqlSessionFactory.openSession()) {
			session.update("socialUpdate", map);
			session.commit();
		}

	}

	// 전체 일반 회원 수
	@Override
	public int memberCount(Integer state) {
		try(SqlSession session = sqlSessionFactory.openSession()){
			return session.selectOne("memberCount", state);
		}
		
	}

	@Override
	public List<MemberDto> selectMembers(Map<String, Object> page) {
		try(SqlSession session = sqlSessionFactory.openSession()){
			
			return session.selectList("selectMembers", page);
		}
	}

	// 총 검색어 유저 수
	@Override
	public int memberListByKeyword(Map<String, Object> page) {
		try(SqlSession sqlsession = sqlSessionFactory.openSession()) {	
			return sqlsession.selectOne("memberListByKeyword", page);
		}
	}

	// 총 검색어 유저 리스트
	@Override
	public List<MemberDto> selectUserListByKeyword(Map<String, Object> page) {
		try(SqlSession sqlsession = sqlSessionFactory.openSession()) {
			return sqlsession.selectList("selectUserListByKeyword", page);
		}
	}


	// 회원 상태 변경
	@Override
	public void userState(Map<String, Integer> map) {
		try(SqlSession sqlsession = sqlSessionFactory.openSession()) {
			sqlsession.update("userState", map);
			sqlsession.commit();
		}
		
	}

	@Override
	public MemberFileDto memberInfoAndFile(Integer uNo) {
		try(SqlSession sqlsession = sqlSessionFactory.openSession()) {
			return sqlsession.selectOne("memberInfoAndFile", uNo);
		}
	}


	@Override
	public int managerCount(Map<String, Object> filterMap) {
		try(SqlSession sqlsession = sqlSessionFactory.openSession()){
			return sqlsession.selectOne("managerCount", filterMap);
		}
	}


	// 매니저의 정보 + 소속 병원의 정보가 담긴 매니저인포리스트
	@Override
	public List<ManagerInfoDto> selectManagers(Map<String, Object> page) {
		try(SqlSession sqlsession = sqlSessionFactory.openSession()){
			return sqlsession.selectList("selectManagers", page);
		}
	}
	
	// 검색어가 있는 매니저 조회 수
	@Override
	public int managerListByKeyword(Map<String, Object> keywordPage) {
		try(SqlSession sqlsession = sqlSessionFactory.openSession()) {	
			return sqlsession.selectOne("managerListByKeyword", keywordPage);
		}
	}

	// 검색어가 있는 매니저 조회 목록
	@Override
	public List<ManagerInfoDto> selectManagerListByKeyword(Map<String, Object> page) {
		try(SqlSession sqlsession = sqlSessionFactory.openSession()) {
			return sqlsession.selectList("selectManagerListByKeyword", page);
		}
	}

	@Override
	public ManagerInfoDto managerInfoAndFile(Integer uNo) {
		try(SqlSession sqlsession = sqlSessionFactory.openSession()) {
			return sqlsession.selectOne("managerInfoAndFile", uNo);
		}
	}

	@Override
	public MemberDto selectUserByNo(Integer uNo) {
		try(SqlSession sqlsession = sqlSessionFactory.openSession()) {
			return sqlsession.selectOne("selectUserByNo", uNo);
		}
	}
	
	// 병원에 근무하는 의사 수
	@Override
	public Integer docCnt(Integer hNo) throws Exception {
		try (SqlSession session = sqlSessionFactory.openSession()) {
			return session.selectOne("mapper.member.docCnt", hNo);
		}
	}

	// 의사 리스트
	@Override
	public List<HospitalDocDto> docList(Integer hNo) throws Exception {
		try (SqlSession session = sqlSessionFactory.openSession()) {
			return session.selectList("mapper.member.docList", hNo);
		}
	}

	// 의사 정보
	@Override
	public HospitalDocDto docDetail(Integer mNo) throws Exception {
		try (SqlSession session = sqlSessionFactory.openSession()) {
			return session.selectOne("mapper.member.docDetail", mNo);
		}
	}

	@Override
	public Integer selectFileNo(Integer getuNo) {
		try (SqlSession session = sqlSessionFactory.openSession()) {
			return session.selectOne("mapper.member.selectFileNo", getuNo);
		}
	}
	// 이미지와 사용자 정보 가져오기
	@Override
	public MemberProfileDto selectProFileView(Integer uNo) throws Exception {
		try (SqlSession session = sqlSessionFactory.openSession()) {
			return session.selectOne("mapper.member.selectMemberWithProfile", uNo);
		}
	}
}
