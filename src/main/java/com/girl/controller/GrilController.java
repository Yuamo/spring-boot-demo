package com.girl.controller;

import com.girl.domain.Girl;
import com.girl.domain.Result;
import com.girl.repository.GirlRepository;
import com.girl.service.GirlService;
import com.girl.utils.ResultUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

/**
 * Created by Administrator on 2017/8/17.
 */
@RestController
public class GrilController {

    /**
     * org.slf4j.Logger 是Spring自带的日志框架  底层是logback
     */
    private final static Logger logger = LoggerFactory.getLogger(GrilController.class);

    @Autowired
    private GirlRepository girlRepository;

    @Autowired
    private GirlService girlService;

    /**
     * 查询所有
     *
     * @return
     */
    @GetMapping(value = "/girls")
    public List<Girl> girlList() {
        logger.info("/girls");
        return girlRepository.findAll();
    }

    /**
     * 添加一个女生
     *
     * @return
     */
    @PostMapping(value = "/girls")
    public Result<Girl> girlAdd(@Valid Girl g, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            logger.info(bindingResult.getFieldError().getDefaultMessage());
            return ResultUtil.error("1", bindingResult.getFieldError().getDefaultMessage());
        }
        Girl girl = new Girl();
        girl.setAge(g.getAge());
        girl.setCupSize(g.getCupSize());
        return ResultUtil.success(girlRepository.save(girl));
    }

    @GetMapping(value = "/girls/{id}")
    public Girl girlFindone(@PathVariable("id") Integer id) {
        return girlRepository.findOne(id);
    }


    @PutMapping(value = "/girls/{id}")
    public Girl girlUpate(@PathVariable("id") Integer id, @RequestParam("cupSize") String cupSize, @RequestParam("age") Integer age) {
        Girl girl = new Girl();
        girl.setId(id);
        girl.setAge(age);
        girl.setCupSize(cupSize);
        System.out.print(girl);
        return girlRepository.save(girl);
    }

    /**
     * 通过id查询
     *
     * @param id
     */
    @DeleteMapping(value = "/girls/{id}")
    public void girlDetele(@PathVariable("id") Integer id) {
        girlRepository.delete(id);
    }

    /**
     * 通过年龄查询
     *
     * @param age
     * @return
     */
    @GetMapping(value = "girls/age/{age}")
    public List<Girl> girlListByAge(@PathVariable("age") Integer age) {
        return girlRepository.findByAge(age);
    }

    /**
     *
     */
    @GetMapping(value = "girls/two")
    public void girlTwo() {
        girlService.insertTwo();
    }

    @GetMapping(value = "girls/getAge/{id}")
    public Result<Girl> getAge(@PathVariable("id") Integer id) throws Exception {
        return ResultUtil.success(girlService.getAge(id));
    }

    @GetMapping(value = "api/girl")
    public Result apiGirl() {
        return ResultUtil.success();
    }
}

