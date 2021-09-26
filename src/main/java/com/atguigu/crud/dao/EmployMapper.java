package com.atguigu.crud.dao;

import com.atguigu.crud.bean.Employ;
import com.atguigu.crud.bean.EmployExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface EmployMapper {
    long countByExample(EmployExample example);

    int deleteByExample(EmployExample example);

    int deleteByPrimaryKey(Integer empId);

    int insert(Employ record);

    int insertSelective(Employ record);

    List<Employ> selectByExample(EmployExample example);

    Employ selectByPrimaryKey(Integer empId);

    List<Employ> selectByExampleWithDept(EmployExample example);

    Employ selectByPrimaryKeyWithDept(Integer empId);


    int updateByExampleSelective(@Param("record") Employ record, @Param("example") EmployExample example);

    int updateByExample(@Param("record") Employ record, @Param("example") EmployExample example);

    int updateByPrimaryKeySelective(Employ record);

    int updateByPrimaryKey(Employ record);
}