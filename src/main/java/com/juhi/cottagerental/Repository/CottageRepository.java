package com.juhi.cottagerental.Repository;

import com.juhi.cottagerental.Model.CottageEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CottageRepository extends JpaRepository<CottageEntity, Integer> {
    public CottageEntity findByName(String name);

    public List<CottageEntity> findTop4ByOrderByCottageId();
}
