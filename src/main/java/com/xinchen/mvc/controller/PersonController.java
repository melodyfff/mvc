package com.xinchen.mvc.controller;

import com.xinchen.mvc.model.Person;
import com.alibaba.fastjson.JSON;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.util.*;

/**
 * Description:
 *
 * @author xinchen (xinchenmelody@gmail.com)
 * @date 2016/12/14 21:39.
 * @see 2016/12/14 21:39 Created
 ****************************************/
@Controller
@RequestMapping("/person")
public class PersonController {

    @RequestMapping(value = "main",method = RequestMethod.GET)
    public String forwardPerson(){
        return "/person/person";
    }

    @RequestMapping(value = "postForm",method = RequestMethod.POST)
    @ResponseBody
    public  Object postForm1(Person person){
        System.out.println("name:"+person.getName()+" age:"+person.getAge());
        System.out.println(JSON.toJSON(person));
        return JSON.toJSON(person);
    }

    @ResponseBody
    @RequestMapping(value = "/getJson",method = RequestMethod.GET)
    public Person getJson(){
        Person person = new Person();
        person.setName("test");
        person.setAge("21");
        return person;
    }

    @ResponseBody
    @RequestMapping("/page")
    public Map<String,Object> page(){
        Map<String,Object> model = new HashMap();
        Person person1 = new Person();
        person1.setName("test1");
        person1.setAge("21");
        Person person2 = new Person();
        person2.setName("test2");
        person2.setAge("22");
        List <Person> list = new LinkedList<Person>();
        list.add(person1);
        list.add(person2);
        for (int i = 0;i<10;i++){
            list.add(person2);
        }
        model.put("total",10);
        model.put("rows",list);
        return model;
    }
    //采用multipart提供的file.transfer方法上传文件
    @RequestMapping("/fileUpload")
    public String fileUpload(@RequestParam(value = "fileUp",required = false)CommonsMultipartFile file)throws IOException{
        long  startTime=System.currentTimeMillis();
        System.out.println("fileName："+file.getOriginalFilename());
        String path="E:/"+new Date().getTime()+file.getOriginalFilename();

        File newFile=new File(path);
        //通过CommonsMultipartFile的方法直接写文件（注意这个时候）
        file.transferTo(newFile);
        long  endTime=System.currentTimeMillis();
        System.out.println("方法二的运行时间："+String.valueOf(endTime-startTime)+"ms");
        return "success";
    }
    /*
     * 通过流的方式上传文件
     * @RequestParam("file") 将name=file控件得到的文件封装成CommonsMultipartFile 对象
     */
    @RequestMapping("/fileUpload2")
    public String  fileUpload2(@RequestParam("file") CommonsMultipartFile file) throws IOException {


        //用来检测程序运行时间
        long  startTime=System.currentTimeMillis();
        System.out.println("fileName："+file.getOriginalFilename());

        try {
            //获取输出流
            OutputStream os=new FileOutputStream("E:/"+new Date().getTime()+file.getOriginalFilename());
            //获取输入流 CommonsMultipartFile 中可以直接得到文件的流
            InputStream is=file.getInputStream();
            int temp;
            //一个一个字节的读取并写入
            while((temp=is.read())!=(-1))
            {
                os.write(temp);
            }
            os.flush();
            os.close();
            is.close();

        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        long  endTime=System.currentTimeMillis();
        System.out.println("方法一的运行时间："+String.valueOf(endTime-startTime)+"ms");
        return "/success";
    }

    /*
     *采用spring提供的上传文件的方法
     */
    @RequestMapping("springUpload")
    public String  springUpload(HttpServletRequest request) throws IllegalStateException, IOException
    {
        long  startTime=System.currentTimeMillis();
        //将当前上下文初始化给  CommonsMutipartResolver （多部分解析器）
        CommonsMultipartResolver multipartResolver=new CommonsMultipartResolver(
                request.getSession().getServletContext());
        //检查form中是否有enctype="multipart/form-data"
        if(multipartResolver.isMultipart(request))
        {
            //将request变成多部分request
            MultipartHttpServletRequest multiRequest=(MultipartHttpServletRequest)request;
            //获取multiRequest 中所有的文件名
            Iterator iter=multiRequest.getFileNames();

            while(iter.hasNext())
            {
                //一次遍历所有文件
                MultipartFile file=multiRequest.getFile(iter.next().toString());
                if(file!=null)
                {
                    String path="E:/springUpload"+file.getOriginalFilename();
                    //上传
                    file.transferTo(new File(path));
                }

            }

        }
        long  endTime=System.currentTimeMillis();
        System.out.println("方法三的运行时间："+String.valueOf(endTime-startTime)+"ms");
        return "/success";
    }

}
