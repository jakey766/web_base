package com.pk.model.admin;

import com.pk.framework.cfg.Constants;
import com.pk.service.admin.SysDistService;

import java.io.Serializable;

/**
 * 字典
 * Created by jiangkunpeng on 16/10/11.
 */
public class SysDist implements Serializable {

    private int id;
    private String type;
    private String key;
    private String name;
    private String remark;

    private SysDistService sysDistService = null;

    public String getTypeName(){
        return Constants.getDistTypeName(type);
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }
}
