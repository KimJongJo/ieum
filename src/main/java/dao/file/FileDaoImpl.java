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
	public FileDto selectFileByFileNo(Integer fileNo) throws Exception {	
		return session.selectOne("mapper.file.selectFileByFileNo", fileNo);
	}

	@Override
	public void insertFile(FileDto fileDto) throws Exception {
		session.insert("mapper.file.insertFile", fileDto);
		session.commit();
	}

	@Override
	public void updateFile(FileDto fileDto) throws Exception {
		session.update("mapper.file.updateFile", fileDto);
		session.commit();
	}


	@Override
	public Integer normalImg(FileDto file) {
		Integer fileNo = session.insert("normalImg", file);
		session.commit();
		
		return fileNo; 
	}

}
