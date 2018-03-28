package com.g_apple.helloworld.restful;

import com.g_apple.helloworld.service.IDeptService;
import com.g_apple.helloworld.service.impl.DeptServiceImpl;
import com.g_apple.helloworld.vo.Dept;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by Administrator on 2018/3/28.
 */

@Controller
@RequestMapping(value = "/user")
public class DeptRestful {

    @Autowired
    private IDeptService deptService;


    @ResponseBody
    @RequestMapping(value = "/all", produces = {"application/json;charset=UTF-8"})
    public List<Dept> findAllUser(){
        Dept dept = new Dept();
        dept.setDname("测试部-" + System.currentTimeMillis());
        System.out.println(this.deptService.list());
        return this.deptService.list();
    }

    @RequestMapping("/h2")
    public String test(){
        System.out.println("11111111111112222222222222");
        return "你已经成功了今天可以休息了";
    }

    @RequestMapping("/hello")
    public String index() {
        return "Hello World";
    }
}