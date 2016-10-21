package com.pk.model.admin;

import java.io.Serializable;

/**
 * 字段配置
 * Created by jiangkunpeng on 16/10/21.
 */
public class SysField implements Serializable {

	private static final long serialVersionUID = 3870163616099513732L;
	
	private String fname;
    private String sname;
    private String name;
    private String type;
    private String distType;
    private String distKey;
    private int list;
    private int query;
    private int layerWidth;
    private int sortIndex;
    
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getList() {
		return list;
	}
	public void setList(int list) {
		this.list = list;
	}
	public int getQuery() {
		return query;
	}
	public void setQuery(int query) {
		this.query = query;
	}
	public String getDistType() {
		return distType;
	}
	public void setDistType(String distType) {
		this.distType = distType;
	}
	public String getDistKey() {
		return distKey;
	}
	public void setDistKey(String distKey) {
		this.distKey = distKey;
	}
	public int getLayerWidth() {
		return layerWidth;
	}
	public void setLayerWidth(int layerWidth) {
		this.layerWidth = layerWidth;
	}
	public int getSortIndex() {
		return sortIndex;
	}
	public void setSortIndex(int sortIndex) {
		this.sortIndex = sortIndex;
	}
}
