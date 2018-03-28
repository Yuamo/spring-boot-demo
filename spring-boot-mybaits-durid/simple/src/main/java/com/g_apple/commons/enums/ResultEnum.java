package com.g_apple.commons.enums;

/**
 * Created by Administrator on 2017/8/18.
 */
public enum ResultEnum {
    UNKONW_ERROR("-1","未知错误！"),
    NO_DATA("81","没有数据"),
    SUCCESS("0","成功"),
    PRIMARY_SCHOOL("100","你还在上小学吧！"),
    MIDDLE_SCHOOL("101","你还在上初中吧！"),
    ;

    private String code;

    private String msg;

    ResultEnum(String code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public String getCode() {
        return code;
    }

    public String getMsg() {
        return msg;
    }
}
