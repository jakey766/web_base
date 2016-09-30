package com.pk.framework.cfg;

/**
 * 保存当前登录用户的信息
 * @author jiangkunpeng
 *
 */
public final class UserInfoContext {
	
	/** 当前的用户ID */
	private static ThreadLocal<Integer> idHolder = new ThreadLocal<Integer>();
	
	/** 当前用户姓名*/
	private static ThreadLocal<String> nameHolder = new ThreadLocal<String>();
	
	/**
	 * 获得已登录的用户ID
	 * @return
	 */
	public static int getId() {
		return (idHolder.get() == null ? 0 : idHolder.get().intValue());
	}
	
	/**
	 * 获得已登录的用户姓名
	 * @return
	 */
	public static String getName() {
		return nameHolder.get();
	}
	
	public static void setId(int id) {
		idHolder.set(id);
	}
	
	public static void setName(String name) {
		nameHolder.set(name);
	}
	
	/**
	 * 清空所有数据
	 */
	public static void clear() {
		idHolder.set(null);
		nameHolder.set(null);
	}
}
