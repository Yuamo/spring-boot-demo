package com.girl.exception;

import com.girl.enums.ResultEnum;

/**
 * Created by Administrator on 2017/8/18.
 * 自定义异常
 * Spring 框架只对runtimeException进行事物回滚  Exception不回滚
 */
public class GirlException extends RuntimeException {
    private String code;

    public GirlException(String code,String message){
        super(message);
        this.code = code;
    }

    public GirlException(ResultEnum resultEnum) {
        super(resultEnum.getMsg());
        this.code = resultEnum.getCode();
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }
}
