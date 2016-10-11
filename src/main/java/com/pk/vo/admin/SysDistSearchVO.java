package com.pk.vo.admin;

import com.pk.framework.vo.PageSearchVO;

/**
 * Created by jiangkunpeng on 16/10/11.
 */
public class SysDistSearchVO extends PageSearchVO {
    private String type;
    private String key;

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }
}
