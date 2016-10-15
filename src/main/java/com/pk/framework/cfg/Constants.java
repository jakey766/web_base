package com.pk.framework.cfg;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by jiangkunpeng on 16/9/25.
 */
public final class Constants {

	//用户ID
    public static final String KEY_USER_ID = "USER_ID";
    //用户姓名
    public static final String KEY_USER_NAME = "USER_NAME";
    //用户菜单缓存
	public static final String KEY_USER_MENU ="USER_MENU";
    //字典类型
    private static final Map<String, String> DIST_TYPE_MAP = new HashMap<String, String>();
    //树形字典类型
    private static final Map<String, String> TREE_TYPE_MAP = new HashMap<String, String>();

    static{
        DIST_TYPE_MAP.put("ZJLX", "证件类型");
        DIST_TYPE_MAP.put("XB", "性别");
        DIST_TYPE_MAP.put("JYCD", "教育程度");
        DIST_TYPE_MAP.put("FCLX", "房产类型");
        DIST_TYPE_MAP.put("HYZK", "婚姻状况");
        DIST_TYPE_MAP.put("JTRS", "家庭人数");
        //DIST_TYPE_MAP.put("HYLX", "行业类型");
        DIST_TYPE_MAP.put("CXI", "车系");
        DIST_TYPE_MAP.put("CXING", "车型");
        //DIST_TYPE_MAP.put("SFJC", "是否交车");
        //DIST_TYPE_MAP.put("SFSP", "是否上牌");
        DIST_TYPE_MAP.put("FKFS", "付款方式");
        DIST_TYPE_MAP.put("HKZT", "还款状态");
        DIST_TYPE_MAP.put("DQZT", "当前状态");
        DIST_TYPE_MAP.put("QYXZ", "企业性质");
        DIST_TYPE_MAP.put("CXYS", "车型颜色");
        DIST_TYPE_MAP.put("DKQS", "贷款期数");
        //DIST_TYPE_MAP.put("SCGC", "是否首次购车");
        DIST_TYPE_MAP.put("YYHZSL", "拥有孩子数量");
        //DIST_TYPE_MAP.put("AZCDZ", "安装充电桩");
        DIST_TYPE_MAP.put("LZGX", "两者关系");

        TREE_TYPE_MAP.put("CITY", "省份/城市");
        TREE_TYPE_MAP.put("HYLX", "行业类型");
    }

    public static Map<String, String> getDistTypeMap(){
        return DIST_TYPE_MAP;
    }

    public static String getDistTypeName(String type){
        return DIST_TYPE_MAP.get(type);
    }

    public static Map<String, String> getTreeTypeMap(){
        return TREE_TYPE_MAP;
    }

    public static String getTreeTypeName(String type){
        return TREE_TYPE_MAP.get(type);
    }

}
