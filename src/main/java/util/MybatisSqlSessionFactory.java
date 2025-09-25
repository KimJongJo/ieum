package util;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MybatisSqlSessionFactory {
	private static SqlSessionFactory sqlSessionFactory;
	
	static {
		//자동으로 new 생성
		try {
			String resource = "resource/mybatis-config.xml";
			InputStream inputStream =  Resources.getResourceAsStream(resource);
			
			//SqlSessionFactoryBuilder 생성
			SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();
			
			//sqlSesstionFactory 생성
			sqlSessionFactory = builder.build(inputStream);

		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static SqlSessionFactory getSessionFactory() {
		return sqlSessionFactory;
	}


}
