package com.g_apple.commons.utils;


import com.g_apple.commons.handle.Result;

/**
 * Created by Administrator on 2017/8/18.
 */
public class ResultUtil {

    public static Result success(Object obj) {
        Result result = new Result();
        result.setCode("0");
        result.setMsg("成功");
        result.setData(obj);
        return result;
    }

    public static Result success() {
        return new Result("001", "数据为空", "");
    }

    public static Result error(String code, String msg) {
        Result result = new Result();
        result.setCode(code);
        result.setMsg(msg);
        return result;
    }
}
