package com.xinchen.mvc.utils;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 日期工具类
 * Created by xinchen on 2017/4/14.
 */
public class DateUtils {

    public static final String DEFORM = "yyyy-MM-dd HH:mm:ss";
    /**
     * Date类型转换为日期字符串"yyyy-MM-dd HH:mm:ss"
     *
     * @return yyyy-MM-dd HH:mm:ss
     */
    public static String getDateString(Date date) {
        DateFormat dFormat = new SimpleDateFormat(DEFORM); //HH表示24小时制；
        return dFormat.format(date);
    }

    /**
     *
     * @param date 日期字符串
     * @return Date
     * @throws ParseException 转换错误
     */
    public static Date getDate(String date) throws ParseException {
        //格式String型转成Date型：2016-07-06 10:17:48 -> Wed Jul 06 10:17:48 CST 2016
        SimpleDateFormat lsdStrFormat = new SimpleDateFormat(DEFORM);
        return lsdStrFormat.parse(date);
    }

    /**
     *
     * @param date1 日期1
     * @param date2 日期2
     * @return 0相同，-1小于，1大于
     */
    public static int compareDate(String date1,String date2){
        return date1.compareTo(date2);
    }

    /**
     *
     * @param date1 日期1
     * @param date2 日期2
     * @return 0相同，-1小于，1大于
     */
    public static int compareDate(Date date1,Date date2){
        return date1.compareTo(date2);
    }
}
