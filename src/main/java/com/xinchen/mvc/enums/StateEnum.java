package com.xinchen.mvc.enums;

/**
 *
 * Created by xinchen on 2017/4/16.
 */
public enum StateEnum {
    SUCCESS(1,"成功"),
    END(0,"结束"),
    REPEAT_KILL(-1,"重复"),
    INNER_ERROR(-2,"系统异常"),
    DATA_REWRITE(-3,"数据篡改");



    private  int state;

    private String stateInfo;

    StateEnum(int state, String stateInfo) {
        this.state = state;
        this.stateInfo = stateInfo;
    }

    public int getState() {
        return state;
    }

    public String getStateInfo() {
        return stateInfo;
    }

    public static StateEnum stateOf(int index){
        for (StateEnum state : values()){
            if (state.getState() == index){
                return state;
            }
        }
        return  null;
    }
}
