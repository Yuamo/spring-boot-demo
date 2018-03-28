package com.girl.utils;

import com.girl.controller.GrilController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created by Administrator on 2017/8/18.
 */
public class LoggerUtil {
    /**
     * org.slf4j.Logger 是Spring自带的日志框架  底层是logback
     */
    public final static Logger logger = LoggerFactory.getLogger(GrilController.class);
}
