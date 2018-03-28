package com.g_apple.commons.handle;

/**
 * Created by Administrator on 2017/8/18.
 */
public class Result<T> {
    public Result(String code, String msg, T data) {
        super();
        this.code = code;
        this.msg = msg;
        this.data = data;
    }

    public Result() {
    }

    /**
     * 错误码
     */


    private String code;

    /**
     * 错误信息
     */
    private String msg;
    /**
     * 返回的内容
     */
    private T data;

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }
}
