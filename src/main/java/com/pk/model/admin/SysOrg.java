package com.pk.model.admin;

import java.io.Serializable;

/**
 * 组织架构
 * Created by jiangkunpeng on 16/10/5.
 */
public class SysOrg implements Serializable {

    private int id;
    private int type;
    private int pid;
    private String name;
    private String code;
    private int auth = 0;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public int getAuth() {
        return auth;
    }

    public void setAuth(int auth) {
        this.auth = auth;
    }
}
