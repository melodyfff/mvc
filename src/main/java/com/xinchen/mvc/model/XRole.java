package com.xinchen.mvc.model;

/**
 * Description:
 *
 * @author xinchen (xinchenmelody@gmail.com)
 * @date 2017/2/7 22:17.
 * @see 2017/2/7 22:17 Created
 ****************************************/

public class XRole {

    private long id;

    private String roleName;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    @Override
    public String toString() {
        return "XRole{" +
                "id=" + id +
                ", roleName='" + roleName + '\'' +
                '}';
    }
}
