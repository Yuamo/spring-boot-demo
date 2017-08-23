package com.girl.aspect;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by Administrator on 2017/8/18.
 * 使用Aop前就要先引入
 * spring-boot-starter-aop
 */

@Aspect
@Component
public class HttpAspect {

    /**
     * org.slf4j.Logger 是Spring自带的日志框架  底层是logback
     */
    private final static Logger logger = LoggerFactory.getLogger(HttpAspect.class);

    /**
     * 对切面抽象成公共的方法
     */
    @Pointcut("execution(public * com.girl.controller.GrilController.*(..))")
    public void log() {
    }

    /**
     * 引入公共的方法log()
     *
     * @Before 注解就是在拦截的方法之前调用
     */
    @Before("log()")
    public void logBefore(JoinPoint joinPoint) {
        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = attributes.getRequest();

        // url
        logger.info("url={}", request.getRequestURI());
        // method
        logger.info("method={}", request.getMethod());
        // ip
        logger.info("ip={}", request.getRemoteAddr());
        // 类方法
        logger.info("class_method={}", joinPoint.getSignature().getDeclaringTypeName() + "---" + joinPoint.getSignature().getName());
        // 参数
        logger.info("class_args={}", joinPoint.getArgs());
    }

    /**
     * @After 之后
     */
    @After("log()")
    public void logAfter() {
        logger.info("aop After方法");
    }

    /**
     * 返回的内容
     *
     * @param object
     */
    @AfterReturning(returning = "object", pointcut = "log()")
    public void doAfterReturning(Object object) {
        logger.info("response={}", object.toString());
    }


}
