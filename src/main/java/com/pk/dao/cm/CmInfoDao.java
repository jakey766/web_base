package com.pk.dao.cm;

import com.pk.framework.vo.PageResultVO;
import com.pk.model.cm.CmInfo;
import com.pk.vo.cm.CmInfoSearchVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedRowMapper;

import javax.annotation.Resource;
import java.lang.reflect.Method;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by jiangkunpeng on 16/10/11.
 */
@Resource
public class CmInfoDao{

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public CmInfo get(int id){
        return null;
    }

    public PageResultVO list(CmInfoSearchVO svo){
        StringBuilder sql = new StringBuilder(200);
        List<Object> params = new ArrayList<Object>();
        PageResultVO page = new PageResultVO();
        Object[] _params = params.toArray();
        String _sql = "SELECT COUNT(id) FROM cm_info WHERE 1=1 " + sql.toString();
        int count = jdbcTemplate.queryForInt(_sql, _params);
        int totalPage = svo.getSize() < 1 ? 1 : (count + svo.getSize() - 1) / svo.getSize();
        if(count > 0){
            _sql = "SELECT * FROM cm_info WHERE 1=1" + sql.toString() + " LIMIT " + svo.getStart() + " " + svo.getSize();
            List<CmInfo> list = jdbcTemplate.query(_sql, _params, CmInfoRowMapper);
            page.setList(list);
        }
        page.setCount(count);
        page.setPage(svo.getPage());
        page.setPageCount(totalPage);

        return page;
    }

    public void insert(CmInfo vo){

    }

    public void update(CmInfo vo){

    }

    public void delete(int id){
        String _sql = "UPDATE cm_info SET updated=1 WHERE id=?";
        jdbcTemplate.update(_sql, id);
    }

    static Method lookupMethod(Method[] methods,String methodName){
        for(Method method:methods){
            if(method.getName().equalsIgnoreCase(methodName))
                return method;
        }
        return null;
    }

    static ParameterizedRowMapper<CmInfo> CmInfoRowMapper = new ParameterizedRowMapper<CmInfo>(){
        @Override
        public CmInfo mapRow(ResultSet rs, int i) throws SQLException {
            Map<String, String> columnName = new HashMap<String, String>();
            ResultSetMetaData md = rs.getMetaData();
            for (int j = 0; j < md.getColumnCount(); j++) {
                columnName.put(String.valueOf(j), md.getColumnName(j + 1));
            }

            Method[] methods = CmInfo.class.getDeclaredMethods();
            String colName = null;
            String val = null;

            CmInfo vo = new CmInfo();

            return vo;
        }
    };
}
