package com.pk.framework.spring;

import org.springframework.context.ApplicationContext;

/**
 * 获取SpringContext
 * @author jiangkunpeng
 *
 */
public final class SpringContextUtil {

	private static ApplicationContext context = null;
	
	private SpringContextUtil(){
	}

	public static ApplicationContext getContext() {
		return context;
	}

	public static void setContext(ApplicationContext context) {
		SpringContextUtil.context = context;
	}

	public static Object getBean(String beanId) {
		return context.getBean(beanId);
	}
    
	public static <T> T getBean(Class<T> requiredType ) {
		return context.getBean(requiredType);
	}
	
}
