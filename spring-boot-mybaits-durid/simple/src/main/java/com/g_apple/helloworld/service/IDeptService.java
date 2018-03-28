package com.g_apple.helloworld.service;

import com.g_apple.helloworld.dao.IDeptDAO;
import com.g_apple.helloworld.vo.Dept;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2018/3/28.
 */
public interface IDeptService {

      Dept get(long id);

      boolean add(Dept dept);

     List<Dept> list();
}