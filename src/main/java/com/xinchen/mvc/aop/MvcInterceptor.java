package com.xinchen.mvc.aop;

import com.xinchen.mvc.service.Impl.OrderServiceImpl;
import org.apache.log4j.Logger;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.*;
import org.springframework.stereotype.Component;

/**
 * 拦截器
 * Created by xinchen on 2017/4/15.
 */
@Component
@Aspect
public class MvcInterceptor {
    private final static Logger logger = Logger.getLogger(MvcInterceptor.class.getName());

    @Pointcut("execution(* com.xinchen.mvc.service.*.*(..))")

    //声明一个切入点
    private void anyMethod() {
    }

    @After("anyMethod()")//声明最终通知
    public void doAfter() {
//        logger.info("方法执行完毕");
    }

    @Around("anyMethod()")//声明环绕通知
    public Object doAround(ProceedingJoinPoint pjp) throws Throwable {
        logger.info("-----------------------");
        logger.info("----------开始执行业务---------");
        //显示调用，确保被代理的方法被调用
        Object o = pjp.proceed();
        logger.info("----------业务执行完毕---------");
        logger.info("-----------------------");
        return o;
    }
}

