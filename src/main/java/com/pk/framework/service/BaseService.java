package com.pk.framework.service;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Service基类
 * @author jiangkunpeng
 *
 */
public class BaseService {
	
	private static final Map<String, Object> Cache = new ConcurrentHashMap<String, Object>();
	
	/**
	 * 存缓存
	 * @param key
	 * @param value
	 * @return
	 */
	public boolean putIntoCache(String key, Object value){
		Cache.put(key, value);
		//以后可加远程缓存
		return true;
	}

	/**
	 * 取缓存
	 * @param key
	 * @return
	 */
	public Object getFromCache(String key){
		Object obj = Cache.get(key);
		if(obj==null){
			//从远程缓存中取
		}
		return obj;
	}

	/**
	 * 删除缓存
	 * @param key
	 * @return
	 */
	public boolean removeCache(String key){
		Cache.remove(key);
		//以后可加远程缓存
		return true;
	}
	
}
