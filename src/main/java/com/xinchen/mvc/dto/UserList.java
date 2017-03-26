package com.xinchen.mvc.dto;

/**
 * Description:
 *
 * @author xinchen (xinchenmelody@gmail.com)
 * @date 2017/3/21 21:25.
 * @see 2017/3/21 21:25 Created
 ****************************************/

public class UserList {
    private String userName;
    private String roleName;

    @Override
    public String toString() {
        return "UserList{" +
                "userName='" + userName + '\'' +
                ", role='" + roleName + '\'' +
                '}';
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getRole() {
        return roleName;
    }

    public void setRole(String role) {
        this.roleName = role;
    }
}
