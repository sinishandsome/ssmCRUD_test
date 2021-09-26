package com.atguigu.crud.service;

import com.atguigu.crud.bean.Employ;
import com.atguigu.crud.bean.EmployExample;
import com.atguigu.crud.dao.EmployMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author chenxin
 * @create 2021-09-21 13:13
 */
@Service
public class EmployService {

    @Autowired
    EmployMapper employMapper;


    public List<Employ> getAll() {
        return employMapper.selectByExampleWithDept(null);
    }

    public void saveEmp(Employ employ) {
        employMapper.insertSelective(employ);
    }

    public boolean checkUser(String empName) {
        EmployExample employExample = new EmployExample();
        EmployExample.Criteria criteria = employExample.createCriteria();
        criteria.andEmpNameEqualTo(empName);
        long count = employMapper.countByExample(employExample);
        return count == 0;
    }

    public Employ getEmp(Integer id) {
        Employ employ = employMapper.selectByPrimaryKey(id);
        return employ;
    }

    public void updateEmp(Employ employ) {
        employMapper.updateByPrimaryKeySelective(employ);
    }

    public void deleteEmp(Integer id) {
        employMapper.deleteByPrimaryKey(id);
    }

    public void deleteBatch(List<Integer> ids) {
        EmployExample example = new EmployExample();
        EmployExample.Criteria criteria = example.createCriteria();
        //delete from xxx where emp_id in (x,x,x,x)
        criteria.andEmpIdIn(ids);
        employMapper.deleteByExample(example);
    }
}
