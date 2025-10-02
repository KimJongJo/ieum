package dao.file;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import dto.FileDto;
import util.MybatisSqlSessionFactory;

public class FileDaoImpl implements FileDao{
	private SqlSessionFactory sqlSessionFactory = MybatisSqlSessionFactory.getSessionFactory();

	@Override
	public FileDto selectFileByFileNo(Integer fileNo) throws Exception {	
		try(SqlSession session = sqlSessionFactory.openSession()) {
			return session.selectOne("mapper.file.selectFileByFileNo", fileNo);
		}
	}

	@Override
	public void insertFile(FileDto fileDto) throws Exception {
		try(SqlSession session = sqlSessionFactory.openSession()) {
			session.insert("mapper.file.insertFile", fileDto);
			session.commit();
		}
	}

	@Override
	public void updateFile(FileDto fileDto) throws Exception {
		try(SqlSession session = sqlSessionFactory.openSession()) {
			session.update("mapper.file.updateFile", fileDto);
			session.commit();
		}
	}

	@Override
	public Integer uploadFile(FileDto fileDto) {
		try(SqlSession session = sqlSessionFactory.openSession()) {
			session.insert("uploadFile", fileDto);
			session.commit();

			return fileDto.getFileNo();
		}
	}
	


}
