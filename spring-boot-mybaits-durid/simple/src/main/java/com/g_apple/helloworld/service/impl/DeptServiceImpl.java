package com.g_apple.helloworld.service.impl;

import com.g_apple.helloworld.dao.IDeptDAO;
import com.g_apple.helloworld.service.IDeptService;
import com.g_apple.helloworld.vo.Dept;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2018/3/28.
 */
@Service
public class DeptServiceImpl implements IDeptService {

    @Resource
    private IDeptDAO deptDAO;

    @Override
    public Dept get(long id) {
        return this.deptDAO.findById(id);
    }

    @Override
    public boolean add(Dept dept) {
        return this.deptDAO.doCreate(dept);
    }

    @Override
    public List<Dept> list() {
        return this.deptDAO.findAll();
    }

}