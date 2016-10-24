package com.pk.service.cm;

import java.io.File;
import java.io.FileInputStream;
import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.*;

import com.pk.dao.admin.*;
import com.pk.model.admin.*;
import com.pk.service.admin.SysDistService;
import com.pk.service.admin.SysOrgService;
import com.pk.service.admin.SysTreeService;
import com.pk.vo.admin.SysDistSearchVO;
import com.pk.vo.admin.SysOrgSearchVO;
import com.pk.vo.admin.SysTreeSearchVO;
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

import com.pk.dao.cm.CmInfoDao;
import com.pk.framework.cfg.UserInfoContext;
import com.pk.framework.service.BaseService;
import com.pk.framework.vo.Result;
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

    @Autowired
    private SysDistDao sysDistDao;

    @Autowired
    private SysOrgDao sysOrgDao;

    @Autowired
    private SysOrgService sysOrgService;

    @Autowired
    private SysTreeService sysTreeService;

    @Autowired
    private SysTreeDao sysTreeDao;
    
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
        List<String> heads = new ArrayList<String>();
        List<List<String>> datas = new ArrayList<List<String>>();
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
                if(row == null) {
                    continue;
                }

                List<String> data = new ArrayList<>();
                for(int j=row.getFirstCellNum(),len=row.getLastCellNum();j<len;j++){
                    cell = row.getCell(j);
                    val = getCellVal(cell);
                    
                    if(first){
                    	heads.add(val);
                    }else{
                    	data.add(val);
                    }
                }
                if(!first)
                    datas.add(data);
                first = false;
            }
        }catch(Exception e){
            e.printStackTrace();
            logger.error("导入客户信息异常", e);
            return Result.FAILURE("Excel文件异常");
        }
        if(heads.isEmpty()||datas.isEmpty()){
            return Result.FAILURE("Excel内容为空");
        }
        Map<String, Integer> indexMap = new HashMap<>();
        String headName = null;
        for(int i=0,len=heads.size();i<len;i++){
            headName = heads.get(i);
            if(!indexMap.containsKey(headName))
                indexMap.put(headName, i);
        }

        List<SysField> fields = sysFieldService.loadAllWithCache();
        Map<String, SysField> fieldMap = new LinkedHashMap<>();
        Map<String, SysField> fieldRefs = new LinkedHashMap<>();
        String impName = null;
        for(SysField field:fields){
            impName = null;
            if(type==1){
                impName = field.getJrgsName();
            }else if(type==2){
                impName = field.getBbName();
            }else if(type==3){
                impName = field.getXfxtName();
            }

            if(impName==null||impName.length()<1)
                impName = field.getName();
            fieldMap.put(impName, field);
            if(field.getDistKey()!=null&&field.getDistKey().length()>0)
                fieldRefs.put(field.getDistKey(), field);
        }

        distCache = null;
        treeCache = null;
        orgCache = null;

        List<CmInfo> list = new ArrayList<>();
        SysField field = null;
        Method[] methods = CmInfo.class.getDeclaredMethods();
        for(List<String> data:datas){
            boolean matchOne = false;
            CmInfo vo = new CmInfo();
            String val = null;
            for(String head:heads){
                field = fieldMap.get(head);
                if(field==null)
                    continue;
                int idx = indexMap.get(head);
                val = data.get(idx);
                if(val==null||val.length()<1)
                    continue;
                boolean flag = setFieldVal(vo, field, val, methods, fieldRefs, true);
                if(flag)
                    matchOne = true;
            }
            if(matchOne)
                list.add(vo);
        }

        for(CmInfo vo:list){
            cmInfoDao.insert(vo);
        }
        return Result.SUCCESS("导入成功,数量:" + list.size());
    }

    private boolean setFieldVal(CmInfo vo, SysField field, String val, Method[] methods, Map<String, SysField> fieldRefs, boolean newIfNotExist){
        Method method = lookupMethod(methods, "set" + field.getFname());
        if(method==null)
            return false;
        boolean succ = false;
        String stype = field.getStype();
        String ftype = field.getFtype();
        if("text".equals(stype)||"date".equals(stype)){
            try {
                if("int".equals(ftype)){
                    method.invoke(vo, Integer.parseInt(val));
                }else if("double".equals(ftype)){
                    method.invoke(vo, Double.parseDouble(val));
                }else{
                    method.invoke(vo, val);
                }
                succ = true;
            } catch (Exception e) {
                e.printStackTrace();
                logger.error("Bean反射设值异常,TYPE:"+stype+",FIELD:"+field.getFname()+",VAL:" + val, e);
            }
        }else if("dist".equals(stype)){
            try {
                SysDist dist = getDistByVal(field.getDistType(), val, newIfNotExist);
                if(dist==null)
                    return false;
                method.invoke(vo, dist.getKey());
                succ = true;
            } catch (Exception e) {
                e.printStackTrace();
                logger.error("Bean反射设值异常,TYPE:"+stype+",FIELD:"+field.getFname()+",VAL:" + val, e);
            }
        }else if("tree".equals(stype)){
            int pid = -1;
            try {
                if(field.getTreeLevel()==1){
                    pid = 0;
                }else{
                    SysField ref = fieldRefs.get(field.getFname());
                    if(ref==null)
                        return false;
                    Method refMethod = lookupMethod(methods, "get" + ref.getFname());
                    Integer obj = (Integer)refMethod.invoke(vo);
                    if(obj==null)
                        return false;
                    pid = obj;
                }
                if(pid<0)
                    return false;

                SysTree tree = getTreeByVal(field.getDistType(), val, pid, newIfNotExist);
                if(tree==null)
                    return false;
                method.invoke(vo, tree.getId());
                succ = true;
            } catch (Exception e) {
                e.printStackTrace();
                logger.error("Bean反射设值异常,TYPE:"+stype+",FIELD:"+field.getFname()+",VAL:" + val, e);
            }
        }else if("org".equals(stype)){
            int pid = -1;
            try {
                if(field.getTreeLevel()==1){
                    pid = 0;
                }else{
                    SysField ref = fieldRefs.get(field.getFname());
                    if(ref==null)
                        return false;
                    Method refMethod = lookupMethod(methods, "get" + ref.getFname());
                    Integer obj = (Integer)refMethod.invoke(vo);
                    if(obj==null)
                        return false;
                    pid = obj;
                }
                if(pid<0)
                    return false;

                SysOrg org = getOrgByVal(val, pid, newIfNotExist);
                if(org==null)
                    return false;
                method.invoke(vo, org.getId());
                succ = true;
            } catch (Exception e) {
                e.printStackTrace();
                logger.error("Bean反射设值异常,TYPE:"+stype+",FIELD:"+field.getFname()+",VAL:" + val, e);
            }
        }
        return succ;
    }

    private SysDist getDistByVal(String distType, String val, boolean newIfNotExist){
        if(distCache==null){
            SysDistSearchVO svo = new SysDistSearchVO();
            svo.setSize(0);
            List<SysDist> list = sysDistDao.list(svo);
            Map<String, SysDist> map = new HashMap<>();
            if(list!=null){
                for(SysDist dist:list){
                    map.put(dist.getType()+":"+dist.getKey(), dist);
                }
            }
            distCache = map;
        }
        String cacheKey = distType + ":" + val;
        SysDist dist = distCache.get(cacheKey);
        if(dist==null&&newIfNotExist){
            dist = new SysDist();
            dist.setType(distType);
            dist.setKey(val);
            dist.setName(val);
            dist.setRemark("导入时系统自动添加");
            sysDistDao.insert(dist);
            distCache.put(cacheKey, dist);
        }
        return dist;
    }

    private SysTree getTreeByVal(String distType, String val, int pid, boolean newIfNotExist){
        if(treeCache==null){
            SysTreeSearchVO svo = new SysTreeSearchVO();
            List<SysTree> list = sysTreeDao.list(svo);
            Map<String, SysTree> map = new HashMap<>();
            if(list!=null){
                for(SysTree tree:list){
                    map.put(tree.getType()+":"+tree.getPid()+":"+tree.getName(), tree);
                }
            }
            treeCache = map;
        }
        String cacheKey = distType + ":" + pid + ":" + val;
        SysTree tree = treeCache.get(cacheKey);
        if(tree==null&&newIfNotExist){
            tree = new SysTree();
            tree.setType(distType);
            tree.setPid(pid);
            tree.setLevel(pid==0?1:2);
            tree.setName(val);
            sysTreeService.add(tree);
            treeCache.put(cacheKey, tree);
        }
        return tree;
    }

    private SysOrg getOrgByVal(String val, int pid, boolean newIfNotExist){
        if(orgCache==null){
            SysOrgSearchVO svo = new SysOrgSearchVO();
            List<SysOrg> list = sysOrgDao.list(svo);
            Map<String, SysOrg> map = new HashMap<>();
            if(list!=null){
                for(SysOrg org:list){
                    map.put(org.getPid()+":"+org.getName(), org);
                }
            }
            orgCache = map;
        }
        String cacheKey = pid + ":" + val;
        SysOrg org = orgCache.get(cacheKey);
        if(org==null&&newIfNotExist){
            org = new SysOrg();
            org.setPid(pid);
            org.setName(val);
            sysOrgService.add(org);
            orgCache.put(cacheKey, org);
        }
        return org;
    }

    private Map<String, SysDist> distCache = null;
    private Map<String, SysTree> treeCache = null;
    private Map<String, SysOrg> orgCache = null;
    
    private String getCellVal(XSSFCell cell){
    	String val = null;
    	int ctype = cell.getCellType();
		if (ctype == XSSFCell.CELL_TYPE_STRING) {
			val = cell.getStringCellValue();
		} else if (ctype == XSSFCell.CELL_TYPE_NUMERIC) { // 数字
			if (HSSFDateUtil.isCellDateFormatted(cell)) { // 日期
				val = DATE_FORMAT.format(HSSFDateUtil.getJavaDate(cell.getNumericCellValue()));
			} else {
                val = new BigDecimal(cell.getNumericCellValue()).setScale(2, BigDecimal.ROUND_HALF_UP).stripTrailingZeros().toPlainString();
			}
		} else if (ctype == XSSFCell.CELL_TYPE_FORMULA) { // 公式
			double numericValue = cell.getNumericCellValue(); // 公式结果
			if (HSSFDateUtil.isValidExcelDate(numericValue)) { // 日期类型
				val = DATE_FORMAT.format(cell.getDateCellValue());
			} else {
                val = new BigDecimal(numericValue).setScale(2, BigDecimal.ROUND_HALF_UP).stripTrailingZeros().toPlainString();
			}
		} else if (ctype == XSSFCell.CELL_TYPE_BOOLEAN) {
			val = String.valueOf(cell.getBooleanCellValue());
		} else if (ctype == XSSFCell.CELL_TYPE_BLANK) {
			val = "";
		} else {
			val = cell.toString();
		}
        if(val!=null)
            val = val.trim();
    	return val;
    }

    static Method lookupMethod(Method[] methods,String methodName){
        for(Method method:methods){
            if(method.getName().equalsIgnoreCase(methodName))
                return method;
        }
        return null;
    }

}
