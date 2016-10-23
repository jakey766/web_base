package com.pk.service.cm;

import com.pk.dao.cm.CmInfoDao;
import com.pk.framework.service.BaseService;
import com.pk.framework.vo.Result;
import com.pk.model.cm.CmInfo;
import com.pk.vo.cm.CmInfoSearchVO;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

@Service()
public class CmInfoService extends BaseService {

    private final static Logger logger = Logger.getLogger(CmInfoService.class);

    @Autowired
    private CmInfoDao cmInfoDao;
    
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

    public Result imp(MultipartFile multipartFile, int type){
        if(multipartFile==null||multipartFile.isEmpty())
            return Result.FAILURE("没有文件或者文件为空!");
        try{
            byte[] data = multipartFile.getBytes();
            String contentType = multipartFile.getContentType();
            long size = multipartFile.getSize();
            String fileName = multipartFile.getOriginalFilename();

            
            System.out.println(fileName);
            System.out.println(size);
            System.out.println(contentType);
        }catch(Exception e){
            e.printStackTrace();
            logger.error("导入客户信息异常", e);
            return Result.FAILURE("后台异常:" + e.getMessage());
        }
        return Result.SUCCESS();
    }

}
