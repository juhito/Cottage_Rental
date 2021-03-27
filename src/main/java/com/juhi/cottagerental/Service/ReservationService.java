package com.juhi.cottagerental.Service;

import ch.qos.logback.classic.pattern.DateConverter;
import com.juhi.cottagerental.Data.ReservationData;
import com.juhi.cottagerental.Model.ReservationEntity;
import com.juhi.cottagerental.Repository.ReservationRepository;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Service;

import javax.persistence.Converter;

@Service("reservationService")
public class ReservationService {

    @Autowired
    ReservationRepository reservationRepository;

    public void reserve(ReservationData reservationData) throws Exception {
        ReservationEntity reservationEntity = new ReservationEntity();
        BeanUtils.copyProperties(reservationData, reservationEntity);
        System.out.println(reservationEntity.getUserId());
        System.out.println(reservationEntity.getCottageId());
        System.out.println("Saving reservation data...");

        reservationRepository.save(reservationEntity);
    }
}
