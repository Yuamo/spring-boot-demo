package com.girl.handle;

import com.girl.aspect.HttpAspect;
import com.girl.domain.Result;
import com.girl.exception.GirlException;
import com.girl.utils.ResultUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by Administrator on 2017/8/18.
 */
@Controller
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


//    @RequestMapping("*")
//    public ModelAndView fallbackHandler(HttpServletRequest request, HttpServletResponse response) throws Exception {
//        return buildModelAndViewErrorPage(request, response, null, HttpStatus.NOT_FOUND);
//    }
//
//    private ModelAndView buildModelAndViewErrorPage(HttpServletRequest request, HttpServletResponse response, Exception ex, HttpStatus httpStatus) {
//        response.setStatus(httpStatus.value());
//
//        ModelAndView mav = new ModelAndView("error.html");
//        if (ex != null) {
//            mav.addObject("title", ex);
//        }
//        mav.addObject("content", request.getRequestURL());
//        return mav;
//    }


}
