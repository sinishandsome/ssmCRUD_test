import com.atguigu.crud.bean.Department;
import com.atguigu.crud.bean.Employ;
import com.atguigu.crud.dao.DepartmentMapper;
import com.atguigu.crud.dao.EmployMapper;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.UUID;

/**
 * @author chenxin
 * @create 2021-09-21 11:19
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations ={"classpath:applicationContext.xml"})
public class MapperTest {

    @Autowired
    DepartmentMapper departmentMapper;
    @Autowired
    EmployMapper employMapper;
    @Autowired
    SqlSession sqlSession;

    @Test
    public void testCRUD() {
//        departmentMapper.insertSelective(new Department(null, "开发部"));
//        departmentMapper.insertSelective(new Department(null, "测试部"));
//        employMapper.insertSelective(new Employ(null, "Jerry", "M", "Jerry@qq.com", 4));
        //批量插入
        EmployMapper mapper = sqlSession.getMapper(EmployMapper.class);
        for (int i = 0; i < 1000; i++) {
            String uid = UUID.randomUUID().toString().substring(0, 5) + i;
            mapper.insertSelective(new Employ(null, uid, "M", uid + "@qq.com", 4));
        }
    }
}
