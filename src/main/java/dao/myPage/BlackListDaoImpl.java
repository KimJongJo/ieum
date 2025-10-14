package dao.myPage;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import dto.BlackListDto;
import dto.BlackWithMemberDto;
import util.MybatisSqlSessionFactory;

public class BlackListDaoImpl implements BlackListDao{
	
	private SqlSessionFactory sqlSessionFactory = MybatisSqlSessionFactory.getSessionFactory();

	
	// 사용자 차단 기록 삽입
    @Override
    public int insertBlackList(BlackListDto dto) throws Exception {
        try (SqlSession session = sqlSessionFactory.openSession()) {
            int result = session.insert("mapper.blacklist.insertBlackList", dto);
            session.commit();
            return result;
        }
    }

    // 로그인 사용자가 차단한 사용자 목록 조회
    @Override
    public List<Integer> getBlockedUsers(int uNo) throws Exception {
        try (SqlSession session = sqlSessionFactory.openSession()) {
            return session.selectList("mapper.blacklist.getBlockedUsers", uNo);
        }
    }

    // 블랙리스트 + 회원 정보 조회
    @Override
    public List<BlackWithMemberDto> selectBlackWithMember(Integer uNo) throws Exception {
        try (SqlSession session = sqlSessionFactory.openSession()) {
            return session.selectList("mapper.blacklist.selectBlackWithMember", uNo);
        }
    }
    
    @Override
    public int deleteBlack(Map<String, Integer> map) throws Exception {
        try (SqlSession session = sqlSessionFactory.openSession()) {
            int result = session.delete("mapper.blacklist.deleteBlack", map);
            session.commit();
            return result;
        }
    }

	@Override
	public List<BlackWithMemberDto> selectBlackList(Integer row) throws Exception {
		try (SqlSession session = sqlSessionFactory.openSession()) {
			return session.selectList("mapper.blacklist.selectBlackList", row);
		}
	}

	@Override
	public Integer selectBlackCount(Integer uNo) throws Exception {
		try (SqlSession session = sqlSessionFactory.openSession()) {
			return session.selectOne("mapper.blacklist.selectBlackCount", uNo);
		}
	}

}
