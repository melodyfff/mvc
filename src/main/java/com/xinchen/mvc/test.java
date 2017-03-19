package com.xinchen.mvc;

import com.alibaba.fastjson.JSONObject;

/**
 * Description:
 *
 * @author xinchen (xinchenmelody@gmail.com)
 * @date 2017/3/19 16:56.
 * @see 2017/3/19 16:56 Created
 ****************************************/

public class test {
    public static void main(String[] args) {
        String str = "{\"a\":\"b\",\"c\":\"d\"}";
        JSONObject a = JSONObject.parseObject(str);
        System.out.println(a);
    }
}
