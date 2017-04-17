package com.xinchen.mvc.utils;

import net.sf.ehcache.Cache;
import net.sf.ehcache.CacheManager;
import net.sf.ehcache.Element;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;

/**
 *
 * Created by xinchen on 2017/4/15.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring-base.xml"})
public class EhcacheUtilsTest {
    @Autowired
    private CacheManager manager;
    @Test
    public void test(){
        // Creating a CacheManager based on a specified configuration file.
        // obtains a Cache called sampleCache1, which has been preconfigured in the configuration file
//        Cache cache = manager.getCache("UserCache");
//        // puts an element into a cache
//        Element element = new Element("key1", "哈哈");
//        cache.put(element);
//        //The following gets a NonSerializable value from an element with a key of key1.
//        Object value = element.getObjectValue();
//        System.out.println(value.toString());
//        manager.shutdown();
        EhcacheUtils ehcacheUtils = new EhcacheUtils();
        ehcacheUtils.put("UserCache","test","test");
        Object o = ehcacheUtils.get("UserCache","test");
        System.out.println(o.toString());
    }

}