package com.pk.framework.spring;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Type;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.UrlPathHelper;

import com.google.gson.reflect.TypeToken;
import com.pk.framework.cfg.Constants;
import com.pk.framework.cfg.UserInfoContext;
import com.pk.framework.util.CookieUtil;
import com.pk.framework.util.JSONUtil;
import com.pk.framework.util.ResponseUtil;
import com.pk.framework.vo.Result;
import com.pk.service.admin.CommonService;

/**
 * 权限拦截器
 * @author Administrator
 *
 */
public class BaseInterceptor implements HandlerInterceptor {
	
	@Autowired
	private CommonService commonService;
	
	private List<String> excludeUrls;
	private List<String> excludeIfLoginUrls;
	private String   loginUrl;
	private String   errorUrl;
	

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		CookieUtil cookieUtil = new CookieUtil(request, response);
		cookieUtil.buildDomainByRequest();
		int userId = cookieUtil.getInt(Constants.KEY_USER_ID);
		UserInfoContext.clear();
		UserInfoContext.setId(userId);
		UserInfoContext.setName(cookieUtil.getString(Constants.KEY_USER_NAME));

		Result result = new Result();
		//这里检测权限
		String uri = getURI(request);
		System.out.println(uri);
		if(exclude(excludeUrls, uri)) {
			return true;
		}

		if(userId==-1){
			result.setMessage("用户没有登录.");
			dealHandle(request, response, result, true);
			return false;
		}

		if(exclude(excludeIfLoginUrls, uri)) {
			return true;
		}

		/*
		if(uri.endsWith(".do")){
			return true;
		}
		*/

		if(!exclude(commonService.getUserUris(userId), uri)){
			result.setMessage("没有权限.");
			dealHandle(request, response, result, false);
			return false;
		}

		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
		UserInfoContext.clear();
	}
	
	/**
	 * 处理返回信息，
	 * 如果是JSPX页面的请求，则转到错误信息;
	 * 如果是AJAX请求，则返回JSON数据
	 */
	private void dealHandle(HttpServletRequest request, HttpServletResponse response, Result result, boolean login) throws ServletException, IOException {
		String uri = request.getRequestURI();
		// 页面请求
		if(uri.lastIndexOf(".jspx")!=-1) {
			request.setAttribute("result", result);
			if(login) {
				response.sendRedirect(getLoginUrl(request));
			} else {
				request.setAttribute("error", result.getMessage());
				request.getRequestDispatcher(errorUrl).forward(request,response);
			}
		} else { // AJAX请求
			Type targetType = new TypeToken<Result>() {}.getType();
			String json = JSONUtil.toJson(result, targetType, false);
			ResponseUtil.renderJson(response, json);
		}
	}
	
	/**
	 * 获取登录地址
	 * @param request
	 * @return
	 */
	private String getLoginUrl(HttpServletRequest request) {
		StringBuilder buff = new StringBuilder();
		if (loginUrl.startsWith("/")) {
			String ctx = request.getContextPath();
			if (!StringUtils.isBlank(ctx)) {
				buff.append(ctx);
			}
		}
		String port = request.getServerPort()==80?"":":"+request.getServerPort();
		String basePath= request.getScheme()+"://"+request.getServerName()+port;
		buff.append(loginUrl).append("?");
		
		String callBack = basePath+request.getRequestURI();
		if(request.getQueryString()!=null){
			callBack =  callBack + "?"+request.getQueryString();
		}
		try {
			callBack = URLEncoder.encode(callBack,"UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		buff.append("callBack").append("=").append(callBack);
		
		return buff.toString();
	}
	
	/**
	 * 获取系统资源地址
	 * @param request
	 */
	private String getURI(HttpServletRequest request){
		UrlPathHelper helper = new UrlPathHelper();
		String uri = helper.getOriginatingRequestUri(request);
		String ctxPath = helper.getOriginatingContextPath(request);
		return uri.replaceFirst(ctxPath, "");
	}
	
	/**
	 * 不需要权限控制URL
	 * @param uri
	 * @return
	 */
	private boolean exclude(List<String> urls, String uri) {
		if (urls != null) {
			for (String exc : urls) {
				if (exc.equals(uri)) {
					return true;
				}
			}
		}
		return false;
	}

	public String getLoginUrl() {
		return loginUrl;
	}
	public void setLoginUrl(String loginUrl) {
		this.loginUrl = loginUrl;
	}
	public String getErrorUrl() {
		return errorUrl;
	}
	public void setErrorUrl(String errorUrl) {
		this.errorUrl = errorUrl;
	}

	public List<String> getExcludeUrls() {
		return excludeUrls;
	}

	public void setExcludeUrls(List<String> excludeUrls) {
		this.excludeUrls = excludeUrls;
	}

	public List<String> getExcludeIfLoginUrls() {
		return excludeIfLoginUrls;
	}

	public void setExcludeIfLoginUrls(List<String> excludeIfLoginUrls) {
		this.excludeIfLoginUrls = excludeIfLoginUrls;
	}
}
