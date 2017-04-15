package com.xinchen.mvc.utils;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

/**
 * spring bean 获取
 * Created by xinchen on 2017/4/15.
 */
public class ApplicationUtil implements ApplicationContextAware {
    private static ApplicationContext applicationContext;
    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        ApplicationUtil.applicationContext = applicationContext;
    }
    public static Object getBean(String name){
        return applicationContext.getBean(name);
    }
}
