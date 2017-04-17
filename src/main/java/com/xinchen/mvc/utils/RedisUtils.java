package com.xinchen.mvc.utils;

import redis.clients.jedis.*;

import java.util.ArrayList;
import java.util.List;

/**
 * Description:
 *
 * @author xinchen (xinchenmelody@gmail.com)
 * @date 2017/3/4 20:41.
 * @see 2017/3/4 20:41 Created
 ****************************************/

public class RedisUtils {
    private Jedis jedis;
    private String address = "localhost";
    private int aera = 1;


    //初始化
    public RedisUtils() {
        init();
    }

    public RedisUtils(String address, int aera) {
        try {

            this.jedis = new Jedis(address);
            this.jedis.select(aera);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void init() {
        this.jedis = new Jedis(address);
        this.jedis.select(aera);
    }

    /**
     * 判断是否连接PONG
     * @return String
     */
    public String isConnection() {
        return this.jedis.ping();
    }

    /**
     * 根据KEY获取VALUE
     * @param key
     * @return String
     */
    public String get(String key) {
        StringBuffer sb = new StringBuffer();
        try {
            sb.append(this.jedis.get(key));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return sb.toString();
    }

    /**
     * 获取所有键名
     * @return List
     */
    public List<String> getkeys(){
        List<String> list = new ArrayList<String>(jedis.keys("*"));
        return list;
    }

}