package com.pk.framework.vo;

import java.util.List;

/**
 * 分页查询结果封装Bean
 * Created by jiangkunpeng on 16/9/23.
 */
public class PageResultVO {
    private int count;
    private int page;
    private int pageCount;
    private List list;

    public PageResultVO() {
    }

    public PageResultVO(int count, int page, int pageCount, List list) {
        this.count = count;
        this.page = page;
        this.pageCount = pageCount;
        this.list = list;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getPageCount() {
        return pageCount;
    }

    public void setPageCount(int pageCount) {
        this.pageCount = pageCount;
    }

    public List getList() {
        return list;
    }

    public void setList(List list) {
        this.list = list;
    }
}
