package com.xinchen.mvc.core.base;

import java.util.List;

/**
 * Description:
 *
 * @author xinchen (xinchenmelody@gmail.com)
 * @date 2017/4/3 1:17.
 * @see 2017/4/3 1:17 Created
 ****************************************/

public class ResponseJson<T> {
    private int status;

    private String errmsg;

    private T data;

    private List<T> dataList;

    public ResponseJson() {
        this.status = 200;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getErrmsg() {
        return errmsg;
    }

    public void setErrmsg(String errmsg) {
        this.errmsg = errmsg;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }

    public List<T> getDataList() {
        return dataList;
    }

    public void setDataList(List<T> dataList) {
        this.dataList = dataList;
    }

    @Override
    public String toString() {
        return "ResponseJson{" +
                "status='" + status + '\'' +
                ", errmsg='" + errmsg + '\'' +
                ", data=" + data +
                ", dataList=" + dataList +
                '}';
    }
}
