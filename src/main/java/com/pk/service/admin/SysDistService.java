package com.pk.service.admin;

import com.pk.dao.admin.SysDistDao;
import com.pk.framework.service.BaseService;
import com.pk.framework.vo.PageResultVO;
import com.pk.framework.vo.Result;
import com.pk.model.admin.SysDist;
import com.pk.vo.admin.SysDistSearchVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Service()
public class SysDistService extends BaseService {

    private static final String KEY_TYPE_LIST = "SysDistList:%s";
    private static final String KEY_TYPE_KEY_GET = "SysDistGet:%s:%s";

    @Autowired
    private SysDistDao sysDistDao;
    
    public Result list(SysDistSearchVO svo){
        PageResultVO page = new PageResultVO();
        int count = sysDistDao.count(svo);
        int totalPage = svo.getSize() < 1 ? 1 : (count + svo.getSize() - 1) / svo.getSize();
        if(count > 0){
            page.setList(sysDistDao.list(svo));
        }
        page.setCount(count);
        page.setPage(svo.getPage());
        page.setPageCount(totalPage);

        return Result.SUCCESS(page);
    }

    @Transactional
    public Result add(SysDist vo){
        SysDistSearchVO svo = new SysDistSearchVO();
        svo.setKey(vo.getKey());
        svo.setType(vo.getType());
        int count = sysDistDao.count(svo);
        if(count>0)
            return Result.FAILURE("已存在相同字典项");
        sysDistDao.insert(vo);
        removeCache(vo, false, true);
        return Result.SUCCESS(vo);
    }

    @Transactional
    public Result update(SysDist vo){
        sysDistDao.update(vo);
        removeCache(vo, true, true);
        return Result.SUCCESS(vo);
    }

    @Transactional
    public Result delete(int id){
        SysDist vo = sysDistDao.get(id);
        if(vo!=null){
            sysDistDao.delete(id);
            removeCache(vo, true, true);
        }
    	return Result.SUCCESS();
    }
    
    public SysDist get(int id){
    	return sysDistDao.get(id);
    }

    /**
     * 通过类型获取字典
     * @param type
     * @return
     */
    public List<SysDist> loadByType(String type){
        List<SysDist> list = null;
        String cacheKey = String.format(KEY_TYPE_LIST, type);
        list = getFromCache(cacheKey, List.class);
        if(list==null){
            SysDistSearchVO svo = new SysDistSearchVO();
            svo.setType(type);
            list = sysDistDao.list(svo);
            putIntoCache(cacheKey, list);
        }
        return list;
    }

    /**
     * 通过类型+键获取字典
     * @param type
     * @param key
     * @return
     */
    public SysDist get(String type, String key){
        SysDist vo = null;
        String cacheKey = String.format(KEY_TYPE_KEY_GET, type, key);
        vo = getFromCache(cacheKey, SysDist.class);
        if(vo==null){
            SysDistSearchVO svo = new SysDistSearchVO();
            svo.setType(type);
            svo.setKey(key);
            List<SysDist> list = sysDistDao.list(svo);
            if(list!=null&&list.size()>0){
                vo = list.get(0);
            }
            putIntoCache(cacheKey, vo);
        }
        return vo;
    }

    /**
     * 获取字典显示值
     * @param type
     * @param key
     * @return
     */
    public String getDistName(String type, String key){
        SysDist vo = null;
        String cacheKey = String.format(KEY_TYPE_KEY_GET, type, key);
        vo = getFromCache(cacheKey, SysDist.class);
        if(vo==null){
            SysDistSearchVO svo = new SysDistSearchVO();
            svo.setType(type);
            svo.setKey(key);
            List<SysDist> list = sysDistDao.list(svo);
            if(list!=null&&list.size()>0){
                vo = list.get(0);
            }
            putIntoCache(cacheKey, vo);
        }
        if(vo!=null)
            return vo.getName();
        return null;
    }

    /**
     * 删除缓存
     * @param vo
     * @param single
     * @param list
     */
    private void removeCache(SysDist vo, boolean single, boolean list){
        if(single){
            String cacheKey = String.format(KEY_TYPE_KEY_GET, vo.getType(), vo.getKey());
            removeCache(cacheKey);
        }
        if(list){
            String cacheKey = String.format(KEY_TYPE_LIST, vo.getType());
            removeCache(cacheKey);
        }
    }

}
