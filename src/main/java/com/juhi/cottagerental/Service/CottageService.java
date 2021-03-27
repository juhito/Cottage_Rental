package com.juhi.cottagerental.Service;

import com.juhi.cottagerental.Data.CottageData;
import com.juhi.cottagerental.Model.CottageEntity;
import com.juhi.cottagerental.Repository.CottageRepository;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("cottageService")
public class CottageService {

    @Autowired
    private CottageRepository cottageRepository;

    public void addCottage(CottageData cottageData) throws Exception {
        CottageEntity cottageEntity = new CottageEntity();
        BeanUtils.copyProperties(cottageData, cottageEntity);
        System.out.println("Saving cottage data");
        cottageRepository.save(cottageEntity);
    }
}
