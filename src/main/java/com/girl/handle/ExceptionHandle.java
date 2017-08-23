package com.girl.handle;

import com.girl.aspect.HttpAspect;
import com.girl.domain.Result;
import com.girl.exception.GirlException;
import com.girl.utils.ResultUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by Administrator on 2017/8/18.
 */
@ControllerAdvice
public class ExceptionHandle {

    private final static Logger logger = LoggerFactory.getLogger(ExceptionHandle.class);

    @ExceptionHandler(value = Exception.class)   //处理所有异常
    @ResponseBody    //在返回自定义相应类的情况下必须有，这是@ControllerAdvice注解的规定
    public Result handle(Exception e) {
        if (e instanceof GirlException) {
            GirlException girlException  = (GirlException) e;
            return ResultUtil.error(girlException.getCode(),girlException.getMessage());
        }else{
            logger.info("系统异常={}",e.getMessage());
            return ResultUtil.error("-1", "未知错误！");
        }
    }
}
