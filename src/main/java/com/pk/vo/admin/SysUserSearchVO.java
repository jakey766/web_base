package com.pk.vo.admin;

import com.pk.framework.vo.PageSearchVO;

/**
 * Created by jiangkunpeng on 16/9/23.
 */
public class SysUserSearchVO extends PageSearchVO{

    private String keywords;
    private String mobile;
    private String email;

    private int deleted = 0;    //-1:所有,0:未删除,1:已删除

    public String getKeywords() {
        return keywords;
    }

    public void setKeywords(String keywords) {
        this.keywords = keywords;
    }

    public int getDeleted() {
        return deleted;
    }

    public void setDeleted(int deleted) {
        this.deleted = deleted;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
