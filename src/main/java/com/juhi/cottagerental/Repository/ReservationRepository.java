package com.juhi.cottagerental.Repository;

import com.juhi.cottagerental.Model.CottageEntity;
import com.juhi.cottagerental.Model.ReservationEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.time.LocalDate;
import java.util.List;

public interface ReservationRepository extends JpaRepository<ReservationEntity, Integer> {
    public ReservationEntity findByStartingDate(LocalDate date);
    public ReservationEntity findReservationEntityByReservationId(short id);
    public List<ReservationEntity> findByCottageByCottageId(CottageEntity cottageByCottageId);
}
