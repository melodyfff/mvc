package com.xinchen.mvc.model;

import java.util.Date;

/**
 * Description:用户实体类
 *
 * @author xinchen (xinchenmelody@gmail.com)
 * @date 2017/2/7 21:56.
 * @see 2017/2/7 21:56 Created
 ****************************************/

public class XUser {

    private long id;

    private String username;

    private String password;

    private long roleId;

    private String role;

    private String address;

    private String email;

    private String sexual;

    private String name;

    private Date createTime;

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSexual() {
        return sexual;
    }

    public void setSexual(String sexual) {
        this.sexual = sexual;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public long getRoleId() {
        return roleId;
    }

    public void setRoleId(long roleId) {
        this.roleId = roleId;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "XUser{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", roleId=" + roleId +
                ", role='" + role + '\'' +
                ", address='" + address + '\'' +
                ", email='" + email + '\'' +
                ", sexual='" + sexual + '\'' +
                ", name='" + name + '\'' +
                ", createTime='" + createTime + '\'' +
                '}';
    }
}
