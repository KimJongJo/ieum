package dao.file;

import org.apache.ibatis.session.SqlSession;

import dto.FileDto;
import util.MybatisSqlSessionFactory;

public class FileDaoImpl implements FileDao{


	@Override
	public FileDto selectFileByFileNo(Integer fileNo) throws Exception {	
		try (SqlSession session = MybatisSqlSessionFactory.getSessionFactory().openSession()) {
			
			return session.selectOne("mapper.file.selectFileByFileNo", fileNo);
		}
	}

	@Override
	public void insertFile(FileDto fileDto) throws Exception {
		try (SqlSession session = MybatisSqlSessionFactory.getSessionFactory().openSession()) {
			session.insert("mapper.file.insertFile", fileDto);
			session.commit();
			
		}
	}

	@Override
	public void updateFile(FileDto fileDto) throws Exception {
		try (SqlSession session = MybatisSqlSessionFactory.getSessionFactory().openSession()) {
			
			session.update("mapper.file.updateFile", fileDto);
			session.commit();
		}
	}

	@Override
	public Integer uploadFile(FileDto fileDto) {
		try (SqlSession session = MybatisSqlSessionFactory.getSessionFactory().openSession()) {
			
			session.insert("uploadFile", fileDto);
			session.commit();
			
			return fileDto.getFileNo();
		}
	}
	


}
