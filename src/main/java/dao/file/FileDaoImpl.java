package dao.file;

import org.apache.ibatis.session.SqlSession;

import dto.FileDto;
import util.MybatisSqlSessionFactory;

public class FileDaoImpl implements FileDao{
	
	private SqlSession session;
	public FileDaoImpl() {
		session = MybatisSqlSessionFactory.getSessionFactory().openSession();
	}
	

	@Override
	public FileDto selectFileByUserId(Integer fileNo) throws Exception {	
		return session.selectOne("mapper.file.selectFileByuNo", fileNo);
	}

	@Override
	public int insertFile(FileDto fileDto) throws Exception {

		return session.insert("mapper.file.insertFile", fileDto);
	}

	@Override
	public int updateFile(FileDto fileDto) throws Exception {
		
		return session.update("mapper.file.updateFile", fileDto);
	}

}
