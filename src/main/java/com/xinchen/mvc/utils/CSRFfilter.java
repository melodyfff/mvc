package com.xinchen.mvc.utils;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

/**
 * Description:
 *
 * @author xinchen (xinchenmelody@gmail.com)
 * @date 2017/3/1 20:50.
 * @see 2017/3/1 20:50 Created
 ****************************************/

public class CSRFfilter implements Filter{
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("进入Filter");
    }

    @Override
    public void doFilter(ServletRequest rqt, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        // 从 HTTP 头中取得 Referer 值
        HttpServletRequest request = (HttpServletRequest) rqt;
        String referer=request.getHeader("Referer");
        // 判断 Referer 是否以 bank.example 开头
        if((referer!=null) &&(referer.trim().startsWith("http://localhost:8080"))){
            chain.doFilter(request, response);
        }else{
            request.getRequestDispatcher("error.jsp").forward(request,response);
        }
    }

    @Override
    public void destroy() {

    }
}
