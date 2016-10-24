package com.pk.service.cm;

import java.io.File;
import java.io.FileInputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.pk.dao.admin.SysRoleDao;
import com.pk.dao.admin.SysUserDao;
import com.pk.dao.cm.CmInfoDao;
import com.pk.framework.cfg.UserInfoContext;
import com.pk.framework.service.BaseService;
import com.pk.framework.vo.Result;
import com.pk.model.admin.SysField;
import com.pk.model.admin.SysRole;
import com.pk.model.admin.SysUser;
import com.pk.model.cm.CmInfo;
import com.pk.service.admin.SysFieldService;
import com.pk.vo.cm.CmInfoSearchVO;

@Service()
public class CmInfoService extends BaseService {

    private final static Logger logger = Logger.getLogger(CmInfoService.class);

    private static final String KEY_FIELDS_USER = "FIELDS_USER_ID:%s";
    
    private static final SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd");

    @Autowired
    private SysUserDao sysUserDao;

    @Autowired
    private SysRoleDao sysRoleDao;

    @Autowired
    private CmInfoDao cmInfoDao;

    @Autowired
    private SysFieldService sysFieldService;
    
    public Result list(CmInfoSearchVO svo){
        return Result.SUCCESS(cmInfoDao.list(svo));
    }

    @Transactional
    public Result add(CmInfo vo){
        cmInfoDao.insert(vo);
        return Result.SUCCESS(vo);
    }

    @Transactional
    public Result update(CmInfo vo){
        cmInfoDao.update(vo);
        return Result.SUCCESS(vo);
    }

    @Transactional
    public Result delete(int id){
        CmInfo vo = cmInfoDao.get(id);
        if(vo!=null){
            cmInfoDao.delete(id);
        }
    	return Result.SUCCESS();
    }
    
    public CmInfo get(int id){
    	return cmInfoDao.get(id);
    }

    /**
     * 获取我可见的字段
     * @return
     */
    public List<SysField> getMyFields(){
        int userId = UserInfoContext.getId();
        if(userId<1)
            return null;
        String cacheKey = String.format(KEY_FIELDS_USER, userId);
        @SuppressWarnings("unchecked")
		List<SysField> list = getFromCache(cacheKey, List.class);
        if(list==null){
            SysUser user = sysUserDao.get(userId);
            if(user==null) {
                return null;
            }
            String roleIds = user.getRoleIds();
            if(roleIds==null||roleIds.length()<1)
                return null;
            String[] rids = StringUtils.split(roleIds, ",");
            Set<String> mfields = new HashSet<>();
            for(String rid:rids){
                if(rid.length()<1)
                    continue;
                SysRole role = sysRoleDao.get(Integer.parseInt(rid));
                if(role==null)
                    continue;
                String fields = role.getFields();
                if(fields==null||fields.length()<1)
                    continue;
                String[] fieldArr = StringUtils.split(fields, ",");
                for(String field:fieldArr){
                    mfields.add(field);
                }
            }
            if(mfields.isEmpty())
                return null;
            List<SysField> all = sysFieldService.loadAllWithCache();
            if(all==null||all.isEmpty())
                return null;
            list = new ArrayList<>();
            for(SysField f:all){
                if(mfields.contains(f.getFname()))
                    list.add(f);
            }
            putIntoCache(cacheKey, list);
        }
        return list;
    }

    public Result imp(MultipartFile multipartFile, int type){
        if(multipartFile==null||multipartFile.isEmpty())
            return Result.FAILURE("没有文件或者文件为空!");
        List<String> head = new ArrayList<String>();
        List<String> data = new ArrayList<String>();
        try{
            String contentType = multipartFile.getContentType();
            long size = multipartFile.getSize();

            XSSFWorkbook xwb = new XSSFWorkbook(multipartFile.getInputStream());
            XSSFSheet sheet = xwb.getSheetAt(0);
            XSSFRow row = null;
            XSSFCell cell = null;
            int firstRow = sheet.getFirstRowNum();
            int rows = sheet.getPhysicalNumberOfRows();
            String val = null;
            
            boolean first = true;
            for(int i=firstRow;i<rows;i++){
                row = sheet.getRow(i);
                if(row == null)
                    continue;
                
                for(int j=row.getFirstCellNum(),len=row.getLastCellNum();i<len;i++){
                    cell = row.getCell(j);
                    val = getCellVal(cell);
                    
                    if(first){
                    	head.add(val);
                    }else{
                    	data.add(val);
                    }
                }
                first = false;
            }
        }catch(Exception e){
            e.printStackTrace();
            logger.error("导入客户信息异常", e);
            return Result.FAILURE("Excel文件异常");
        }
        return Result.SUCCESS();
    }
    
    private String getCellVal(XSSFCell cell){
    	String val = null;
    	int ctype = cell.getCellType();
		if (ctype == XSSFCell.CELL_TYPE_STRING) {
			val = cell.getStringCellValue();
		} else if (ctype == XSSFCell.CELL_TYPE_NUMERIC) { // 数字
			if (HSSFDateUtil.isCellDateFormatted(cell)) { // 日期
				val = DATE_FORMAT.format(HSSFDateUtil.getJavaDate(cell.getNumericCellValue()));
			} else {
				val = String.valueOf(cell.getNumericCellValue());
			}
		} else if (ctype == XSSFCell.CELL_TYPE_FORMULA) { // 公式
			double numericValue = cell.getNumericCellValue(); // 公式结果
			if (HSSFDateUtil.isValidExcelDate(numericValue)) { // 日期类型
				val = DATE_FORMAT.format(cell.getDateCellValue());
			} else {
				val = String.valueOf(numericValue);
			}
		} else if (ctype == XSSFCell.CELL_TYPE_BOOLEAN) {
			val = String.valueOf(cell.getBooleanCellValue());
		} else if (ctype == XSSFCell.CELL_TYPE_BLANK) {
			val = "";
		} else {
			val = cell.toString();
		}
    	return val;
    }

}
