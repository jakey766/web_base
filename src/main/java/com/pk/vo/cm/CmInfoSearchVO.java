package com.pk.vo.cm;

import java.util.List;
import java.util.Map;

import com.pk.framework.vo.PageSearchVO;

/**
 * Created by jiangkunpeng on 16/10/15.
 */
public class CmInfoSearchVO extends PageSearchVO {
	
	private Map<String, String> map = null;
	
	private List<String> orgCodes = null;

	public Map<String, String> getMap() {
		return map;
	}

	public void setMap(Map<String, String> map) {
		this.map = map;
	}

	public List<String> getOrgCodes() {
		return orgCodes;
	}

	public void setOrgCodes(List<String> orgCodes) {
		this.orgCodes = orgCodes;
	}
	
}
