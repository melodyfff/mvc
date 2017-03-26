package com.xinchen.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Description:
 *
 * @author xinchen (xinchenmelody@gmail.com)
 * @date 2017/3/20 20:32.
 * @see 2017/3/20 20:32 Created
 ****************************************/
@Controller
public class ErrorController {
    @RequestMapping("500")
    public String error(){
        return "500";
    }
}
