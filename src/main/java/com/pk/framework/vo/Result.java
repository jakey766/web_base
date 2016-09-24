package com.pk.framework.vo;

import java.io.Serializable;

/**
 * 返回结果封装
 * Created by jiangkunpeng on 16/9/23.
 */
public class Result implements Serializable{

	private static final long serialVersionUID = 4851156172103989596L;
	
	public static final int CODE_SUCCESS = 0;
    public static final int CODE_FAILURE = -1;

    public static final String MESSAGE_SUCCESS = "操作成功";
    public static final String MESSAGE_FAILURE = "操作失败";

    private int code;
    private String message;
    private Object object;

    public static Result instance(){
        return new Result();
    }

    public static Result instance(int code, String message, Object object){
        return new Result(code, message, object);
    }

    public static Result SUCCESS(){
        return new Result(CODE_SUCCESS, MESSAGE_SUCCESS, null);
    }

    public static Result SUCCESS(Object object){
        return new Result(CODE_SUCCESS, MESSAGE_SUCCESS, object);
    }

    public static Result FAILURE(){
        return new Result(CODE_FAILURE, MESSAGE_FAILURE, null);
    }

    public static Result FAILURE(String message){
        return new Result(CODE_FAILURE, message, null);
    }

    public Result() {
    }

    public Result(int code, String message, Object object) {
        this.code = code;
        this.message = message;
        this.object = object;
    }

    public boolean isSuccess(){
        return code == CODE_SUCCESS;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Object getObject() {
        return object;
    }

    public void setObject(Object object) {
        this.object = object;
    }
}
