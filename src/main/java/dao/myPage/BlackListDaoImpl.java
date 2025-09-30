package dao.myPage;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import dto.BlackListDto;
import util.MybatisSqlSessionFactory;

public class BlackListDaoImpl implements BlackListDao{
	
	private SqlSession session;
	
	public BlackListDaoImpl() {
		session = MybatisSqlSessionFactory.getSessionFactory().openSession();
	}
    @Override
    public int insertBlackList(BlackListDto dto) throws Exception{
        int result = session.insert("mapper.blacklist.insertBlackList", dto);
        session.commit();
        return result;
    }

    @Override
    public List<Integer> getBlockedComments(Map<String, Object> params) throws Exception{
        return session.selectList("mapper.blacklist.getBlockedComments", params);
    }
}
