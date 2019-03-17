package info;
import org.apache.ibatis.session.SqlSession;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;
import java.io.Reader;

public class DBAccess {
    public SqlSession getSqlsession() throws IOException {
        Reader reader = Resources.getResourceAsReader("info/Configuration.xml");
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
        SqlSession sqlSession = sqlSessionFactory.openSession();
        return sqlSession;
    }

}
