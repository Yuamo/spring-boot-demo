package com.girl.controller;

import com.girl.properties.GirlProperties;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * Created by Administrator on 2017/8/17.
 */
@RestController  //
@RequestMapping(value = "/girl")  // 不写method 就什么方式访问都是可以的
public class HelloController {

    @Autowired
    private GirlProperties girlProperties;

//    @RequestMapping(value = "/{id}/say", method = RequestMethod.GET)
//    public String say(@PathVariable("id") int id) {
//        return "hello Spring boot==>" + id;
//    }

    @RequestMapping(value = "/say", method = RequestMethod.GET)
    public String say(@RequestParam("id") int myId) {
        return "hello Spring boot：" + myId;
    }
}
