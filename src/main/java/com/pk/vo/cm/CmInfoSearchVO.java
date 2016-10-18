package com.pk.vo.cm;

import java.util.Map;

import com.pk.framework.vo.PageSearchVO;

/**
 * Created by jiangkunpeng on 16/10/15.
 */
public class CmInfoSearchVO extends PageSearchVO {
	
	private Map<String, String> map = null;

	public Map<String, String> getMap() {
		return map;
	}

	public void setMap(Map<String, String> map) {
		this.map = map;
	}
	
}
