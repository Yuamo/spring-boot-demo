package com.g_apple.helloworld.dao;

import com.g_apple.helloworld.vo.Dept;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * Created by Administrator on 2018/3/28.
 */
@Mapper
public interface  IDeptDAO {
      boolean doCreate(Dept vo);

      Dept findById(Long id);

      List<Dept> findAll();
}
