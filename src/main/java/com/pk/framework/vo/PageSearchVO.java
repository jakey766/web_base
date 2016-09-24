package com.pk.framework.vo;

/**
 * 分页查询Bean
 * Created by jiangkunpeng on 16/9/23.
 */
public class PageSearchVO {

    private int page = 1;
    private int size = 0;

    public int getStart() {
        if(page < 0)
            page = 1;
        return (page - 1) * size;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }
}
