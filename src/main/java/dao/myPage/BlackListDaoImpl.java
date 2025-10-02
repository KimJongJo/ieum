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

	@Override
    public int insertBlackList(BlackListDto dto) throws Exception{
		try(SqlSession session = sqlSessionFactory.openSession()) {
			int result = session.insert("mapper.blacklist.insertBlackList", dto);
			session.commit();
			return result;
		}
    }

    @Override
    public List<Integer> getBlockedComments(Map<String, Object> params) throws Exception{
		try(SqlSession session = sqlSessionFactory.openSession()) {
			return session.selectList("mapper.blacklist.getBlockedComments", params);
		}
    }

	@Override
	public List<BlackWithMemberDto> selectselectBlackWithMember(Integer uNo) throws Exception {
		try(SqlSession session = sqlSessionFactory.openSession()) {
			return session.selectList("mapper.blacklist.selectBlackWithMember", uNo);
		}
	}
}
